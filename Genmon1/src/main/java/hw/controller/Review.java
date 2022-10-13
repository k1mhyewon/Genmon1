package hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class Review extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		String purpose = request.getParameter("purpose");
		
		String reviewid = request.getParameter("reviewid");
		
		InterReviewDAO rdao = new ReviewDAO();
		
		if("POST".equalsIgnoreCase(method)) { 
			
			if("reviewDelete".equals(purpose)) { // 리뷰삭제
				
				int n = rdao.deleteReview(reviewid);
				
				if(n == 1) {
					// System.out.println("삭제 완료");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/hw/memberReview.jsp");
				}
				else {
					
					String message = "오류 발생으로 삭제 실패";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
				}
				
			}
			
			else if("replyDelete".equals(purpose)) { // 리뷰 댓글 삭제
				
				
				int n = rdao.deleteReviewReply(reviewid);
				
				if(n == 1) {
					// System.out.println("삭제 완료");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/hw/memberReview.jsp");
				}
				else {
					
					String message = "오류 발생으로 삭제 실패";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
				}
				
			}
			
			else if("insertReply".equals(purpose)) { // 리뷰 댓글 달기
				
				String reply_content = request.getParameter("reply_content");
				
				
				int n = rdao.insertReply(reviewid, reply_content);
				
				if(n == 1) {
					// System.out.println("삭제 완료");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/hw/memberReview.jsp");
				}
				else {
					
					String message = "오류 발생으로 댓글달기 실패";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
				}
				
			}
			
			
			else if("editReply".equals(purpose)) { // 리뷰 댓글 수정
				
				String reply_content = request.getParameter("reply_content");
				
				
				int n = rdao.editReply(reviewid, reply_content);
				
				if(n == 1) {
					// System.out.println("삭제 완료");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/hw/memberReview.jsp");
				}
				else {
					
					String message = "오류 발생으로 댓글수정 실패";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
				}
				
			}
			
			
			
			
		}
		
		
	}

}
