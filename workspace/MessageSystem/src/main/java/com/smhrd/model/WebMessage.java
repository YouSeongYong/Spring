package com.smhrd.model;

import java.sql.Date;

import lombok.Data;

@Data
public class WebMessage {
	private int num;
	private String sendName;
	private String receiveEmail;
	private String message;
	private Date sendDate;
}
