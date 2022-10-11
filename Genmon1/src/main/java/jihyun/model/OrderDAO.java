package jihyun.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.CallableStatement;
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
	
	
	
	
	// 현금 회원/비회원 주문하기 상세 insert (자식)
	@Override
	public int isertCashOrderDetail(CartVO cvo, String orderid) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into tbl_order_detail_test (pk_order_detail_id, fk_orderid, fk_pnum, order_price, order_status)\n"+
					"values (?||seq_tbl_order_detail.nextval, ?,?,?,6)";
			
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
	}// end of 현금 회원/비회원 주문하기 상세 insert (자식)


	
	
	
	// 상품 재고 줄어들게 하기
	@Override
	public int decreaseProdQty(Map<String, Object> map1) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			List<CartVO> ordertList = (List<CartVO>)map1.get("ordertList");
			
			for(CartVO order : ordertList) {
				
				String sql = "update tbl_all_product_test set PQTY = PQTY - ?\n"+
							"where pnum = ?";	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, order.getQty());
				pstmt.setInt(2, order.getFk_pnum());
				
				result += pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		
		return result;
	}// 상품 재고 줄어들게 하기


	
	// 회원 아이디 가지고 주문내역 리스트로 보여주기
	@Override
	public List<HashMap<String,String>> selectOrderList(String userid) throws SQLException {
		
		List<HashMap<String,String>> mapList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			// 주문 정보 알아오기
			String sql = "select PK_ORDERID, ORDERDATE\n"+
					"    from tbl_order_test \n"+
					"    where fk_userid = ?  "+
					" order by PK_ORDERID desc ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String orderid = rs.getString(1);
				String orderdate = rs.getString(2);
				
				HashMap<String, String> map = new HashMap<>();
				map.put("orderid", orderid);
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
				sql = "select PIMAGE1 , ORDER_STATUS \n"+
						"from tbl_all_product_test\n"+
						"join tbl_order_detail_test\n"+
						"on PNUM = fk_PNUM\n"+
						"where FK_ORDERID = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("orderid"));
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					map.put("image", rs.getString(1));
					map.put("order_status", rs.getString(2));
				}
				
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


	// 관리자에게 주문내역만을 보여주는 것
	@Override
	public List<HashMap<String,String>> adminSelectOnlyOrder() throws SQLException {
		
		List<HashMap<String,String>> mapList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select PURCHASE_STATUS , PK_ORDERID , ORDERDATE, NAME\n"+
					"from\n"+
					"    (\n"+
					"    select rownum AS ANO, PURCHASE_STATUS , PK_ORDERID , ORDERDATE, NAME\n"+
					"    from tbl_order_test\n"+
					"    join tbl_purchase_test\n"+
					"    on PK_ORDERID = fk_ORDERID\n"+
					"    )\n"+
					"where ANO between 1 and 10";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String,String> map = new HashMap<>();
				map.put("PURCHASE_STATUS", rs.getString(1));
				map.put("PK_ORDERID", rs.getString(2));
				map.put("ORDERDATE", rs.getString(3));
				map.put("NAME", rs.getString(4));
				
				mapList.add(map);
			}
			
			for(HashMap<String,String> map: mapList) {
				
				sql = "select pname, PCOLOR\n"+
						"from tbl_product_test\n"+
						"join tbl_all_product_test\n"+
						"on PID = FK_PID\n"+
						"join\n"+
						"(\n"+
						"    select FK_PNUM\n"+
						"    from tbl_order_detail_test \n"+
						"    where FK_ORDERID = ?\n"+
						")\n"+
						"on pnum = FK_PNUM";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("PK_ORDERID"));
				rs = pstmt.executeQuery();
				
				String pnames = "";
				
				while(rs.next()) {
					pnames += rs.getString(1)+" "+rs.getString(2)+", ";
				}
				pnames = pnames.substring(0, pnames.length()-2);
				if(pnames.length()>40) {
					pnames = pnames.substring(0,40)+"...";
				}
				map.put("pnames", pnames);
			}
			
		} finally {
			close();
		}
		
		return mapList;
	} // end of  관리자에게 전제 주문내역만을 보여주는 것


	
	// 주문번호랑 이메일을 가지고 비회원 주문을 조회하는 메소드
	@Override
	public OrderVO findGuestOrder(String input_orderid, String input_email) throws SQLException {
		
		OrderVO ovo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select PK_ORDERID\n"+
					"from tbl_order_test \n"+
					"where PK_ORDERID = ? and EMAIL = ? and FK_USERID is null";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input_orderid);
			pstmt.setString(2, aes.encrypt(input_email));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ovo = new OrderVO();
				ovo.setPk_orderid(rs.getString(1));
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return ovo;
	}// 주문번호랑 이메일을 가지고 비회원 주문을 조회하는 메소드


	
	// 주문상세에서 주문 취소 했을때
	@Override
	public void myinfoCancelOrder(String orderid) throws SQLException {
		
		try {
			conn = ds.getConnection();
			// 프로시저를 실행한다
			CallableStatement cstmt = conn.prepareCall("{call pcd_myinfo_ordercancel(?)}");
			// ?에 값 바인딩
			cstmt.setString(1, orderid);
			// 프로시저 실행
			cstmt.executeQuery();
			
			cstmt.close();
			
		}  finally {
			
			close();
		}
	}// end of 주문상세에서 주문 취소 했을때 


	
	// 주문 상세에서 환불 신청 했을때
	@Override
	public int myinfoRefundOrder(String rev_content, String arrjoin, String orderid) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String [] arr = arrjoin.split(",");
			
			// 환불신청 개수만큼 update와 insert를 반복해야함
			for(int i =0; i<arr.length; i++) {
				// System.out.println(arr[i]);
				
				String sql = "update tbl_order_detail_test set ORDER_STATUS = 3\n"+
						"where PK_ORDER_DETAIL_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, arr[i]);
				result += pstmt.executeUpdate();
				
				sql = "insert into tbl_refund (pk_fk_order_detail_id, fk_orderid, reason)\n"+
						"values(?,?,?)";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, arr[i]);
				pstmt.setString(2, orderid);
				pstmt.setString(3, rev_content);
				
				result += pstmt.executeUpdate();
				
			}
			
		}  finally {
			
			close();
		}
		return result;
	} // 주문 상세에서 환불 신청 했을때


	
	// 관리자 페이지에서 배송지등록이 필요한 목록을 띄워주는 것
	@Override
	public List<HashMap<String, String>> selectAllNeedShipOrder() throws SQLException {
		
		List<HashMap<String, String>> mapList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select pname, pcolor, pk_order_detail_id, pk_orderid, fk_pnum, order_status, to_char(start_day), "
					+ "to_char(orderdate), name, mobile, address, detailaddress, extraaddress, postcode\n"+
					"from\n"+
					"(\n"+
					"    select pname, pcolor, pnum\n"+
					"    from tbl_product_test\n"+
					"    JOIN tbl_all_product_test \n"+
					"    ON pid = fk_pid\n"+
					")\n"+
					"join \n"+
					"(\n"+
					"    select PK_ORDER_DETAIL_ID, PK_ORDERID, FK_PNUM, ORDER_STATUS, START_DAY, ORDERDATE, NAME, MOBILE, ADDRESS, DETAILADDRESS, EXTRAADDRESS, POSTCODE\n"+
					"    from tbl_order_test\n"+
					"    join\n"+
					"    (select PK_ORDER_DETAIL_ID, FK_ORDERID, FK_PNUM, ORDER_STATUS, START_DAY\n"+
					"    from tbl_order_detail_test\n"+
					"    left join (  select PK_FK_ORDER_DETAIL_ID, START_DAY\n"+
					"            from tbl_refund\n"+
					"            where refund_status = 1)\n"+
					"    on PK_ORDER_DETAIL_ID = PK_FK_ORDER_DETAIL_ID \n"+
					"    where ORDER_STATUS in(1,3) )\n"+
					"    on PK_ORDERID = FK_ORDERID\n"+
					")\n"+
					"on pnum = fk_pnum\n"+
					"order by START_DAY , ORDERDATE desc";
			
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			int cnt = 0;
					
			while(rs.next()) {
				
				if(cnt==0) { // 첫번째 줄은 그냥 저장
					
					HashMap<String,String> map = new HashMap<>();
					map.put("pname", rs.getString(1) +" "+ rs.getString(2));
					map.put("pk_order_detail_id", rs.getString(3));
					map.put("pk_orderid", rs.getString(4));
					map.put("fk_pnum", rs.getString(5));
					map.put("order_status", rs.getString(6));
					if(rs.getInt(6)==3) { // 환불인 경우
						map.put("date", rs.getString(7));
					} else { // 1 결제완료인 경우
						map.put("date", rs.getString(8));
					}
					map.put("name", rs.getString(9));
					map.put("mobile", aes.decrypt(rs.getString(10)) );
					map.put("address", rs.getString(11));
					map.put("detailaddress", rs.getString(12));
					map.put("extraaddress", rs.getString(13));
					map.put("postcode", rs.getString(14));
					
					mapList.add(map);
					
				} else { // 두번째 줄부터는 이전것과 비교
					
					// 똑같은 주문이라면
					if(mapList.get(cnt-1).get("pk_orderid").equals(rs.getString(4)) ) {
						
						String pname = mapList.get(cnt-1).get("pname");
						mapList.get(cnt-1).put("pname", pname + ", " + rs.getString(1) +" "+ rs.getString(2));
						String pk_order_detail_id = mapList.get(cnt-1).get("pk_order_detail_id");
						mapList.get(cnt-1).put("pk_order_detail_id", pk_order_detail_id + ", " + rs.getString(3));
						
						cnt--;
					} else { // 이전 주문과 같지 않은 주문이라면
						
						HashMap<String,String> map = new HashMap<>();
						map.put("pname", rs.getString(1) +" "+ rs.getString(2));
						map.put("pk_order_detail_id", rs.getString(3));
						map.put("pk_orderid", rs.getString(4));
						map.put("fk_pnum", rs.getString(5));
						map.put("order_status", rs.getString(6));
						if(rs.getInt(6)==3) { // 환불인 경우
							map.put("date", rs.getString(7));
						} else { // 1 결제완료인 경우
							map.put("date", rs.getString(8));
						}
						map.put("name", rs.getString(9));
						map.put("mobile", aes.decrypt(rs.getString(10)));
						map.put("address", rs.getString(11));
						map.put("detailaddress", rs.getString(12));
						map.put("extraaddress", rs.getString(13));
						map.put("postcode", rs.getString(14));
						
						mapList.add(map);
					}
				}
				
				cnt++;
			} // end of while
			
		}  catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}  finally {
			
			close();
		}
		
		
		
		return mapList;
	}// end of 관리자 페이지에서 배송지등록이 필요한 목록을 띄워주는 것


	
	// 관리자 페이지에서 배송지일괄등록 하기
	@Override
	public void insertManyTrack(Map<String, String> paraMap) throws SQLException {
		
		try {
			conn = ds.getConnection();
			
			String orderidjoin = paraMap.get("orderidjoin");
			String trackjoin = paraMap.get("trackjoin");
			String companyjoin = paraMap.get("companyjoin");
			String orderstatusjoin = paraMap.get("orderstatusjoin");
			
			String[] orderidArr = orderidjoin.split(",");
			String[] trackArr = trackjoin.split(",");
			String[] companyArr = companyjoin.split(",");
			String[] orderstatusArr = orderstatusjoin.split(",");
			
			// 선택된 갯수만큼 반복해줘야함 (P_fk_orderid  in number, P_deliv_company in varchar2, P_tracking_number in varchar2)
			for(int i =0; i<orderidArr.length;i++) { 
				
				if("1".equals(orderstatusArr[i])) { // 일반주문배송일때(상태가1)
					
					// 프로시저를 실행한다
					CallableStatement cstmt = conn.prepareCall("{call pcd_register_tracking(?,?,?)}");
					// ?에 값 바인딩
					cstmt.setString(1, orderidArr[i]);
					cstmt.setString(2, companyArr[i]);
					cstmt.setString(3, trackArr[i]);
					// 프로시저 실행
					cstmt.executeQuery();
					cstmt.close();
					
					
				} else { // 환불배송수거일때(상태가3)
					
					// 프로시저를 실행한다
					CallableStatement cstmt = conn.prepareCall("{call pcd_register_refund_tracking(?,?,?)}");
					// ?에 값 바인딩
					cstmt.setString(1, orderidArr[i]);
					cstmt.setString(2, companyArr[i]);
					cstmt.setString(3, trackArr[i]);
					// 프로시저 실행
					cstmt.executeQuery();
					cstmt.close();
					
				}
				
				
			}
			
			
			
		}  finally {
			
			close();
		}
		
	}// end of 관리자 페이지에서 배송지일괄등록 하기

	
	
	
	// 주문상세에서 배송정보 알아오기
	@Override
	public HashMap<String, String> selectOneDeliInfo(String total_status, String orderid) throws SQLException {
		
		HashMap<String, String> delimap = new HashMap<String, String>();
		
		try {
			conn = ds.getConnection();
		
			// 배송완료나 구매확정인 경우
				
			String sql = "select DELIV_COMPANY, TRACKING_NUMBER, to_char(DELIV_DATE)\n"+
						"from tbl_delivery_test\n"+
						"where FK_ORDERID = ? and DELIV_CLASS = 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				delimap.put("deliv_company", rs.getString(1));
				delimap.put("tracking_number", rs.getString(2));
				delimap.put("deliv_date", rs.getString(3));
			}
			
		} finally {
			close();
		}
		
		return delimap;
		
	} // end of 주문상세에서 배송정보 알아오기

	
	
}
