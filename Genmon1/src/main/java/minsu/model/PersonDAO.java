package minsu.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

import common.model.MemberVO;
import common.util.security.*;
import util.security.Sha256;

public class PersonDAO implements InterPersonDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
		
	// 생성자 - DB커넥션풀이란.txt 에서 9번 붙여넣은것
	public PersonDAO() {
		
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

	
	// 회원가입을 해주는 매소드(tbl_member_test 테이블 insert)
	@Override
	public int registerMember(MemberVO member) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_member_test(userid, pwd, name, email, mobile, gender, birthday) "+
					 " values(?, ?, ?, ?, ?, ?, ?) ";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getUserid() );
			pstmt.setString(2, Sha256.encrypt(member.getPwd()) );  // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.(단방향 암호화은 한번 암호화하면 해독불가. 복호화불가. )
			pstmt.setString(3, member.getName());
			pstmt.setString(4, aes.encrypt(member.getEmail()) );  // 이메일을 AES256 알고리즘으로 양방향 암호화 시킨다.(양방향 암호화은 한번 암호화하면 해독불가. 복호화가능)
			pstmt.setString(5, aes.encrypt(member.getMobile()) ); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시킨다.(양방향 암호화은 한번 암호화하면 해독불가. 복호화가능)
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getBirthday());
			
			result = pstmt.executeUpdate();
				
		} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	} // end of public int registerMember(MemberVO member) throws SQLException
	

	// === 아이디가 중복되었는지 알아오는 메소드 === 
	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {
		
		boolean isExists = false;
		
		try {
		 	conn = ds.getConnection();
			
			String sql = " select userid "
						+" from tbl_member_test"
						+" where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			isExists = rs.next(); // 결과물. 행이 있으면(중복된 userid) true, 행이 없으면 false(사용가능한 userid)가 나온다.
			
		} finally {
			close();
		}
		
		return isExists;
	} // end of public boolean idDuplicateCheck(String userid) throws SQLException---------------------------------
	
	
	
	
	
	
	// === 회원의 코인 및 포인트 변경하기 === 
		@Override
		 public int coinUpdate(Map<String, String> paraMap) throws SQLException {

	        int result = 0;
	        
	        try {
	          conn = ds.getConnection();
	          
	          String sql = " update tbl_member_test set coin = coin + ? , point = point + ? "
	                    + " where userid = ? ";
	          
	          pstmt = conn.prepareStatement(sql);
	          
	          pstmt.setInt(1, Integer.parseInt(paraMap.get("coinmoney")) );
	          pstmt.setInt(2, (int)(Integer.parseInt(paraMap.get("coinmoney")) * 0.01) );  // 포인트. 금액의 1%==> ___.0으로 나오는 double타입을 int로 바꿔 소수부를 절삭
	          																			 // 예) 300000 *0.01 ==> (int)3000.0 ==> 3000
	          pstmt.setString(3, paraMap.get("userid"));
	          
	          result = pstmt.executeUpdate();

			} finally {
				close();
			}
	        
			return result;
		}// end of public int coinUpdate(Map<String, String> paraMap) throws SQLException-------


		
		
		// === 비밀번호가 맞는지 확인하는 메소드 === // 
		@Override
		public boolean ispasswdCheck(Map<String, String> paraMap)throws SQLException {
			
			boolean ispasswdCheck = false;
			
			try {
				
				conn = ds.getConnection();
				
				String sql = " select userid "+
							 " from tbl_member_test "+
							 " where userid = ? and pwd = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) );
				
				rs = pstmt.executeQuery();
				
				ispasswdCheck = rs.next();

			} finally {
				close();
			}
			return ispasswdCheck;
		} // end of public boolean pwdCheck(Map<String, String> paraMap)throws SQLException  -----------------------------------------


		// === DB에 주소 추가 및 변경하는 메소드 === // 
		@Override
		public int addAdreess(Map<String, String> paraMap) throws SQLException {
			
			int result = 0;
			
			try {
				
				conn = ds.getConnection();
				
				String sql = " update tbl_member_test set postcode = ?, address = ?, detailaddress = ?, extraaddress = ? "+
						 	" where userid = ? ";

			         pstmt = conn.prepareStatement(sql);
			         pstmt.setString(1, paraMap.get("postcode"));
			         pstmt.setString(2, paraMap.get("address"));
			         pstmt.setString(3, paraMap.get("detailaddress"));
			         pstmt.setString(4, paraMap.get("extraaddress"));
			         pstmt.setString(5, paraMap.get("userid"));
			         
			         result = pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }
		      
		      return result;   
			
		} // end of public int addAdreess(Map<String, String> paraMap) throws SQLException

		
		// === 주소를 삭제하는 메소드 생성하기 === //
			@Override
			public int adrDelete(Map<String, String> paraMap)throws SQLException {
				int result = 0;
				
				try {
					
					conn = ds.getConnection();
					
					String sql = " update tbl_member_test set postcode=null, address=null, detailaddress=null, extraaddress=null "+
								 " where userid = ? ";

				         pstmt = conn.prepareStatement(sql);
				         pstmt.setString(1, paraMap.get("userid"));
				         
				         result = pstmt.executeUpdate();
			         
			      } finally {
			         close();
			      }
			      
			      return result;   
			} // end of public int adrDelete(Map<String, String> paraMap)throws SQLException

			
			
			
			
			// === 비밀번호를 변경해주는 메소드 === 
			@Override
			public int passwdUpdate(Map<String, String> paraMap) throws SQLException {
				
				int result = 0;
				
				try {

					conn = ds.getConnection();
					String sql = " update tbl_member_test set pwd = ? "+
								 " where userid = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, Sha256.encrypt(paraMap.get("pwd")) );
					pstmt.setString(2, paraMap.get("userid"));
					
					result = pstmt.executeUpdate();
					
				} finally {
					close();
				}
				
				
				return result;
				
			} // end of public boolean isExistPasswd(Map<String, String> paraMap) throws SQLException

			
		
			// 비밀번호가 맞는지 확인하는 메소드
			@Override
			public boolean ispasswdCheck2(Map<String, String> paraMap)throws SQLException {
				boolean ispasswdCheck2 = false;
				
				try {
					
					conn = ds.getConnection();
					
					String sql = " select userid "+
								 " from tbl_member_test "+
								 " where userid = ? and pwd = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) );
					
					rs = pstmt.executeQuery();
					
					ispasswdCheck2 = rs.next();

				} finally {
					close();
				}
				return ispasswdCheck2;
			}

			
			// === 정보변경 메소드 === // 
			@Override
			public int myinfoUpdate(Map<String, String> paraMap) throws SQLException {
				int n = 0;
				
				try {
					conn = ds.getConnection();
					
					String sql = " update tbl_member_test set gender = ? , name = ?,  mobile = ? , birthday = ? "+
								 " where userid = ? ";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, paraMap.get("gender"));
					pstmt.setString(2, paraMap.get("name"));
					pstmt.setString(3, aes.encrypt(paraMap.get("mobile")) );
					pstmt.setString(4, paraMap.get("birthday"));
					pstmt.setString(5, paraMap.get("userid"));
					
					n = pstmt.executeUpdate();
					
				} catch(GeneralSecurityException | UnsupportedEncodingException e) { // |는 OR(또는)
					e.printStackTrace();
				} finally {
					close();
				}
				
				return n;
			} // end of public int myinfoUpdate(Map<String, String> paraMap) throws SQLException
			
			
			
			
			// 회원목록을 보여주는 메소드 // 
			@Override
			public List<MemberVO> selectPagingMember(Map<String, String> paraMap)throws SQLException {
				
				List<MemberVO> memberList = new ArrayList<>();
				
				  try {
			          conn = ds.getConnection();
			          
			          String sql = " select userid, name, email, gender  "+
						          " from  "+
						          "  ( "+
						          "    select rownum AS RNO, userid, name, email, gender  "+
						          "    from  "+
							          "    ("+
							          "        select userid, name, email, gender "+
							          "        from tbl_member_test "+
							          "        where userid != 'admin' ";
			          
			          String colname = paraMap.get("searchType");
					  String searchWord = paraMap.get("searchWord"); // 넘어온 검색어를 가지고 판단해야한다. 
					  
					  if("email".equalsIgnoreCase(colname)) { // get한 searchType값이 email라면 넘겨받은 값을 다시 암화하여 비교해야한다.
													// 검색 대상이 email인 경우 검색어 이메일은 암호화 시켜서 조회해야한다. 

							 searchWord = aes.encrypt(searchWord);
						}

						 
					 if(searchWord != null && !searchWord.trim().isEmpty()) { // 검색어는 null이 아니면서 공백이 없고 비어있지 않아야한다.
							 												  // searchWord가 null이 아니여야만 nullpointException이 떨어지지않는다
						sql += " and "+ colname + " like '%' || ? ||'%' "; 
						 //  ?(위치홀더)는 검색어만 들어와야하며 
						 // 테이블명 또는 컬럼명이 변수로 들어와야 할 경우에는 ?(위치홀더)를 사용하면 꽝이다!
						 // 테이블명 또는 컬럼명이 변수로 들어와야 할 경우에는 변수로 처리해 줘야한다.!!!
					 }
							          
						sql +=        "        order by registerday desc "+
							          "    ) V "+
						          ")T "+
						          "where RNO between ? and ? ";
			          
			       //   === [페이징 처리의 공식] ===
			       //   where RNO between(조회하고자하는 페이지번호 * 한페이지당 보여줄 행의 갯수) - (한페이지당 보여줄 행의 갯수-1) and (조회하고자하는 페이지번호 * 한페이지당 보여줄 행의 갯수);
			          
			          int currentShowPageNo = Integer.parseInt( paraMap.get("currentShowPageNo")); // 조회하고자하는 페이지번호. 스트링타입이기 때문에 숫자로 바꾼다.(장난치더라도 1페이지)
			          int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage")); 			   // 한페이지당 보여줄 행의 갯수 (null이더라도 디폴트값 10)
			          
			          pstmt = conn.prepareStatement(sql);
			          
			          if(searchWord != null && !searchWord.trim().isEmpty()) { // 검색어가 있다면
			        	  
			        	  pstmt.setString(1, searchWord);
			        	  pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage -1) ); // 공식
				          pstmt.setInt(3, (currentShowPageNo*sizePerPage) ); // 공식
			          }
			          else { // 검색이 없다면
			        	  pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage -1) ); // 공식
				          pstmt.setInt(2, (currentShowPageNo*sizePerPage) ); // 공식
			        	  
			          }
			          
			        
			          rs = pstmt.executeQuery();
			          
			          while(rs.next()) {
			        	  
			        	  MemberVO mvo = new MemberVO();
			        	  
			        	  mvo.setUserid(rs.getString(1));
			        	  mvo.setName(rs.getString(2));
			        	  mvo.setEmail(aes.decrypt(rs.getString(3)) ); // 복호화 (아래에 익셉션처리)
			        	  mvo.setGender(rs.getString(4));
			        	  
			        	  memberList.add(mvo);
			        	  
			          } // end of while()---------------------------
			          
			          
				  } catch(GeneralSecurityException | UnsupportedEncodingException e) {
						e.printStackTrace();
					} finally {
						close();
					}
				  
				return memberList;
			} // end of public List<MemberVO> selectPagingMember(Map<String, String> paraMap)throws SQLException

			
			
			
			// 페이징처리를 위해 검색이 있는 회원 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
			@Override
			public int getTotalPage(Map<String, String> paraMap) throws SQLException {
				
				int totalPage = 0;
				
				try {
					
					 conn = ds.getConnection();
					 
					 String sql = " select ceil(count(*)/?)  " + // 토탈페이지 몇개인지 알아오자
								 " from tbl_member_test " +
								 " where userid != 'admin'";
					 
					 String colname = paraMap.get("searchType");
					 String searchWord = paraMap.get("searchWord"); // 넘어온 검색어를 가지고 판단해야한다. 
					 
					 if("email".equals(colname)) { // get한 searchType값이 email라면 넘겨받은 값을 다시 암화하여 비교해야한다.
						 						   // 검색 대상이 email인 경우 검색어 이메일은 암호화 시켜서 조회해야한다. 
						 searchWord = aes.encrypt(searchWord);
						 
					 }
					 
					 if(searchWord != null && !searchWord.trim().isEmpty()) { // 검색어는 null이 아니면서 공백이 없고 비어있지 않아야한다.
						 													  // searchWord가 null이 아니여야만 nullpointException이 떨어지지않는다
						 sql += " and " + colname + " like '%'|| ? ||'%' "; 
						 //  ?(위치홀더)는 검색어만 들어와야하며 
						 // 테이블명 또는 컬럼명이 변수로 들어와야 할 경우에는 ?(위치홀더)를 사용하면 꽝이다!
						 // 테이블명 또는 컬럼명이 변수로 들어와야 할 경우에는 변수로 처리해 줘야한다.!!!
						 
					 }
					 
					 pstmt = conn.prepareStatement(sql);
					 
					 pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) ); // 스트링타입 3 5 10을 정수로 변환시킨다.
					 
					 if(searchWord != null && !searchWord.trim().isEmpty()) { // 검색이 있다면 위치홀더에 검색어를 넣어라
						 pstmt.setString(2, searchWord); 
						 
					 }
					 
					 rs = pstmt.executeQuery(); 
					 
					 // count는 무조건 결과가 나오기때문에 if()할 필요없다. 행이 없으면 0으로 나온다.
					 rs.next();
					 
					 totalPage = rs.getInt(1);
					 
				} catch(GeneralSecurityException | UnsupportedEncodingException e) {
						e.printStackTrace();
				} finally {
					close();
				}
				
				return totalPage;
			} // end of public int getTotalPage(Map<String, String> paraMap) throws SQLException ------------------------

			

			
			// == 회원한명에 대한 정보를 알아오는 메소드 ===
			@Override
			public MemberVO memberOneDetail(String userid) throws SQLException {
				
				MemberVO member = null;
				
				try {
					
					conn = ds.getConnection();
					String sql = " select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender "+
							 "      , substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd "+
							 "      , coin, point, to_char(registerday, 'yyyy-mm-dd') AS registerday "+
							 " from tbl_member_test "+
							 " where userid = ? "; 
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						// 성공한 경우
						
						// select해서 나온 값을 new MemberVO()에 정보를 담아야한다.
						member = new MemberVO();
						
						member.setUserid(rs.getString(1));
						member.setName(rs.getString(2));
						member.setEmail( aes.decrypt(rs.getString(3)) );  // 복호화 
						member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화  
						member.setPostcode(rs.getString(5));
						member.setAddress(rs.getString(6));
						member.setDetailaddress(rs.getString(7));
						member.setExtraaddress(rs.getString(8));
						member.setGender(rs.getString(9));
						member.setBirthday(rs.getString(10) + rs.getString(11) + rs.getString(12));
						member.setCoin(rs.getInt(13));
						member.setPoint(rs.getInt(14));
						member.setRegisterday(rs.getString(15));
						
						
					}
					System.out.println("확인용 DAO : " + member.getEmail());
					
				} catch(GeneralSecurityException | UnsupportedEncodingException e) {
					e.printStackTrace();	
				} finally {
					close();
				}
				
				return member;
			} // end of public MemberVO memberOneDetail(String userid) throws SQLException

		

}
