package com.smhrd.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.common.Criteria;
import com.smhrd.common.Page;
import com.smhrd.model.WebMember;
import com.smhrd.model.WebMessage;
import com.smhrd.service.MailService;

@Controller
public class MainController {
	
	@Autowired
	MailService mailservice;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage(HttpSession session, Model model, Criteria cri)//모델에 저장
	{
		WebMember loginM=(WebMember)session.getAttribute("loginM");
		
		if(loginM!=null) {
			//paging 전버전
			//List<WebMessage> messageList=mailservice.selectMail(loginM.getEmail());
			//model.addAttribute("messageList",messageList);
			
			//paging 추가버전
			//고른 페이지에서 보여줘야하는 메세지 리스트
			List<WebMessage> messageList=mailservice.selectMailPaging(loginM.getEmail(),cri );
			
			int total=mailservice.countMail(loginM.getEmail());
			//paging page 개수 > page 
			Page page=new Page(cri,total);
			model.addAttribute("messageList",messageList);
			model.addAttribute("pagination",page);
		}
		return "main";
	}
	//update 페이지 보여주는 메서드
	@GetMapping("/update")
	public String updatePage() {
		return "update";
	}
	@GetMapping("/select")
	public String selectPage(){
		return "select";
	}
}
