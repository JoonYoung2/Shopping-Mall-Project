package com.example.jshop.dto;

import lombok.Data;

@Data
public class AddCartDTO {
	private String user_id;
	private int prdt_id;
	private int prdt_price;
	private int addCart_cnt;
	private int total_price;
	
//	cartInfo에서 쓰임
	private String prdt_title;
	private String prdt_color;
	private String img_id;
}
