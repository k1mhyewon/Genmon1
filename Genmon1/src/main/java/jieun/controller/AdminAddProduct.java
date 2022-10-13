package jieun.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import common.model.MemberVO;
import jieun.model.ChildProductVO;
import jieun.model.InterProductDAO;
import jieun.model.ParentProductVO;
import jieun.model.ProductDAO;

public class AdminAddProduct extends AbstractController {

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
				List<String> pnameList= null;
				
				if(!"admin".equals(loginuser.getUserid())) {
					// === 관리자(admin)가 아닌 일반사용자로 로그인 했을 때는 조회가 불가능하도록 한다. === //
					String message = "관리자만 접근가능합니다!!";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/common/msg.jsp");
				}
				else { //  관리자로 로그인한 경우 상품 추가 가능 
					InterProductDAO pdao = new ProductDAO();
					String method = request.getMethod();
					
					if("GET".equalsIgnoreCase(method)) { // 상품 추가 폼을 보여줄때 
						
						
						List<HashMap<String, String>> colorList = pdao.selectAllColors();
						List<HashMap<String, String>> materialList = pdao.selectAllMaterials();
 
						// pname 뿌려주고 있는걸 선택하면 부모테이블에있는 내용뿌려주기 pname 부모테입블에 insert 안하고
						pnameList = pdao.isExistPname();
						 
						
						request.setAttribute("colorList", colorList);
						request.setAttribute("materialList", materialList);
						request.setAttribute("pnameList", pnameList);
				//		super.setRedirect(false); 
						super.setViewPage("/WEB-INF/jieun/admin_addProduct.jsp"); // 
					}
					else { // POST 방식 // 상품추가폼 넘어왔을때 
						
						// 파일 
						MultipartRequest mtrequest = null;
						ServletContext svlCtx = session.getServletContext();
						String uploadFileDir = svlCtx.getRealPath("/images/common/products");
						System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);

						// === 파일을 업로드 해준다. === // 
						try {
							mtrequest = new MultipartRequest(request, uploadFileDir , 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());    
						} catch (IOException e) {// 업로드 파일 크기의 최대크기를 초과하는 경우
							request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
			                request.setAttribute("loc", request.getContextPath()+"/customerCare/contact/memberGoContact.sun"); 
			              
			                super.setViewPage("/WEB-INF/common/msg.jsp");
			                return; // 종료
						}
						// 파일 다운받는거
//						String confile_systemFileName =  mtrequest.getFilesystemName("file"); // 실제로 업로드된파일명(중복되면 파일명 뒤에 숫자가 붙음 )
//						System.out.println("~~ confile_systemFileName  : "+ confile_systemFileName );

						// 파일 보여지는거
//						String confile_orginFileName =  mtrequest.getOriginalFileName("file"); // 원래 파일명 
//						System.out.println("~~ confile_orginFileName : "+ confile_orginFileName); 
						
						
//						상품 번호 채번하고 상ㅇ품 상세이미지 와 상품 자식테이블에 인서트
						String pname = mtrequest.getParameter("pname");
//						System.out.println("pname => "+pname);
						String price= mtrequest.getParameter("price");
//						System.out.println("price => "+price);
						
						String pimage1 = mtrequest.getFilesystemName("pimage1");
//						System.out.println("pimage1 => "+pimage1);
						String salePcnt = mtrequest.getParameter("salePcnt");
//						System.out.println("salePcnt => "+salePcnt);
						String pqty = mtrequest.getParameter("pqty");
//						System.out.println("pqty => "+pqty);
						String pcontent = mtrequest.getParameter("pcontent");
//						System.out.println("pcontent => "+pcontent);
						
						pcontent = pcontent.replaceAll("<", "&lt;");
						pcontent  = pcontent.replaceAll(">", "&gt;");
		 	            // 입력한 내용에서 엔터는 <br> 로 변환시키기
						pcontent  = pcontent.replaceAll("\r\n", "<br>");
						
						String preleasedate = mtrequest.getParameter("preleasedate");
						System.out.println("preleasedate => "+preleasedate);
						String pmaterial = mtrequest.getParameter("pmaterial");
						System.out.println("pmaterial => "+pmaterial);
						String pcolor = mtrequest.getParameter("pcolor");
						System.out.println("pcolor => "+pcolor);
//						String imgfiles = mtrequest.getFilesystemName("imgfilename");
//						System.out.println("imgfiles => "+imgfiles);
						
						ChildProductVO cpvo = new ChildProductVO();
						ParentProductVO ppvo = new ParentProductVO();
						String pid="";
						
						pnameList = pdao.isExistPname();
						boolean pnameExist = false;
						
						for(String prodname :pnameList ) {
							if(pname.equals(prodname)) { // 테이블에 있는 pname 
								pnameExist = true;
								break;
							}
						}
						
						if(pnameExist) { // 기존상품 (다른컬러추가)
							pid = pdao.findPidParentProduct(pname);
							System.out.println("1pid=>"+pid);
						}
						else {
							// 제품 부모테이블 pid 채번해오기 
							pid = pdao.getPidParentProduct();
							System.out.println("2pid=>"+pid);
							ppvo.setPid(pid);
							ppvo.setPmaterial(pmaterial);
							ppvo.setPname(pname);
							ppvo.setPrice(Integer.parseInt(price));
							ppvo.setPcontent(pcontent);
							// 부모상품테이블에 인서트
							pdao.insertParentProduct(ppvo);

						}
						
						int n2= 0;
						System.out.println("3pid=>"+pid);
						cpvo.setFk_pid(pid);
						// 제품 자식테이블 pnum 채번해오기 
						int pnum = pdao.getPnumChildProduct();// 제품번호 채번 해오기 => 제품번호는 시퀀스를 쓰므로 먼저 제품번호를 채번하고 제품테이블과 이미지테이블에 제품번호를 넣는다
						cpvo.setPnum(pnum);
						
						cpvo.setPcolor(pcolor);
						cpvo.setPimage1(pimage1);
						cpvo.setPqty(Integer.parseInt(pqty));

						if(salePcnt==null || salePcnt.trim()=="") {
							salePcnt="0";
						}
						System.out.println("salePcnt=>"+salePcnt);
						
						try {
							cpvo.setSalePcnt(Integer.parseInt(salePcnt));
						} catch (Exception e) {
							cpvo.setSalePcnt(0);
						}
						cpvo.setPreleasedate(preleasedate);
					
						// 자식상품테이블에 인서트 
						int n1 = pdao.insertChildProduct(cpvo);
						
						if(n1 ==1) { // 자식 상품테이블에 인서트를 성공했다면 
							// 상품상세이미지 받아온 이미지수만큼 인서트 
//								for(String imgfilename : imgfiles ) {
//									n2 = pdao.insetProdDetailimage(imgfilename, pnum);
//								}
							 // === 추가이미지파일이 있다라면 tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기 === // 
					           String str_attachCount= mtrequest.getParameter("attachCount");
					           // str_attachCount 이 추가이미지 파일 개수이다. "" "0"~"10" 이 들어온다.
					           
					           int attachCount = 0; 
					           
					           if(!"".equals(str_attachCount)) {
					        	   attachCount = Integer.parseInt(str_attachCount);
					           }
					           
					           // 첨부파일의 파일명(파일서버에 업로드 되어진 실제 파일명) 알아오기 
					           for(int i=0; i<attachCount; i++) {
					        	   String attachFileName = mtrequest.getFilesystemName("attach"+i); // attach0  attach1  attach2  attach3 ...
					        	   System.out.println(attachFileName);
					        	   n2 = pdao.insetProdDetailimage(attachFileName, pnum);
					        	   							  // pnum 은 위에서 채번해온 제품 번호이다. 
					           }// end of for()-----------------------------------------------
					           
						}
							
						System.out.println("n2 => "+n2);
						String message = n2==1? "상품 등록에 성공했습니다.":"상품 등록에 실패했습니다.";
						String loc = request.getContextPath()+"/admin/adminProduct.sun";
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						//	super.setRedirect(false);
						super.setViewPage("/WEB-INF/common/msg.jsp");
						
					}// // POST 방식 // 상품추가폼 넘어왔을때 
					
					
				}// //  관리자로 로그인한 경우 
				
				
				
			}// 로그인을 한경우 
		
			
			
	}

}
