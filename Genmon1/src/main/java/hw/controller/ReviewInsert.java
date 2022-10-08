package hw.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import common.model.ReviewVO;
import hw.model.InterReviewDAO;
import hw.model.ReviewDAO;

public class ReviewInsert extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		if( !super.checkLogin(request)) {
			
			// 로그인을 안 했으면
	         String message = "리뷰작성은 회원만 가능합니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/common/msg.jsp");
	         
		}
		
		else {
			
			HttpSession session = request.getSession();
			
				
			MultipartRequest mtrequest = null;
			/*
            MultipartRequest mtrequest 은 
            HttpServletRequest request 가 하던일을 그대로 승계받아서 일처리를 해주고 
            동시에 파일을 받아서 업로드, 다운로드까지 해주는 기능이 있다.      
			*/
			
			// 1. 첨부된 파일을 디스크의 어느 경로에 업로드 할 것인지 그 경로를 설정해야 한다.
			ServletContext svlCtx = session.getServletContext();
			String uploadFileDir = svlCtx.getRealPath("/images/reviewImg"); // .metadata
			
			// System.out.println("uploadFileDir: "+ uploadFileDir);
			
			// 2. 파일을 업로드 해준다.
			try {
				mtrequest = new MultipartRequest(request,
												 uploadFileDir, // -- 파일이 저장될 경로
												 10*1024*1024,  // == 10mb -- 업로드할 파일 1개의 최대 크기(byte)
												 "UTF-8",
												 new DefaultFileRenamePolicy() ); // -- 중복된 파일명이 올라갈 경우 파일명다음에 자동으로 숫자가 붙어서 올라간다.   
			} catch(IOException e) {
				request.setAttribute("message", "첨부할 파일의 용량은 10MB를 초과할 수 없습니다.");
	            request.setAttribute("loc", request.getContextPath()+"/member/memberReviewWrite.sun"); 
	              
	            super.setViewPage("/WEB-INF/common/msg.jsp");
	            return; // 종료
			}
			
			
			// 3. === 첨부 이미지 파일을 올렸으니 그 다음으로 제품정보를 (제품명, 정가, 제품수량,...) DB의 tbl_product 테이블에 insert 를 해주어야 한다.  ===
			String orderDetailId = mtrequest.getParameter("orderDetailId");
			String pnum = mtrequest.getParameter("pnum"); 
			String reviewStar = mtrequest.getParameter("reviewStar");
			String content = mtrequest.getParameter("rev_content");
			
			content = content.replaceAll("<", "&lt;");
			content = content.replaceAll(">", "&gt;");
			content = content.replaceAll("\r\n", "<br>");
			
			// 업로드되어진 시스템의 첨부파일 이름(파일서버에 업로드 되어진 실제파일명)을 얻어 올때는 
	        // cos.jar 라이브러리에서 제공하는 MultipartRequest 객체의 getFilesystemName("form에서의 첨부파일 name명") 메소드를 사용 한다. 
	        // 이때 업로드 된 파일이 없는 경우에는 null을 반환한다.   
			
			String img =  mtrequest.getFilesystemName("img");
			
			// System.out.println("확인용 reviewStar : " + reviewStar);
			// System.out.println("확인용 content : " + content);
			// System.out.println("확인용 img : " + img);
			
			String img_systemFileName = mtrequest.getFilesystemName("img");
			// System.out.println("확인용 prdmanual_systemFileName : " + prdmanual_systemFileName); // 실제로 업로드된 파일네임 
			// 제품설명서 파일명(파일서버에 업로드 되어진 실제파일명)  
	        // 제품설명서 파일명 입력은 선택사항이므로 NULL 이 될 수 있다.
			
			String img_orginFileName = mtrequest.getOriginalFileName("img"); // 오리지널 파일네임 (중복된거 확인 불가)
			// System.out.println("확인용 prdmanual_orginFileName : " + prdmanual_orginFileName);
			// 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명
	        // 제품설명서 파일명 입력은 선택사항이므로 NULL 이 될 수 있다.
	        // 첨부파일들 중 이것만 파일다운로드를 해주기 때문에 getOriginalFileName(String name) 메소드를 사용한다. 
			
			// System.out.println("확인용 img_systemFileName : " + img_systemFileName);
			// System.out.println("확인용 img_orginFileName : " + img_orginFileName);
			
			ReviewVO rvo = new ReviewVO();
			
			InterReviewDAO rdao = new ReviewDAO();
			
			rvo.setContent(content);
			rvo.setFk_pk_order_detail_id(orderDetailId);
			rvo.setImg_orginFileName(img_orginFileName);
			rvo.setImg_systemFileName(img_systemFileName);
			rvo.setStar(reviewStar);
			
			int result = rdao.reviewInsert(rvo);
			
			if(result == 1) {
				
				String message = "리뷰가 등록되었습니다.";
				String loc = request.getContextPath()+"/member/memberReview.sun?pnum="+pnum;
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/common/msg.jsp");
				
			}
			
			
				
				
			
		}
		
		
	}

}
