package com.smhrd.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//검색 기준 
public class Criteria {
	private int pageNum; //페이지 벙호
	private int amount; //한 페이지당 글 개수
	
	public Criteria() {
		//pageNum : 1 amount: 5
		this(1,5);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum =pageNum;
		this.amount = amount;
	}
}
