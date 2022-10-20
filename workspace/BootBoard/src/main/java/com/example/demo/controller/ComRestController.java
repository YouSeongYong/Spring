package com.example.demo.controller;

import java.util.HashMap;

import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.CommentService;
import com.google.gson.Gson;

@RestController
public class ComRestController {
	
	@Autowired
	CommentService commentService;
	
	@PostMapping("/com/add")
	public String comAdd(@RequestBody HashMap<String,Object>map) {
		
		commentService.comAdd(map);
		
		HashMap<String,Object> resultMap=new HashMap<String, Object>();
		resultMap.put("result", "success");
		
		Gson gson = new Gson();
		
		String result=gson.toJson(resultMap);
		
		return result;
	}
	

}
