package minji.model;

import java.sql.*;

import java.util.*;

import javax.naming.*;

import javax.sql.DataSource;

import common.model.*;


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

	// 상품 전체를 셀렉해와서 리스트로 뿌려주는 메소드
	@Override
	public List<ChildProductVO> selectAllProduct() throws SQLException {
		List<ChildProductVO> productList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select pname, pnum, price, pcolor, pimage1, salePcnt, pqty \n"+
					"from tbl_product_test\n"+
					"JOIN tbl_all_product_test \n"+
					"ON pid = fk_pid";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChildProductVO cvo =new ChildProductVO();
				
				cvo.setPnum(rs.getInt("pnum"));
				cvo.setSalePcnt(rs.getInt("salePcnt"));
				cvo.setPqty(rs.getInt("pqty"));
				
				ParentProductVO ppvo = new ParentProductVO();
				ppvo.setPname(rs.getString("pname"));
				ppvo.setPrice(rs.getInt("price"));
				
				cvo.setParentProvo(ppvo); // JOIN
				
				cvo.setPcolor(rs.getString("pcolor")); 
				cvo.setPimage1(rs.getString("pimage1"));
				
				productList.add(cvo); 
			}
			
		} finally {
			close();
		}
		
		return productList;
	}// end of 상품 전체를 셀렉해와서 리스트로 뿌려주는 메소드

	
	
	// pnum을 가지고 상품 디테일을 알아오는 메소드 
	@Override
	public ChildProductVO selectOneDetail(String pnum) throws SQLException {
		
		ChildProductVO cpvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select pnum, fk_pid ,pcolor ,pimage1,salePcnt,pname,price ,pcontent,  pmaterial, pqty\n "+
					" from tbl_product_test\n "+
					" JOIN tbl_all_product_test \n "+
					" ON pid = fk_pid\n "+
					" where pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cpvo =new ChildProductVO();
				
				cpvo.setPnum(rs.getInt("pnum"));
				cpvo.setFk_pid(rs.getString("fk_pid"));
				cpvo.setPcolor(rs.getString("pcolor"));
				cpvo.setPimage1(rs.getString("pimage1"));
				cpvo.setSalePcnt(rs.getInt("salePcnt"));
				cpvo.setPqty(rs.getInt("pqty"));
				
				ParentProductVO ppvo = new ParentProductVO();
				ppvo.setPname(rs.getString("pname"));
				ppvo.setPrice(rs.getInt("price"));
				ppvo.setPcontent(rs.getString("pcontent"));
				ppvo.setPmaterial(rs.getString("pmaterial"));
				
				cpvo.setParentProvo(ppvo);
				
			}
			
		} finally {
			close();
		}
		
		return cpvo;
	}// pnum을 가지고 상품 디테일을 알아오는 메소드 

	
	
	// 색깔이 다른 동일 제품들 조회해오기 
	@Override
	public List<ChildProductVO> SelectSameProduct(Map<String, String> paraMap) throws SQLException {
		
		List<ChildProductVO> productList = new ArrayList<>();
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " select pimage1, pnum \n "+
						" from tbl_all_product_test\n "+
						" where FK_PID = ?  ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("fk_pid"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChildProductVO cpvo =new ChildProductVO();
				
				cpvo.setPimage1(rs.getString(1));
				cpvo.setPnum(rs.getInt(2));
		
				productList.add(cpvo);
			}
			
		} finally {
			close();
		}
		
		return productList;
		
	}// end of 색깔이 다른 동일 제품들 조회해오기 

	
	// 상품 리스트 페이지에서 간략보기 누르면 전체 상품의 이미지들만 나오는 상픔심플리스트 메소드 
	@Override
	public List<ChildProductVO> simpleAllProduct() throws SQLException{
		
		List<ChildProductVO> simpleList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select pnum, fk_pid, pimage1\n "+
						 " from tbl_all_product_test ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ChildProductVO simpleCvo = new ChildProductVO();
				
				simpleCvo.setPnum(rs.getInt("pnum"));
				simpleCvo.setFk_pid(rs.getString("fk_pid"));
				simpleCvo.setPimage1(rs.getString("pimage1"));
				
				simpleList.add(simpleCvo); 
			}
			
		} finally {
			close();
		}

		return simpleList;
	}

	
	// color와 material이 동일한 추천제품 가져오기 
	@Override
	public List<ChildProductVO> recommendProduct(Map<String, String> map) throws SQLException {
		
		List<ChildProductVO> recomList = new ArrayList<>();
		 
		try { 
			
			conn = ds.getConnection();
		 
			String sql = " select distinct pnum, pname, fk_pid, price, pcolor, pimage1, pmaterial\r\n "
						+ " from\r\n "
						+ " (select row_number() over(order by pnum desc) AS RNO \r\n "
						+ " ,pnum, pname, fk_pid, price, pcolor, pimage1, pmaterial\r\n "
						+ " from tbl_all_product_test\r\n "
						+ " JOIN tbl_product_test\r\n "
						+ " ON fk_pid = pid\r\n "
						+ " where pcolor= ? or pmaterial=? and fk_pid != ? \r\n "
						+ " )\r\n "
						+ " where RNO <= 5 ";
		
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, map.get("pcolor"));
			pstmt.setString(2, map.get("pmaterial")); 
			pstmt.setString(3, map.get("fk_pid"));
			
			rs = pstmt.executeQuery();
			 
			while(rs.next()) { 
				
			ChildProductVO recomcvo = new ChildProductVO();
			 
			recomcvo.setPnum(rs.getInt("pnum"));
			recomcvo.setFk_pid(rs.getString("fk_pid"));
			recomcvo.setPcolor(rs.getString("pcolor"));
			recomcvo.setPimage1(rs.getString("pimage1"));
		
			ParentProductVO ppvo = new ParentProductVO();
			ppvo.setPname(rs.getString("pname")); 
			ppvo.setPrice(rs.getInt("price"));
			ppvo.setPmaterial(rs.getString("pmaterial"));
		
			recomcvo.setParentProvo(ppvo);
			
			recomList.add(recomcvo);
			
			}
			 
		} finally { 
			
			close(); 
		
		}
		return recomList; 
		
		}
	
	
	
	// 필터로 선택한 항목에 해당되는 상품 가져오는 메소드 
	@Override
	public List<ChildProductVO> selectProductList(Map<String, String> paraMap) throws SQLException {
		
		 List<ChildProductVO> filterProductList  = new ArrayList<>();
		
			try {
				conn = ds.getConnection();
				
				String where = "";
				String order = "";
				
				if( "".equals(paraMap.get("color")) && "".equals(paraMap.get("material")) ) {
					
				}
				else if( !"".equals(paraMap.get("color"))  && "".equals(paraMap.get("material")) ){
					where = " where pcolor in('"+ String.join("||','||", paraMap.get("color").split(","))+"') ";
				}
				else if( "".equals(paraMap.get("color"))  && !"".equals(paraMap.get("material")) ){
					where = " where PMATERIAL in('"+ String.join("||','||", paraMap.get("material").split(","))+"') ";

				}
				else if( !"".equals(paraMap.get("color"))  && !"".equals(paraMap.get("material")) ){
					where = " where pcolor in('"+ String.join("||','||", paraMap.get("color").split(","))+"') and PMATERIAL in('"+ String.join("||','||", paraMap.get("material").split(","))+"') ";
				}
			
				
				if("1".equals(paraMap.get("order")) ) {
					order = " order by PRELEASEDATE desc ";
				}
				else if("2".equals(paraMap.get("order")) ) {
					order = " order by price asc ";
				}
				else if("3".equals(paraMap.get("order")) ) {
					order = " order by price desc ";
				}
				
				
				
				
				String sql = "select pname, pnum, price, pcolor, pimage1, salePcnt, pqty, pmaterial\n "+
							" from tbl_product_test\n "+
							" JOIN tbl_all_product_test\n "+
							" on pid = fk_pid\n "+ 
						 	 where + // 변수
							 order ;
				
				
				pstmt = conn.prepareStatement(sql);
				
				/*
				  if( "".equals(paraMap.get("color")) && "".equals(paraMap.get("material")) ) {
				  
				  } else if( !"".equals(paraMap.get("color")) &&
				  "".equals(paraMap.get("material")) ){ pstmt.setString(1,
				  paraMap.get("pcolor")); } else if( "".equals(paraMap.get("color")) &&
				  !"".equals(paraMap.get("material")) ){ pstmt.setString(2,
				  paraMap.get("pmaterial"));
				  
				  } else if( !"".equals(paraMap.get("color")) &&
				  !"".equals(paraMap.get("material")) ){ pstmt.setString(1,
				  paraMap.get("pcolor")); pstmt.setString(2, paraMap.get("pmaterial")); }
				 */
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ChildProductVO cvo =new ChildProductVO();
					
					cvo.setPnum(rs.getInt("pnum"));
					cvo.setSalePcnt(rs.getInt("salePcnt"));
					cvo.setPqty(rs.getInt("pqty"));
					
					ParentProductVO ppvo = new ParentProductVO();
					ppvo.setPname(rs.getString("pname"));
					ppvo.setPrice(rs.getInt("price"));
					ppvo.setPmaterial(rs.getString("pmaterial"));
					
					cvo.setParentProvo(ppvo); // JOIN
					
					cvo.setPcolor(rs.getString("pcolor")); 
					cvo.setPimage1(rs.getString("pimage1"));
					
					filterProductList.add(cvo); 
				}
				
			} finally {
				close();
			}
			
		return filterProductList;
	}

	// 상품 전체 개수 알아온다.
	// Ajax(JSON)를 사용하여 상품목록을 스크롤 방식으로 페이징처리 해주기 위해 제품의 전체개수 알아오기 // 
	@Override
	public int totalPspecCount(String pnum) throws SQLException {
		
		int totalCount = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(pnum) AS count \r\n "
						+ " from tbl_product_test\r\n "
						+ " join tbl_all_product_test\r\n "
						+ " on fk_pid = pid ";
		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalCount = rs.getInt("count");
			
		} finally {
			close();
		}
		return totalCount;
	}

	// ajax를 이용해서 상품 8개씩 잘라 스크롤 방식으로 띄워주기
	@Override
	public List<ChildProductVO> selectDisplay(Map<String, String> paraMap)throws SQLException {

		List<ChildProductVO> displayList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select pnum, pname, price, pcolor, pimage1, salePcnt, pqty, preleasedate, panmaestate\r\n "
						+ " from\r\n "
						+ " (select row_number() over(order by pnum desc) AS RNO \r\n "
						+ " ,pnum, pname, price, pcolor, pimage1, salePcnt, pqty, preleasedate, panmaestate\r\n "
						+ " from tbl_all_product_test\r\n "
						+ " JOIN tbl_product_test\r\n "
						+ " ON fk_pid = pid\r\n "
						+ " where PANMAESTATE = ?\r\n "
						+ " )\r\n "
						+ " where RNO between ? and ? ";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("panmaestate"));
			pstmt.setString(2, paraMap.get("start"));
			pstmt.setString(3, paraMap.get("end"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ChildProductVO cpvo =new ChildProductVO();
				
				cpvo.setPnum(rs.getInt("pnum"));
				cpvo.setSalePcnt(rs.getInt("salePcnt"));
				cpvo.setPqty(rs.getInt("pqty"));
				cpvo.setPcolor(rs.getString("pcolor")); 
				cpvo.setPimage1(rs.getString("pimage1"));
				cpvo.setPreleasedate(rs.getString("preleasedate"));
				cpvo.setPanmaestate(rs.getInt("panmaestate"));
				
				ParentProductVO ppvo = new ParentProductVO();
				ppvo.setPname(rs.getString("pname"));
				ppvo.setPrice(rs.getInt("price"));
				
				cpvo.setParentProvo(ppvo); // JOIN
				
				displayList.add(cpvo);
				
			}// end of while
		}finally {
			close();
		}
		return displayList;
	}

	
	
}
