package com.example.jshop.dto;

import lombok.Data;

@Data
public class OrderHistoryDTO {
	private String user_id;
	private int prdt_id;
	private int prdt_price;
	private int addCart_cnt;
	private int total_price;
	private String prdt_title;
	private String prdt_color;
	private String img_id;
	private String payment_time;
	private int order_type;
}
