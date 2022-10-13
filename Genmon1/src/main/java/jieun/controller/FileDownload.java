package jieun.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jieun.model.ContactDAO;
import jieun.model.InterContactDAO;

public class FileDownload extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String contactid = request.getParameter("contactid");
		
		try {
			// 다운로드할 파일의 경로를 구하고 File 객체 생성한다.
			HttpSession session = request.getSession();
			
			ServletContext svlCtx = session.getServletContext();
			String uploadFileDir = svlCtx.getRealPath("/images/contact");
	//		System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir); 
			//  === 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==>  /Users/gimjieun/NCS/workspace(jsp)/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MyMVC/images
			
		   //  uploadFileDir = "C:\\NCS\\workspace(jsp)\\MyMVC\\src\\main\\webapp\\images";
		   //  위와 같이 하면 파일 업로드 후에 이클립스에서 새로고침을 해주어야 한다.
			
			// **** 시스템에 업로드 되어진 파일설명서 첨부파일명 및 오리지널 파일명 알아오기 **** ///
			InterContactDAO cdao = new ContactDAO();
			Map<String,String> map = cdao.getContactFileName(contactid);
			
			String filePath = uploadFileDir + "/" + map.get("contactfile_systemFileName"); 
			System.out.println(filePath);
			// map.get("prdmanual_systemFileName") 은 파일서버에 업로드 되어진 제품설명서 파일명임.
			// filePath ==> /Users/gimjieun/NCS/workspace(jsp)/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MyMVC/images/Electrolux냉장고_사용설명서2.pdf
			
			// File 객체 생성하기 
			File file = new File(filePath); // 실제로 file 로 바꿔줌  
			
			// MIME TYPE 설정하기 
	        // (구글에서 검색어로 MIME TYPE 을 해보면 MIME TYPE에 따른 문서종류가 쭉 나온다)
			String mimeType = svlCtx.getMimeType(filePath); // 확장자를 읽어오기위함
	     	//   System.out.println("~~~~ 확인용 mimeType => " + mimeType);
	        //  ~~~~ 확인용 mimeType => application/pdf  .pdf 파일임
	        //   ~~~~ 확인용 mimeType => image/jpeg       .jpg 파일임
	        //  ~~~~ 확인용 mimeType => application/vnd.openxmlformats-officedocument.spreadsheetml.sheet    엑셀파일임.
			if(mimeType == null) {
				mimeType = "application/octet-stream";
				// "application/octet-stream" 은 일반적으로 잘 알려지지 않은 모든 종류의 이진 데이터를 뜻하는 것임.
			}
			response.setContentType(mimeType); // 응답해주는데 파일의 확장자를 알려준다.
			
			// 다운로드 되어질 파일명 알아와서 설정해주기
	        String contactfile_orginFileName = map.get("contactfile_orginFileName");
	        // map.get("prdmanual_orginFileName")이 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명임.
	  
	        // prdmanual_orginFileName(다운로드 되어지는 파일명)이 한글일때  
	        // 한글 파일명이 깨지지 않도록 하기위한 웹브라우저 별로 encoding 하기 및  다운로드 파일명 설정해주기 *
	        String downloadFileName = "";
	        String header = request.getHeader("User-Agent");
			
	        if (header.contains("Edge")){
	            downloadFileName = URLEncoder.encode(contactfile_orginFileName, "UTF-8").replaceAll("\\+", "%20");
	             response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
	          } else if (header.contains("MSIE") || header.contains("Trident")) { // IE 11버전부터는 Trident로 변경됨.
	             downloadFileName = URLEncoder.encode(contactfile_orginFileName, "UTF-8").replaceAll("\\+", "%20");
	             response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
	         } else if (header.contains("Chrome")) {
	            downloadFileName = new String(contactfile_orginFileName.getBytes("UTF-8"), "ISO-8859-1");
	             response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
	         } else if (header.contains("Opera")) {
	            downloadFileName = new String(contactfile_orginFileName.getBytes("UTF-8"), "ISO-8859-1");
	             response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
	         } else if (header.contains("Firefox")) {
	            downloadFileName = new String(contactfile_orginFileName.getBytes("UTF-8"), "ISO-8859-1");
	             response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
	         }
	        
	        
	     // *** 다운로드할 요청 파일을 읽어서 클라이언트로 파일을 전송하기 *** //
	        FileInputStream finStream = new FileInputStream(file);  // 파일을 읽어오기 위한 객체 생성 
	        // 1byte 기반 파일 입력 노드스트림 생성
	        
	        ServletOutputStream srvOutStream = response.getOutputStream(); // 파일을 밖으로(웹) 보내기위한 객체 생성  
	        // 1byte 기반 파일 출력 노드스트림 생성 
	        // ServletOutputStream 은 바이너리 데이터를 웹 브라우저로 전송할 때 사용함.
	  
	        // 파일을 읽어오는 단위(개발자맘대로 정할수있음)
	        byte arrb[] = new byte[4096]; // 한번 한 파일에 대해 퍼올릴때 그릇의 크기( 메모리낭비를 하지않으면서 적당한 크기로 정한다)  
	        int data = 0;			
	        				//	   	 0 부터 4096 바이트를 읽어다가 담아둠 
	        while ((data = finStream.read(arrb, 0, arrb.length)) != -1) { // 읽어올 파일이 남아있다라면 => (파일이 5메가라면 4096바이트를 읽어다가 쌓고 를 반복하며 더이상 읽어올게 없을땐 -1 이 나온다)
	           srvOutStream.write(arrb, 0, data); // 임시로 넣어둔곳(data)에서 밖으로 보내버리는 곳에 써준다.(읽어온게 없을때까지) 
	        }// end of while---------------------------
	  
	        srvOutStream.flush(); // 쌓아둔것을 밖으로 숙 내보내라(다운)
	        // 항상 닫아주기 
	        srvOutStream.close();
	        finStream.close();
	     
	     } catch (SQLException e) {
	        e.printStackTrace();
	     }
     
     
	}

}
