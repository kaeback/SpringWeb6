package com.spring.web6.vo;

import lombok.Data;

@Data
public class Board {
	private int boardnum;
	private String id;
	private String title;
	private String content;
	private String inputdate;
	private int hits;
	private String originalfile;
	private String savedfile;
}
