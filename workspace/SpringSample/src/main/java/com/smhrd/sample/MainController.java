package com.smhrd.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//컨트롤러를 지정, Model 객체 (데이터 저장) 만들어 'View 반환' 
@Controller
public class MainController {
	
	// /main 으로 get요청이 들어왔을 때 실행 > main.jsp 반환
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String mainPage() {
		//spring/appServlet/servlet-context.xml
		//prefix : WEB-INF/views/
		//suffix : .jsp
		return "main";
	}
}
