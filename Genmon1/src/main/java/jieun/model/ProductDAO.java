package jieun.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.AddImgVO;
import common.model.ChildProductVO;
import common.model.ParentProductVO;

public class ProductDAO implements InterProductDAO {

	//field
	private DataSource ds; // DataSource ds :  ds는데이타 소스 // 아파치 톰캣이 제공하는 DBCP(DB Connection Pool)이다. 풀장에 conn을 띄우기
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ProductDAO() {
		
		try {
		  Context initContext = new InitialContext();
		  Context envContext  = (Context)initContext.lookup("java:/comp/env");
		  ds = (DataSource)envContext.lookup("jdbc/semi_oracle");

		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
		
	// 사용한 자원 반납하는 close() 메소드 생성하기
	private void close() {
		//거꾸로 반납
		
		try {
			if(rs != null) { rs.close(); rs=null;}
			if(pstmt != null) { pstmt.close(); pstmt=null;}
			if(conn != null) { conn.close(); conn=null;} // connection풀링 기법 사용 : 웹은 싱클톤패턴기법 사용하면 메모리 부족해진다.
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	
	// 전체 한 페이지에 나오는 상품갯수에 따른 총 상품페이지 갯수 
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0; 
		
		try {
			
			conn = ds.getConnection();
			String sql = " select ceil(count(*)/?) from tbl_all_product_test ";
			
			// 서치단어 , 필터 넣기 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) ); // 한 페이지에 나오는 상품갯수 
			
			rs = pstmt.executeQuery();
			
			rs.next(); // 무조건 결과나온다. => if 할필요 없음 
			
			totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		
		return totalPage;
	}// public int getTotalPage(Map<String, String> paraMap) throws SQLException {}----------

	
	// 한 페이지마다 나오는 상품들 select 
	@Override
	public List<ChildProductVO> selectPagingProduct(Map<String, String> paraMap) throws SQLException {
		List<ChildProductVO> productList = new ArrayList<>();

		try {
			
			conn = ds.getConnection();

			String sql = " select pname, price, pcolor, pimage1 ,salePcnt ,pqty ,preleasedate,pnum "
						+ "from  "
						+ "( "
						+ "select row_number() over(order by pnum desc) AS RNO, pnum,"
						+ "       pname, price, pcolor, pimage1 ,salePcnt ,pqty ,to_char(preleasedate,'yyyy-mm-dd') as preleasedate "
						+ "from tbl_product_test P RIGHT JOIN tbl_all_product_test C "
						+ "on p.pid = c.fk_pid "
						+ ")A "
						+ "where RNO between ? and ? ";
			
			// ***** 서치단어 , 필터 넣기 ***** 

			// === 페이징처리의 공식 ===
			// where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수); 

			 int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			 int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) ); // 공식
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ChildProductVO cpvo = new ChildProductVO();
				ParentProductVO ppvo = new ParentProductVO();
				ppvo.setPname(rs.getString(1));
				ppvo.setPrice(rs.getInt(2));
//				ppvo.setPcontent(3);
				
				cpvo.setParentProvo(ppvo);
				cpvo.setPcolor(rs.getString(3));
				cpvo.setPimage1(rs.getString(4));
				cpvo.setSalePcnt(rs.getInt(5));
				cpvo.setPqty(rs.getInt(6));
				cpvo.setPreleasedate(rs.getString(7));
				cpvo.setPnum(rs.getInt(8));
				
				productList.add(cpvo);
			}// end of while(rs.next()) {}------------------
			
			
		} finally {
			close();
		}
		
		return productList ;
	}
	
	
	
	
	
	
	
}