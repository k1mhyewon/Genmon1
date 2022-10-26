package jieun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import common.model.MemberVO;
import jieun.model.ChildProductVO;
import jieun.model.InterProductDAO;
import jieun.model.ProductDAO;

public class AdminEditProduct extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// === 로그인을 하지 않은 상태라면 조회가 불가능하도록 한다. === //
		if( !super.checkLogin(request) ) {
			String message = "먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/common/msg.jsp");
			
		}
		else { // 로그인을 한경우 
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			if(!"admin".equals(loginuser.getUserid())) {
				// === 관리자(admin)가 아닌 일반사용자로 로그인 했을 때는 조회가 불가능하도록 한다. === //
				String message = "관리자만 접근가능합니다!!";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/msg.jsp");
			}
			else { //  관리자로 로그인한 경우 상품 수정가능
				String pnum = request.getParameter("pnum");// 제품번호
				//System.out.println(pnum);
				InterProductDAO pdao = new ProductDAO();
				String method = request.getMethod();
				
				if("GET".equalsIgnoreCase(method)) { // 상품 추가 폼을 보여줄때 
					
					// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
					ChildProductVO cpvo= pdao.selectOneProductByPnum(pnum);
					
					// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
					List<String> imgList= pdao.getImagesByPnum(pnum);
					
					if(cpvo == null) { // 유저가 장난칠경우 
						// GET 방식이므로 사용자가 웹브라우저 주소창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
				         String message = "검색하신 제품은 존재하지 않습니다.";
				         String loc = "javascript:history.back()";
				         
				         request.setAttribute("message", message);
				         request.setAttribute("loc", loc);
				      //   super.setRedirect(false);
				         super.setViewPage("/WEB-INF/common/msg.jsp");
				         return;
					}
					else {
						List<HashMap<String, String>> colorList = pdao.selectAllColors();
						List<HashMap<String, String>> materialList = pdao.selectAllMaterials();

						// 제품이 있는경우 
						request.setAttribute("colorList", colorList); // 제품의 정보
						request.setAttribute("materialList", materialList); // 제품의 정보
						request.setAttribute("cpvo", cpvo); // 제품의 정보
						request.setAttribute("imgList", imgList); // 해당 제품의 추가된 이미지 정보
						
//						super.setRedirect(false); 
						super.setViewPage("/WEB-INF/jieun/admin_editProduct.jsp"); 
					}
				}
				else { // POST 방식 // 상품추가폼 넘어왔을때
					String pimage1 = request.getParameter("pimage1");
					String oriimage= request.getParameter("oriimage");
					String pname= request.getParameter("pname");
					String pcontent= request.getParameter("pcontent");
					if(pimage1 ==null) {
						pimage1 =oriimage;
					}
					//pimage1 = pimage1 ==null? oriimage : pimage1 ;
					System.out.println("pimage1=>"+pimage1);
					System.out.println("oriimage=>"+oriimage);
					System.out.println("pname=>"+pname);
					System.out.println("pcontent=>"+pcontent);
					
					
					
				}
				
				
				
			}
		}

	}

}
