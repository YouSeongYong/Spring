package com.example.demo.model;

import lombok.Data;

@Data
public class Comment {
	private int comnum;
	private int boardnum;
	private String content;
	private String comwriter;
}
