package jihyun.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.CartVO;
import common.model.ChildProductVO;
import common.model.OrderDetailVO;
import common.model.OrderVO;
import common.model.ParentProductVO;
import common.util.security.AES256;
import common.util.security.SecretMyKey;

public class OrderDAO implements InterOrderDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public OrderDAO() {
		
		try {
			Context initContext = new InitialContext(); // javax.naming import
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle"); // "jdbc/myoracle" 은 web.xml 에서 지정해둔 이름, context.xml 을 참조하고 있음
		    
		    aes = new AES256(SecretMyKey.KEY);
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		
		try {
			if( rs != null )    { rs.close();    rs=null; }
			if( pstmt != null ) { pstmt.close(); pstmt=null; }
			if( conn != null )  { conn.close();  conn=null; }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}


	// 회원 주문하기 insert (부모)
	@Override
	public int insertOrderMember(OrderVO ovo) throws SQLException {
		int result =0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into TBL_ORDER_TEST (pk_orderid, fk_userid, email, name, postcode, address, detailaddress, extraaddress, mobile)\n"+
					"values (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_order.nextval, 4, 0),?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ovo.getFk_userid());
			pstmt.setString(2, aes.encrypt(ovo.getEmail()));
			pstmt.setString(3, ovo.getName());
			pstmt.setString(4, ovo.getPostcode());
			pstmt.setString(5, ovo.getAddress());
			pstmt.setString(6, ovo.getDetailaddress());
			pstmt.setString(7, ovo.getExtraaddress());
			pstmt.setString(8, aes.encrypt(ovo.getMobile()));
			
			result = pstmt.executeUpdate();
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
	} // end of 회원 주문하기 insert (부모)


	
	// 비회원 주문하기 insert (부모)
	@Override
	public int insertOrderGuest(OrderVO ovo) throws SQLException {
int result =0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into TBL_ORDER_TEST (pk_orderid,  email, name, postcode, address, detailaddress, extraaddress, mobile)\n"+
					"values (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_order.nextval, 4, 0),?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aes.encrypt(ovo.getEmail()));
			pstmt.setString(2, ovo.getName());
			pstmt.setString(3, ovo.getPostcode());
			pstmt.setString(4, ovo.getAddress());
			pstmt.setString(5, ovo.getDetailaddress());
			pstmt.setString(6, ovo.getExtraaddress());
			pstmt.setString(7, aes.encrypt(ovo.getMobile()));
			
			result = pstmt.executeUpdate();
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
			e.printStackTrace();
		}  finally {
			close();
		}
		
		
		return result;
	} // end of 비회원 주문하기 insert (부모)


	
	// 방금 insert 한 주문번호 알아오기
	@Override
	public String findOrderid() throws SQLException {
		String orderid = "";
		
		try {
			conn = ds.getConnection();
			
			String sql = "select TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_tbl_order.currval, 4, 0)\n"+
					"from dual";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			orderid = rs.getString(1);
			
		} finally {
			close();
		}
		
		return orderid;
	}// end of 방금 insert 한 주문번호 알아오기

	

	// 회원/비회원 주문하기 상세 insert (자식)
	@Override
	public int isertOrderDetail(CartVO cvo, String orderid)  throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_order_detail_test (pk_order_detail_id, fk_orderid, fk_pnum, order_price)\n"+
					"values (?||seq_tbl_order_detail.nextval, ?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			pstmt.setString(2, orderid);
			pstmt.setInt(3, cvo.getFk_pnum());
			
			// 세일이 있다면 세일가로
			if(cvo.getAllProdvo().getSalePcnt()!=0) {
				int price = cvo.getAllProdvo().getParentProvo().getPrice() * (100 - cvo.getAllProdvo().getSalePcnt() )/ 100;
				pstmt.setInt(4, price);
			} else { // 없다면 원가로
				pstmt.setInt(4, cvo.getAllProdvo().getParentProvo().getPrice());
			}
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		
		return result;
	}// end of 회원/비회원 주문하기 상세 insert (자식)


	
	// 회원 아이디 가지고 주문내역 리스트로 보여주기
	@Override
	public List<HashMap<String,String>> selectOrderList(String userid) throws SQLException {
		
		List<HashMap<String,String>> mapList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			// 주문 정보 알아오기
			String sql = "select PK_ORDERID, purchase_status, to_char(ORDERDATE)  \n"+
					"from\n"+
					"    (select PK_ORDERID, ORDERDATE\n"+
					"    from tbl_order_test \n"+
					"    where fk_userid = ? )\n"+
					"join tbl_purchase_test\n"+
					" on PK_ORDERID = FK_ORDERID  "+
					" order by PK_ORDERID desc ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String orderid = rs.getString(1);
				String purchase_status = String.valueOf(rs.getInt(2)) ;
				String orderdate = rs.getString(3);
				
				HashMap<String, String> map = new HashMap<>();
				map.put("orderid", orderid);
				map.put("purchase_status", purchase_status );
				map.put("orderdate", orderdate);
				
				/*
				// 주문 수량 구해오기
				String sql2 = "select count(PK_ORDER_DETAIL_ID)\n"+
						"       from tbl_order_detail_test\n"+
						"       where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, map.get("orderid"));
				
				rs = pstmt.executeQuery();
				rs.next();
				map.put("totalqty", rs.getString(1));
				
				
				// 대표이미지 담기
				sql2 = "select PIMAGE1 \n"+
						"from tbl_all_product_test\n"+
						"join tbl_order_detail_test\n"+
						"on PNUM = fk_PNUM\n"+
						"where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, map.get("orderid"));
				
				rs = pstmt.executeQuery();
				rs.next();
				map.put("image", rs.getString(1));
				*/
				mapList.add(map);
			}
			
			for(HashMap<String,String> map :mapList) {
				
				// 총 주문 수량 세어주고
				sql = "select count(PK_ORDER_DETAIL_ID)\n"+
						"       from tbl_order_detail_test\n"+
						"       where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("orderid"));
				
				rs = pstmt.executeQuery();
				rs.next();
				map.put("totalqty", rs.getString(1));
				
				
				// 썸네일 찾아준다
				sql = "select PIMAGE1 \n"+
						"from tbl_all_product_test\n"+
						"join tbl_order_detail_test\n"+
						"on PNUM = fk_PNUM\n"+
						"where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("orderid"));
				
				rs = pstmt.executeQuery();
				rs.next();
				map.put("image", rs.getString(1));
			}
			
		} finally {
			close();
		}
		return mapList;
	} // 회원 아이디 가지고 주문내역 리스트로 보여주기


	// 넘어온 주문번호로 주문 조회하기 (회원용)
	@Override
	public OrderVO selectOneOrder(long orderid) throws SQLException {
		
		OrderVO ordervo = null;
		try {
			conn = ds.getConnection();
			
			String sql = "select PK_ORDERID, FK_USERID, EMAIL, NAME, POSTCODE, ADDRESS, DETAILADDRESS, EXTRAADDRESS, MOBILE, to_char(ORDERDATE) \n"+
					"from tbl_order_test\n"+
					"where PK_ORDERID = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ordervo = new OrderVO();
				ordervo.setPk_orderid(rs.getString(1));
				ordervo.setEmail( aes.decrypt(rs.getString(3)) );
				ordervo.setName(rs.getString(4));
				ordervo.setPostcode(rs.getString(5));
				ordervo.setAddress(rs.getString(6));
				ordervo.setDetailaddress(rs.getString(7));
				ordervo.setExtraaddress(rs.getString(8));
				ordervo.setMobile( aes.decrypt(rs.getString(9)));
				ordervo.setOrderDate(rs.getString(10));
				ordervo.setFk_userid(rs.getString(2));

			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return ordervo;
	} // end of  넘어온 주문번호로 주문 조회하기 (회원용)
	
	
	
	
	// 넘어온 주문번호로 !!! 주문 상세 !!! 조회하기  (회원용)
	@Override
	public List<OrderDetailVO> selectOneOrderDetail(long orderid) throws SQLException {
		
		List<OrderDetailVO> orddtailList = new ArrayList<>() ;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select PK_ORDER_DETAIL_ID, FK_PNUM, ORDER_STATUS, ORDER_PRICE, PNAME, PRICE, FK_PID, PCOLOR, PIMAGE1, SALEPCNT, PQTY\n"+
					"from\n"+
					"(\n"+
					"    select PNAME, PRICE, PNUM, FK_PID, PCOLOR, PIMAGE1, SALEPCNT, PQTY\n"+
					"    from tbl_product_test\n"+
					"    join\n"+
					"    tbl_all_product_test\n"+
					"    on pid = fk_pid\n"+
					")\n"+
					"join\n"+
					"(\n"+
					"    select PK_ORDER_DETAIL_ID, FK_PNUM, ORDER_STATUS, ORDER_PRICE\n"+
					"    from tbl_order_detail_test\n"+
					"    where FK_ORDERID = ?\n"+
					")\n"+
					"on pnum = fk_pnum\n"+
					"order by PK_ORDER_DETAIL_ID";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDetailVO orddtailvo = new OrderDetailVO();
				
				orddtailvo.setPk_order_detail_id(rs.getString(1));
				orddtailvo.setFk_pnum(rs.getInt(2));
				orddtailvo.setOrder_status(rs.getInt(3));
				orddtailvo.setOrder_price(rs.getInt(4));
				
				ParentProductVO ppvo = new ParentProductVO();
				ppvo.setPname(rs.getString(5));
				ppvo.setPrice(rs.getInt(6));
				
				ChildProductVO cpvo = new ChildProductVO();
				cpvo.setParentProvo(ppvo);
				
				cpvo.setFk_pid(rs.getString(7));
				cpvo.setPcolor(rs.getString(8));
				cpvo.setPimage1(rs.getString(9));
				cpvo.setSalePcnt(rs.getInt(10));
				cpvo.setPqty(rs.getInt(11));
				
				orddtailvo.setCpvo(cpvo);
				
				orddtailList.add(orddtailvo);
			}
			
		}  finally {
			close();
		}
		
		return orddtailList ;
	}// end of 넘어온 주문번호로 !!! 주문 상세 !!!  조회하기  (회원용) 


	
	
	
	
}
