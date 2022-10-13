package common.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		description = "사용자가 웹에서 *.sun 했을경우 이 서블릿이 응답을 해주도록 한다", 
		urlPatterns = { "*.sun" }, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "C:\\Users\\sist\\git\\Genmon1\\Genmon1\\src\\main\\webapp\\WEB-INF\\Command.properties")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// field
	private Map<String,Object> cmdMap = new HashMap<>();
	
	
	// 초기화 파라미터 ( 이 서블릿이 돌아갈 때 딱 한번만 응답을 해준다)
	public void init(ServletConfig config) throws ServletException {
	/*
        웹브라우저 주소창에서  *.sun 을 하면 FrontController 서블릿이 응대를 해오는데 
        맨 처음에 자동적으로 실행되어지는 메소드가 init(ServletConfig config) 이다.
        여기서 중요한 것은 init(ServletConfig config) 메소드는 WAS(톰캣)가 구동되어진 후
        딱 1번만 init(ServletConfig config) 메소드가 실행되어지고, 그 이후에는 실행이 되지 않는다. 
        그러므로 init(ServletConfig config) 메소드에는 FrontController 서블릿이 동작해야할 환경설정을 잡아주는데 사용된다.
	*/      
		String props = config.getInitParameter("propertyConfig");
		// 확인용 props => C:\Users\sist\git\Genmon1\Genmon1\src\main\webapp\WEB-INF\Command.properties
		
		try {
	   		// ** 특정 파일에 있는 내용을 읽어오기 위한 용도로 쓰이는 객체
	   		FileInputStream fis = new FileInputStream(props);
	   		// fis 은  C:\Users\sist\git\Genmon1\Genmon1\src\main\webapp\WEB-INF\Command.properties 파일의 내용을 읽어오는 데 사용되는 객체이다
	   		
	   		Properties pr = new Properties();
	   		// Properties 는 Collection 중 HashMap 계열중의  하나로써
	        // "key","value"으로 이루어져 있는것이다.
	        // 그런데 중요한 것은 Properties 는 key도 String 타입이고, value도 String 타입만 가능하다는 것이다.
	        // key는 중복을 허락하지 않는다. value 값을 얻어오기 위해서는 key값만 알면 된다.
	   		
	   		pr.load(fis); // IOException 처리를 해줘야 한단
	   		/*
	         pr.load(fis); 은  fis 객체를 사용하여  C:\Users\sist\git\Genmon1\Genmon1\src\main\webapp\WEB-INF\Command.properties 파일의 내용을 읽어다가 
	         Properties 클래스의 객체인 pr 에 로드시킨다.
	         그러면 pr 은 읽어온 파일(Command.properties)의 내용에서 
	         = 을 기준으로 왼쪽은 key로 보고, 오른쪽은 value 로 인식한다.
	   		 */
	   		
	   		// 프로파티스의 키값 알아오기
	   		Enumeration<Object> en = pr.keys();
	   		/*
	          pr.keys(); 은
	           C:\Users\sist\git\Genmon1\Genmon1\src\main\webapp\WEB-INF\Command.properties 파일의 내용물에서 
	          = 을 기준으로 왼쪽에 있는 모든 key 들만 가져오는 것이다.    
	       */
	   		
	   		while(en.hasMoreElements()) { // 키가 있냐 묻는 것... (키의 개수만큼 반복됨)
	   			String key = (String)en.nextElement(); // 있다면 키를 끄집어와라
	   			// System.out.println("확인용 key => "+key);
	   			// 확인용 key => /test/test2.up
	   			// 확인용 key => /test1.up
	   			
	   			String className = pr.getProperty(key);
	   			// 이어서 vaule 값을 얻어와야지 ( 실제 클래스를 알아오는 것 )
	   			// System.out.println("확인용 value => "+pr.getProperty(key));;
	   			// 확인용 value => test.controller.Test2Controller
	   			// 확인용 value => test.controller.Test1Controller
	   			
	   			
	   			// 지금은 스트링 타입인데 우리는 객체를 만들어야애 ㅜㅜ
	   			if(className!=null) {
	   				className = className.trim();
	   				
	   				// 클래스를 가지고 객체를 만드는데 어떤 클래스인지 모른다 ?=> 다 받아주겟땅
	   				Class<?> cls = Class.forName(className); // classnotfound 익셉션 ( 클래스가 없는데 객체를억코ㅐ만드러)
	   				// <?> 은 generic 인데 어떤 클래스 타입인지는 모르지만 하여튼 클래스 타입이 들어온다는 뜻이다.
	                // String 타입으로 되어진 className 을 클래스화 시켜주는 것이다.
	                // 주의할 점은 실제로 String 으로 되어져 있는 문자열이 클래스로 존재해야만 한다는 것이다.
	   				
	   				// 생성자 불러오기
	   				Constructor<?> constrt = cls.getDeclaredConstructor();
	   				
	   				Object obj = constrt.newInstance(); // return 타입이 객체가 되어진다 
	   				// 생성자로부터 실제 객체(인스턴스)를 생성해주는것이다
	   				
	   				cmdMap.put(key, obj); // value 자료형이 object이니까 클래스들의 모든 객체들을 담을 수 있음
	   				// cmdMap 에서 키값으로 Command.properties 파일에 저장되어진 url 을 주면 
	                // cmdMap 에서 해당 클래스에 대한 객체(인스턴스)를 얻어오도록 만든 것이다.
	   			}
	   		} // end of while
	   		
		} catch (FileNotFoundException e) {
			System.out.println(">>> C:\\Users\\sist\\git\\Genmon1\\Genmon1\\src\\main\\webapp\\WEB-INF\\Command.properties 파일이 존재하지 않습니다 <<<");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println(">>>문자열로 명명되어진 클래스가 존재하지 않습니다<<<");
			e.printStackTrace();
		} catch (Exception e) { // 어떤 익셉션이던지 전부 다 받아준다
			e.printStackTrace();
		}
	} // end of 초기화

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request,response);
	}
	
	
	// 메소드로 만들어서 겟방식 포스트 방식 다 끌어와서 응답한다
		private void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// test/test2.up 같은 주소를 알아와야 뭘 하든 할거아녀
			// POST에서 한글 안깨지게 하려면 필터가 필요해~~ (copy해왔당 )
			// request.setCharacterEncoding("UTF-8"); 필터가 없다면 얘를 걍 앞에 써주면 되잉
			
			// 웹브라우저의 주소 입력창에서 
		    // http://localhost:9090/MyMVC/member/idDuplicateCheck.up?userid=leess 와 같이 입력되었더라면 
			// 이만큼 알아와야 한다 /member/idDuplicateCheck.up 
			// String url = request.getRequestURL().toString(); // 스트링 버퍼가 리턴타입이얌 -> 스트링 타입으로 바까준다
			// System.out.println("확인용 url + "+url);
			// 확인용 url + http://localhost:9090/MYMVC/member/idDuplicateCheck.up
			
			String uri = request.getRequestURI(); // return 타입이 String
			// System.out.println("확인용 uri + "+uri);
			// 확인용 uri + /MYMVC/member/idDuplicateCheck.up / cntPath 네임은 필요없는디...
			// 확인용 uri + /MYMVC/test1.up
			// 확인용 uri + /MYMVC/test/test2.up
			
			// request.getContextPath().length(); //  /MYMVC  (6)
			String key = uri.substring(request.getContextPath().length()); // 6번째 인덱스부터 끝까지~
			//  /member/idDuplicateCheck.up
			//  /test1.up
			//  /test/test2.up ==> 키값을 알아온거임 map에 넣으면 객체를 가져올 수 있것띠
			
			// 캐스팅(다형성) (자식클래스로 만든 객체를 부모클래스 타입으로 받아준거임)
			AbstractController action = (AbstractController)cmdMap.get(key);
			
			if(action==null) {
				System.out.println(">>> "+key+" 은 URI 패턴에 메핑된 클래스가 없습니다. <<<");
				// >>> /member/idDuplicateCheck.up 은 URI 패턴에 메핑된 클래스가 없습니다. <<<
				
			} else { // 있다면 웹페이지를 보여줄거잉 // 클래스에 있는 메소드를 불러올거임
				try {
					action.execute(request, response); // exception 처리 해줘야앵
					// 얘를 호출해온거임
					
					// action은 1, 2클래스의 객체이지만, 부모 클래스를 상속받아왔기 떄문에 부모클래스의 변수/ 메소드를 사용 가능하다
					boolean bool = action.isRedirect();
					String viewPage = action.getViewPage();
					
					if(!bool) { // bool 값이 false 이다 => forward
						// viewPage 에 명기된 view단 페이지로 forward(dispatcher)를 하겠다는 말이다.
						// forward 되어지면 웹브라우저의 URL주소 변경되지 않고 그대로 이면서 화면에 보여지는 내용은 forward 되어지는 jsp 파일이다.
						// 또한 forward 방식은 forward 되어지는 페이지로 데이터를 전달할 수 있다는 것이다.
						
						if(viewPage!=null) { // view 페이지를 지정 해줬다면.... (디폴트가 널 값이니까 set 안해줬다면 null 값임...)
							RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
							dispatcher.forward(request, response);
						}
						
					} else { // bool 값이 true 이다 => sendRedirect
						// viewPage 에 명기된 주소로 sendRedirect(웹브라우저의 URL주소 변경됨)를 하겠다는 말이다.
			            // 즉, 단순히 페이지이동을 하겠다는 말이다. 
			            // 암기할 내용은 sendRedirect 방식은 sendRedirect 되어지는 페이지로 데이터를 전달할 수가 없다는 것이다.
						
						if(viewPage!=null) {
							response.sendRedirect(viewPage);
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
			
		} // end of requestProcess(){} 메소드로 만들어서 겟방식 포스트 방식 다 끌어와서 응답한다

}
