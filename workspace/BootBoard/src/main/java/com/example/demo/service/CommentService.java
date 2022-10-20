package com.example.demo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.CommentMapper;
import com.example.demo.model.Comment;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;
	
	public List<Comment> selectAllCom(int boardnum){
		return commentMapper.selectAllCom(boardnum);
		
		
	}
	public int countCom(int boardnum) {
		return commentMapper.countCom(boardnum);
	}
	
	public void comAdd(HashMap<String,Object>map) {
		commentMapper.comAdd(map);
	}
}
