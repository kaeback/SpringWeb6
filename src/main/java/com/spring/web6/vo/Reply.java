package com.spring.web6.vo;

import lombok.Data;

@Data
public class Reply {
	private int replynum;
	private int boardnum;
	private String id;
	private String text;
	private String inputdate;	
}
