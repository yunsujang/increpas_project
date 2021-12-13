package login.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {
		

		
		//로그인 체크를 해서 만약 로그인이 안된 상태라면 value에 false를 저장!
		//먼저 HttpSession얻기
		HttpSession session = request.getSession(true);//getSession은 원래 true가 들어가있지만
					//true넣은 이유는 session이 만약에 없다면 새로만들어라 라는 뜻.
					//삭제가 안된 상태라면 사용하고 있던 session을 그대로 전달해 준다.

		//로그인 시 저장했던 객체(mvo)를 얻어낸다.
		Object obj = session.getAttribute("mvo");
		if(obj == null) {
			//로그인을 하지 않은 경우를 잡아낸 상태!!!
			
			//로그인 페이지로 이동시키자!로그인페이지로 이동시키세요 servlet-context.xml확인 
			response.sendRedirect("/login");
		return false;
		} 
			//로그인이 된 상태인경우 이때 해야할 일들이 있으면 여기쯤에서 구현하면된다.
		
		return true;
	
		
		
	}

	
}
