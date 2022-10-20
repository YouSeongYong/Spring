package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.service.BoardService;
import com.example.demo.service.CommentService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardSerivce;
	
	@Autowired
	CommentService commentService;
	@GetMapping("/board/view/{boardnum}")
	public String view(@PathVariable("boardnum")int num,Model model) {
		 model.addAttribute("board", boardSerivce.selectOneBoard(num));
		 model.addAttribute("comList",commentService.selectAllCom(num));
		 model.addAttribute("comNum",commentService.countCom(num));
	return "boardView";
	}
}
