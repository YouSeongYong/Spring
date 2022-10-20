package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.BoardService;

//@Controller + @responseBody 
//RestController : 데이터 반환( 주로 비동기 통신에 사용)
@RestController
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/board/like/{state}/{boardnum}")
	public int setLikeNum(@PathVariable("state") String state,@PathVariable("boardnum") int num) {
		
		boardService.setLikeNum(state,num);
		
		return boardService.getLikeNum(num);
	}

}
