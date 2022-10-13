package jihyun.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.PurchaseVO;
import common.util.security.AES256;
import common.util.security.SecretMyKey;

public class PurchaseDAO implements InterPurchaseDAO {
	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public PurchaseDAO() {
		
		try {
			Context initContext = new InitialContext(); // javax.naming import
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle"); // "jdbc/myoracle" 은 web.xml 에서 지정해둔 이름, context.xml 을 참조하고 있음
		    
		    aes = new AES256(SecretMyKey.KEY);// 우리가 만든 비밀키
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close매소드 생성하기=== //
		private void close() {
			
			try {
				
			if(rs != null)    {rs.close();     rs=null;}
			if(pstmt != null) {pstmt.close();  pstmt=null;}
			if(conn != null)  {conn.close();   conn=null;} // 이전까지는 conn을 싱글톤패턴기법으로 자원반납(close)을 하지 않았다
														   // 웹에서 싱글톤패턴기법을 사용하면 안된다 왜냐하면 이방법을 사용하면 용량아 딸리기때문이다.
			
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		////////////////////////////////////////////////////////////

		
		//결제 테이블에 insert 하기 
		@Override
		public int insertPurchase(PurchaseVO purvo) throws SQLException {
			
			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "insert into tbl_purchase_test(pk_purchaseid, fk_orderid, purchase_status, paymentAmount, method, usedCoin, usedPoint)\n"+
						"values(seq_tbl_purchase.nextval, ? , 0, ?, 2, ?, ?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, purvo.getFk_orderid());
				pstmt.setInt(2, purvo.getPaymentAmount());
				pstmt.setInt(3, purvo.getUsedCoin());
				pstmt.setInt(4, purvo.getUsedPoint());
				
				result = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
			return result;
		} // end of 결제 테이블에 insert 하기 

		
		
		// 결제 테이블에 insert 하기(카드)
		@Override
		public int insertCardPurchase(PurchaseVO purvo) throws SQLException {
			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "insert into tbl_purchase_test(pk_purchaseid, fk_orderid, purchase_status, paymentAmount, method, usedCoin, usedPoint, purchaseDate)\n"+
						"values(seq_tbl_purchase.nextval, ? , 1, ?, 1, ?, ?, sysdate)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, purvo.getFk_orderid());
				pstmt.setInt(2, purvo.getPaymentAmount());
				pstmt.setInt(3, purvo.getUsedCoin());
				pstmt.setInt(4, purvo.getUsedPoint());
				
				result = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
			return result;
		}// end of 결제 테이블에 insert 하기(카드)
				
				
		
		// 환불 정보 저장하기 위해서 결제 넘버 알아오기
		@Override
		public int findPurchaseNum(String orderid) throws SQLException {

			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "select pk_purchaseid\n"+
						"from tbl_purchase_test\n"+
						"where fk_orderid = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, orderid);
				rs = pstmt.executeQuery();
				
				rs.next();
				
				result = rs.getInt(1);
				
			} finally {
				close();
			}
			
			return result;
		} // 환불 정보 저장하기 위해서 결제 넘버 알아오기

		
		
		// 환불정보 저장(insert)하기
		@Override
		public int insertRefund(Map<String, String> paraMap)  throws SQLException{
			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "insert into tbl_refund_account_test (fk_purchaseid, bank, accnum, accname)\n"+
						"values (?,?,?,?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("fk_purchaseid"));
				pstmt.setString(2, paraMap.get("refundbank"));
				pstmt.setString(3, paraMap.get("refundacc"));
				pstmt.setString(4, paraMap.get("accname"));
				
				result = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
			return result;
		}// end of 환불정보 저장(insert)하기

		
		
		// 주문 상품에 대해 결제 내역 조회해오기 (현금결제라면 환불내역까지 가져와야함)
		@Override
		public HashMap<String, Object> SelectOnePurch(String orderid) throws SQLException {
			
			HashMap<String, Object> purvomap = new HashMap<String, Object>();
			
			try {
				conn = ds.getConnection();
				
				String sql = "select PURCHASE_STATUS, PAYMENTAMOUNT, USEDCOIN, USEDPOINT, BANK, ACCNUM, ACCNAME, purchaseDate \n"+
						"from tbl_purchase_test\n"+
						"left join tbl_refund_account_test\n"+
						" on PK_PURCHASEID = FK_PURCHASEID " +
						" where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderid);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				PurchaseVO purvo = new PurchaseVO();
				purvo.setStatus(rs.getInt(1));
				purvo.setPaymentAmount(rs.getInt(2));
				purvo.setUsedCoin(rs.getInt(3));
				purvo.setUsedPoint(rs.getInt(4));
				purvo.setPurchaseDate(rs.getString(8));
				
				purvomap.put("purvo", purvo);
				
				purvomap.put("bank", rs.getString(5));
				purvomap.put("accnum", rs.getString(6));
				purvomap.put("accname", rs.getString(7));
				
			} finally {
				close();
			}
			return purvomap;
		} // end of 주문 상품에 대해 결제 내역 조회해오기 (현금결제라면 환불내역까지 가져와야함)

		
		// 입금확인된 주문 결제상태 변경해주기
		@Override
		public int updatePurStatus(String orderid) throws SQLException {
			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = "update tbl_purchase_test set PURCHASE_STATUS = 1 \n"+
						" where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, orderid);
				
				result = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
			return result;
		}// end of  입금확인된 주문 결제상태 변경해주기

		
		
		
}
