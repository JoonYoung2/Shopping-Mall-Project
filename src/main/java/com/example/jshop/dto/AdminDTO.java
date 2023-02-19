package com.example.jshop.dto;

import lombok.Data;

@Data
public class AdminDTO {
	private int prdt_id;
	private String admin_id;
	private String prdt_title;
	private String prdt_nm;
	private String prdt_price;
	private String prdt_color;
	private String prdt_info;
	private int prdt_list;
	private String img_id;
	private int purchase_cnt;
	private int review_cnt ; 
}
 