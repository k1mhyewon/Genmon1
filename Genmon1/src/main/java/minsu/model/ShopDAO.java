package minsu.model;

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

import common.util.security.AES256;
import common.util.security.SecretMyKey;

public class ShopDAO implements InterShopDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
		public ShopDAO() {
			
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

	
	// 매장정보를 보여주는 매소드
	@Override
	public Map<String, String> showShop(String city) throws SQLException {
		Map<String, String> showShop = new HashMap<String, String>();
		
		try {
				conn = ds.getConnection();
			
				String sql = " select sname, simg, sadr, stel, stime, sdesc "+
							 " from  tbl_shop_info_test "+
							 " where sname like '%' || ? || '%' ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, city);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			showShop.put("sname", rs.getString(1));
			showShop.put("simg", rs.getString(2));
			showShop.put("sadr", rs.getString(3));
			showShop.put("stel", rs.getString(4));
			showShop.put("stime", rs.getString(5));
			showShop.put("sdesc", rs.getString(6));
		} finally {
			close();
		}
		
		return showShop;
	}
	
	

}
