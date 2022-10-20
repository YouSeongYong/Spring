package com.smhrd.common;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Page {

	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private boolean prev, next; // 이전 , 다음

	private int total; // 전체 글개수
	private Criteria cri;// 페이지 번호(pageNum), 한페이지당 글개수 (amount)

	public Page(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		// 여기서 5는 페이지블록을 구성하는 페이지 개수
		this.endPage = (int) Math.ceil(cri.getPageNum() / 5.0) * 5;

		this.startPage = this.endPage - (5 - 1);

		// 실제 끝페이지
		int realEnd = (int) Math.ceil((double) total / cri.getAmount());

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;

	}
} // 생성자
