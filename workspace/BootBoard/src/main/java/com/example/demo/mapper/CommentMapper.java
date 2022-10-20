package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Comment;

@Mapper
public interface CommentMapper {
	//게시물 번호 넘겨주기 
	public List<Comment> selectAllCom(int boardnum);
	
	public int countCom(int boardnum);
	
	public void comAdd(HashMap<String,Object>map);
}
