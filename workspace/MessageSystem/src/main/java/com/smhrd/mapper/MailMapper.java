package com.smhrd.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.model.WebMessage;

@Mapper
public interface MailMapper {
	
	@Insert("insert into webmessage values(null, #{sendName}, #{receiveEmail}, #{message}, now())")
	public void sendMail(WebMessage Mail); 
	
	@Select("select * from webmessage where receiveEmail=#{email}")
	public List<WebMessage> selectMail(String email);
	
	//hashmap(email, criteria(pageNum,amount)
	public List<WebMessage> selectMaillPaging(HashMap<String,Object>map);
	
	@Select("select count(*) from webmessage where receiveEmail =#{email}")
	public int countMail(String email);
	
		
	@Delete("delete from webmessage where receiveEmail=#{email}")
	public void deleteAllMail(String email);
	
	@Delete("delete from webmessage where num=#{num}")
	public void deleteMail(int num);
}
