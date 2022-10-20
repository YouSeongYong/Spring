package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.service.BoardService;

@Controller
public class MainController {

	@Autowired
	
	BoardService boardService;
	
	@GetMapping("/main")
	public String main(Model model ) {
		//board 테이블에 있는 모든 데이터 가지고 오기 
		
		model.addAttribute("boardList",boardService.selectAllBoard());
		
		return "main";
	}
}
