package com.example.demo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.model.Board;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<Board> selectAllBoard(){
		return boardMapper.selectAllBoard();
		
	}
	
	public Board selectOneBoard(int boardnum) {
		return boardMapper.selectOneBoard(boardnum);
	}

	//좋아요 개수 플러스 마이너스
	public void setLikeNum(String state, int num) {
		
		//state : plus / minus
		//HashMap 묶어서 보내는 기능 
		HashMap<String, Object> map = new HashMap<>();
		map.put("state",state);
		map.put("num", num);
		
		boardMapper.setLikeNum(map);
	}
	
	//현재 좋아요 개수 가져오기
	public int getLikeNum(int num) {
		
		
		return boardMapper.getLikeNum(num);
		
	}
}
