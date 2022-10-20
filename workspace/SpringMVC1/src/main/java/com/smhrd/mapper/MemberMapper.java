package com.smhrd.mapper;

import java.util.List;

import com.smhrd.model.Member;

public interface MemberMapper {
	public void joinMember(Member member);
	
	public Member loginMember(Member member);
	
	public void updateMember(Member member);
	
	public List<Member> selectAllMember(); 
	
	public void deleteMember(Member member);
	
//	public void deleteMember(String id);
	//2.deleteMember() 작성 
	
	//3.mapper.xml에 sql 작성(특정회원삭제)
	
}
