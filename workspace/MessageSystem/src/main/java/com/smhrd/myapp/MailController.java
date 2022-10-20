package com.smhrd.myapp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.smhrd.model.WebMember;
import com.smhrd.model.WebMessage;
import com.smhrd.service.MailService;

@Controller
public class MailController {
	
	//1.controller 메서드 작성
	//2.mailservice 메서드 작성
	//3.mailmapper 메서드 작성 -annotation
	@Autowired
	MailService mailservice;
	
	//ModelAttribute 한번에 묶어서 보내기
	@PostMapping("/mail/sendMail")
	public String send(@ModelAttribute WebMessage webmessage ) {
		mailservice.sendMail(webmessage);
		return "redirect:/main";
		
	}
	@GetMapping("/mail/deleteAllMail")
	public String deleteAllMaill(HttpSession session) {
		WebMember loginM=(WebMember)session.getAttribute("loginM");
		mailservice.deleteAllMail(loginM.getEmail());
		
		return "redirect:/main";
	}
	
	@GetMapping("/mail/deleteMail/{num}")
	public String deleteMail(@PathVariable("num")int num) {
		mailservice.deleteMail(num);
		return "redirect:/main";
	}

}
