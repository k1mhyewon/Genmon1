package minji.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.model.AddImgVO;

public class ImageDAO implements InterImageDAO {
	
	//field
	private DataSource ds; // DataSource ds :  ds는데이타 소스 // 아파치 톰캣이 제공하는 DBCP(DB Connection Pool)이다. 풀장에 conn을 띄우기
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ImageDAO() {
		
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
	
	// pnum을 가지고 상품 추가이미지들을 가져오는 메소드
	@Override
	public List<AddImgVO> selectAllImages(String pnum) throws SQLException {
		
		List<AddImgVO> imgList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select IMGFILENAME\n"+
					"from tbl_product_imagefile_test\n"+
					"where fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AddImgVO ivo = new AddImgVO();
				ivo.setImgfilename(rs.getString(1));
				
				imgList.add(ivo);
			}
			
			
		} finally {
			close();
		}
		
		return imgList;
	} // end of  pnum을 가지고 상품 추가이미지들을 가져오는 메소드

		
}
