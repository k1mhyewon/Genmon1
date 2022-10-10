package jieun.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



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

	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
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

			String sql = " with C as( "
						+ " select count(pk_order_detail_id) as psales , fk_pnum  "
						+ " from TBL_ORDER_DETAIL_TEST "
						+ " group by fk_pnum "
						+ " ), D as ( "
						+ " select row_number() over(order by pnum desc) AS RNO, pnum, "
						+ "       pname||'('||substr(pcolor,1,2)||')' as pname, price, pcolor, pimage1 ,salePcnt ,pqty , "
						+ "       to_char(preleasedate,'yyyy-mm-dd') as preleasedate, pinsertdate , panmaestate"
						+ " from tbl_product_test P RIGHT JOIN tbl_all_product_test C "
						+ "on p.pid = c.fk_pid "
						+ ") "
						+ " select pname, price, pcolor, pimage1, salePcnt, pqty, preleasedate, pnum, nvl(psales,0)as psales, panmaestate "
						+ " from C right join D "
						+ " on C.fk_pnum = d.pnum "
						+ " where RNO between ? and ? "
						+ " order by pinsertdate desc ";
			
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

				String pname = rs.getString(1);
				int price = rs.getInt(2);
				String pcolor = rs.getString(3);
				String pimage1 = rs.getString(4);
				int salePcnt = rs.getInt(5);
				int pqty = rs.getInt(6);
				String preleasedate = rs.getString(7);
				int pnum = rs.getInt(8);
				int psales = rs.getInt(9);
				int panmaestate = rs.getInt(10);
				
				ChildProductVO cpvo = new ChildProductVO();
				ParentProductVO ppvo = new ParentProductVO();
				
				ppvo.setPname(pname);
				ppvo.setPrice(price);
//				ppvo.setPcontent(3);
				
				cpvo.setParentProvo(ppvo);
				cpvo.setPcolor(pcolor);
				cpvo.setPimage1(pimage1);
				cpvo.setSalePcnt(salePcnt);
				cpvo.setPqty(pqty);
				cpvo.setPreleasedate(preleasedate);
				cpvo.setPnum(pnum);
				cpvo.setPsales(psales); // 0 이상 
				cpvo.setPanmaestate(panmaestate); // 0 이상 
//				
				productList.add(cpvo);
			}// end of while(rs.next()) {}------------------
			
			
		} finally {
			close();
		}
		
		return productList ;
	}// end of public List<ChildProductVO> selectPagingProduct(Map<String, String> paraMap) throws SQLException {}---------------

	
	
	// 등록된 컬러네임들 뿌려주기
	@Override
	public List<HashMap<String, String>> selectAllColors() throws SQLException {
		List<HashMap<String, String>> colorList = new ArrayList<>();
		try {
			
			conn = ds.getConnection();
			
			String sql = " select distinct pcolor "
						+ " from tbl_all_product_test ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> paraMap = new HashMap<>();
				paraMap.put("pcolor", rs.getString(1));
				colorList.add(paraMap);
			}
		} finally {
			close();
		}
		return colorList;
	}// end of 	public List<HashMap<String, String>> selectAllColors() throws SQLException {}----

	
	// 등록된 재질명들 뿌려주기
	@Override
	public List<HashMap<String, String>> selectAllMaterials() throws SQLException {
		List<HashMap<String, String>> materialList = new ArrayList<>();
		try {
			
			conn = ds.getConnection();
			
			String sql = " select distinct pmaterial "
						+ " from tbl_product_test ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> paraMap = new HashMap<>();
				paraMap.put("pmaterial", rs.getString(1));
				materialList.add(paraMap);
			}
		} finally {
			close();
		}
		return materialList;
	}// end of public List<HashMap<String, String>> selectAllMaterials() throws SQLException {}----------------

	// 제품 부모테이블 pid 채번해오기
	public String getPidParentProduct() throws SQLException {
		String pid = "";
		
		try {
			conn = ds.getConnection();
			
			String sql = " select 'p_'||seq_tbl_product_pid.nextval "
						+ " from dual ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			pid = rs.getString(1);
			
		} finally {
			close();
		}
		return pid ;
		
	}//end of public int getPnumChildProduct() throws SQLException {}------------

	// 제품 자식테이블 pnum 채번해오기
	public int getPnumChildProduct() throws SQLException {
		int pnum = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select seq_tbl_all_product_pnum.nextval "
						+ " from dual ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			pnum = rs.getInt(1);
			
		} finally {
			close();
		}
		return pnum ;
		
	}//end of public int getPnumChildProduct() throws SQLException {}------------

	
	// 제품부모 insert
	public int insertParentProduct(ParentProductVO ppvo) throws SQLException {
		
		int n = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " insert into tbl_product_test(pid, pname, price, pcontent, pmaterial) "
	         			+ " values (?,?,?,?,?)";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, ppvo.getPid());
	         pstmt.setString(2, ppvo.getPname());
	         pstmt.setInt(3, ppvo.getPrice());    
	         pstmt.setString(4, ppvo.getPcontent()); 
	         pstmt.setString(5, ppvo.getPmaterial());    

	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return n;   
	}// end of public int insertParentProduct(ParentProductVO ppvo) throws SQLException {}---------------
	
	// 제품자식 insert
	public int insertChildProduct(ChildProductVO cpvo) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into tbl_all_product_test(pnum, fk_pid , pcolor , pimage1 , salePcnt ,pqty, preleasedate ) "
						+ " values (?, ?, ?, ?, ?, ?, ?) ";
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cpvo.getPnum());
			pstmt.setString(2, cpvo.getFk_pid());
			pstmt.setString(3, cpvo.getPcolor());    
			pstmt.setString(4, cpvo.getPimage1()); 
			pstmt.setInt(5, cpvo.getSalePcnt());    
			pstmt.setInt(6, cpvo.getPqty()); 
			pstmt.setString(7, cpvo.getPreleasedate());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return result;   
	}// end of public int insertChildProduct(ChildProductVO cpvo) throws SQLException {}-----------------

	
	// 상품상세이미지 insert
	@Override
	public int insetProdDetailimage(String imgfilename, int pnum) throws SQLException {
		int result = 0;
		try {
			conn = ds.getConnection();

			String sql = " insert into tbl_product_imagefile_test(imgfileno, fk_pnum, imgfilename) "
						+ " values (seqImgfileno.nextval, ?, ?) ";
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pnum);
			pstmt.setString(2, imgfilename);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return result;   
	}// end of public void insetProdDetailimage(String imgfilename, int pnum) throws SQLException {}---------------

	
	// pname 뿌려주기 
	@Override
	public List<HashMap<String, String>> isExistPname() throws SQLException {
		List<HashMap<String, String>> pnameList = new ArrayList<>();
		try {
			
			conn = ds.getConnection();
			
			String sql = " select pname "
						+ " from tbl_product_test ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> paraMap = new HashMap<>();
				paraMap.put("pname", rs.getString(1));
				pnameList.add(paraMap);
			}
		} finally {
			close();
		}
		return pnameList;
	}// end of 	public List<HashMap<String, String>> isExistPname() throws SQLException {}---------

	
	
	// pname 으로 pid 찾기
	@Override
	public String findPidParentProduct(String pname) throws SQLException{
		String pid = "";
		try {
			
			conn = ds.getConnection();
			
			String sql = " select pname "
						+ " from tbl_product_test "
						+ " where pname = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pname);
			rs = pstmt.executeQuery();
			
			rs.next();
			pid = rs.getString(1);
			
		} finally {
			close();
		}
		return pid;
	}// end of public String findPidParentProduct(String pname) throws SQLException{}-----------

	
	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
	@Override
	public ChildProductVO selectOneProductByPnum(String pnum) throws SQLException {
		//		get방식이므로 유저가 장난칠수있으므로 
		ChildProductVO cpvo = null;

		try {
			 conn = ds.getConnection();
			
			 String sql = " select pname, price, pcolor, pimage1 ,salePcnt ,pqty, to_char(preleasedate,'yyyy-mm-dd') as preleasedate, pmaterial, pcontent, Panmaestate "
				 		+ " from tbl_product_test P RIGHT JOIN tbl_all_product_test C "
				 		+ " on p.pid = c.fk_pid  "
				 		+ " where pnum = ?  "; 
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, pnum);
			 			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 String pname = rs.getString(1);     // "HIT", "NEW", "BEST" 값을 가짐 
				 int    price = rs.getInt(2);        // 제품번호
				 String pcolor = rs.getString(3);     // 제품명
				 String pimage1 = rs.getString(4);  // 제조회사명
				 int    salePcnt = rs.getInt(5);        // 제품 정가
				 int    pqty = rs.getInt(6);         // 제품 재고량
				 String preleasedate = rs.getString(7);  // 제품이미지2
				 String pmaterial = rs.getString(8);  // 제품이미지1
				 String pcontent = rs.getString(9);  // 제품설명
				 int Panmaestate = rs.getInt(10);  // 제품설명
				 
				 cpvo = new ChildProductVO(); 
				 
				 ParentProductVO ppvo = new ParentProductVO();
				 ppvo.setPname(pname);
				 ppvo.setPcontent(pcontent);
				 ppvo.setPmaterial(pmaterial);
				 ppvo.setPrice(price);
				 
				 cpvo.setParentProvo(ppvo);
				 
				 cpvo.setPcolor(pcolor);
				 cpvo.setPimage1(pimage1);
				 cpvo.setSalePcnt(salePcnt);
				 cpvo.setPnum(Integer.parseInt(pnum));
				 cpvo.setPreleasedate(preleasedate);
				 cpvo.setPanmaestate(Panmaestate);
				 cpvo.setPqty(pqty);
				 
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		return cpvo;		
	}// end of public ChildProductVO selectOneProductByPnum(String pnum) throws SQLException {}----------

	
	// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
	@Override
	public List<String> getImagesByPnum(String pnum) throws SQLException {
		List<String> imgList = new ArrayList<>(); // 없으면 size 0 일테니가
		try {
			conn = ds.getConnection();
			
			String sql = " select imgfilename "
					   + " from tbl_product_imagefile_test "
					   + " where fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pnum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String imgfilename = rs.getString(1); // 이미지파일명 
				imgList.add(imgfilename);
			}// end of while-------------------
			
		} finally {
			close();
		}
		
		return imgList;
	}// end of public List<String> getImagesByPnum(String pnum) throws SQLException {}-------------------

	// 상품 판매상태 판매중지로 변경 
	public void updateProdStopState(String pnum) throws SQLException {
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_all_product_test set panmaestate = 0 "
						+ " where pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(pnum)); // 공식 

			rs = pstmt.executeQuery();
			
		} finally {
			close();
		}
		
	}
	
	
	
	
	
	
	
}
