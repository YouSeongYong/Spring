package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectAllBoard();
	
	public Board selectOneBoard(int boardnum);
	
	public void setLikeNum(HashMap<String,Object> map);
	
	public int getLikeNum(int num);
}
