package jihyun.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;

public class AddCart extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if( !super.checkLogin(request)) {
			
			// 로그인을 안 했으면
			int fk_pnum = Integer.parseInt( request.getParameter("pnum") );
			int qty = Integer.parseInt( request.getParameter("qty") );
			
			List<CartVO> cartList = new ArrayList<CartVO>();
			
			CartVO cvo = new CartVO(fk_pnum, qty);
			
			cvo.setFk_pnum(fk_pnum);
			cvo.setQty(qty);
			
			cartList.add(cvo);
			
			HttpSession session =  request.getSession(); 
			
			session.setAttribute("cartList", cartList);
			
			super.setRedirect(false);
    		super.setViewPage("/WEB-INF/hw/cart.jsp");
			
	         
		}
		else {
			
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
			
			String fk_userid = loginuser.getUserid();
			
			
			int fk_pnum = Integer.parseInt( request.getParameter("pnum") );
			// int fk_pnum = Integer.valueOf(request.getParameter("pnum")) ;
			// System.out.println("확인용 pnum : " + pnum);
			
			// int qty = Integer.valueOf(request.getParameter("qty")) ;
			int qty = Integer.parseInt( request.getParameter("qty") );
			
			// System.out.println("확인용 qty : " + qty);
			
			CartVO cart = new CartVO(fk_userid, fk_pnum, qty);
			
			InterCartDAO cdao = new CartDAO();
			
			try {
				
				int isCartExist = cdao.isCartExist(fk_userid, fk_pnum); // 장바구니에 들어잇는 값이 있는지 확인하고 개수 리턴(없으면 0 있으면 개수)
				
				if(isCartExist == 0) { // 해당 상품이 장바구니에 없다면
				
		        	int n1 = cdao.cartInsert(cart); // insert 하기
		        	
		        	if(n1==1) {
						request.setAttribute("json", String.valueOf(n1));
						super.setViewPage("/WEB-INF/common/jsonview.jsp");
					}
		        	
				}
				else { // 해당 상품이 장바구니에 있다면
					
					int updateQty = qty + isCartExist;
					
					int n2 = cdao.cartUpdate(fk_userid, fk_pnum, updateQty); // update 하기
					
					if(n2==1) {
						request.setAttribute("json", String.valueOf(n2));
						super.setViewPage("/WEB-INF/common/jsonview.jsp");
					}
					
				}
				
	        } catch(SQLException e) {
	        	
	        	e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/error.up");
				// indexController 에서 가져옴
	        }
			
			
		}
		
	}

}
