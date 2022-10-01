package hw.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.CartVO;
import common.model.MemberVO;
import hw.model.CartDAO;
import hw.model.InterCartDAO;
import hw.model.InterWishlistDAO;
import hw.model.WishlistDAO;

public class Cart extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// System.out.println("컨트롤러 입성");
		
		if( !super.checkLogin(request)) {
			
			// 로그인을 안 했으면
	         
		}
		else {
			
			HttpSession session =  request.getSession(); 
			  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			// System.out.println("확인용 loginuser.userid : " + loginuser.getUserid());
			
			String fk_userid = loginuser.getUserid();
			
			int fk_pnum = Integer.parseInt(request.getParameter("pnum")) ;
			// System.out.println("확인용 pnum : " + pnum);
			
			int qty = Integer.parseInt( request.getParameter("qty") );
			// System.out.println("확인용 qty : " + qty);
			
			CartVO cart = new CartVO(fk_userid, fk_pnum, qty);
			
			InterCartDAO cdao = new CartDAO();
			
			try {
				
				int isCartExist = cdao.isCartExist(fk_userid, fk_pnum);
				
				if(isCartExist == 0) {
				
		        	int n1 = cdao.cartInsert(cart);
		        	
		        	if(n1==1) {
	
		        		super.setRedirect(false);
		        		super.setViewPage("/WEB-INF/hw/cart.jsp");
		        	}
				}
				else {
					
					int updateQty = qty + isCartExist;
					
					int n2 = cdao.cartUpdate(fk_userid, fk_pnum, updateQty);
					
					if(n2==1) {
						
		        		// super.setRedirect(false);
		        		super.setViewPage("/WEB-INF/hw/cart.jsp");
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
