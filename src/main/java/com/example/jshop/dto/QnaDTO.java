package com.example.jshop.dto;

import lombok.Data;

@Data
public class QnaDTO {
	private int qna_num;
	private String user_id;
	private String qna_title;
	private String qna_content;
	private String qna_file;
	private String write_time;
	
	private int qna_sequence;
}