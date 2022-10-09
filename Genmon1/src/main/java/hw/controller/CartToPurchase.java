package hw.controller;
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
public class CartToPurchase extends AbstractController {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		// post 방식으로 넘어오긴 했는데 나눠줘야 하나??


		//if("post".equalsIgnoreCase(method)) {
			String all_qty = request.getParameter("all_qty");
			String all_pnum = request.getParameter("all_pnum");

			//System.out.println(all_qty);
			//System.out.println(all_pnum);
			
			String[] arr_qty = all_qty.split(",");
			String[] arr_pnum = all_pnum.split(",");
			
			List<CartVO> ordertList = new ArrayList<>();
			
			InterCartDAO cdao = new CartDAO();
			
			for(int i =0; i<arr_qty.length; i++) {
				
				//System.out.println(arr_pnum[i]+ arr_qty[i]);
				CartVO cvo = cdao.selectOneOrder(arr_pnum[i], arr_qty[i]);
				//cvo.setFk_pnum( Integer.parseInt(arr_pnum[i]) );
				//cvo.setQty(Integer.parseInt(arr_qty[i]));
				ordertList.add(cvo);
			}
			
			HttpSession session =  request.getSession(); 
			session.setAttribute("ordertList", ordertList);
			
			if(super.checkLogin(request)) { // 로그인 한 상태라면 바로 주문으로 가면 안대고 ㅎㅎ

				// --------------------------------------------------------------- //


		         //  HttpSession session =  request.getSession(); 
		           // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
		         MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");

		         request.setAttribute("email", loginuser.getEmail());
		         request.setAttribute("name", loginuser.getName());
		         request.setAttribute("mobile", loginuser.getMobile());
		         request.setAttribute("postcode", loginuser.getPostcode());
		         request.setAttribute("address", loginuser.getAddress());
		         request.setAttribute("detailAddress", loginuser.getDetailaddress());
		         request.setAttribute("extraAddress", loginuser.getExtraaddress());


		         // --------------------------------------------------------------- //

		         super.setRedirect(false);
		         super.setViewPage("/WEB-INF/jihyun/deliveryInfo.jsp");
		         return;

		      } else { // 로그인 안 한 상태라면 로그인 체크로


		         super.setRedirect(false);
		         super.setViewPage("/WEB-INF/jihyun/checkLogin.jsp");
		         return;
		      }
			

		}

	//}

}