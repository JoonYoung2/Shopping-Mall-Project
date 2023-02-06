package com.example.jshop.dto;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class MemberDTO {
	private String user_id;
    private String user_pw;
    private String user_pw_check;
    private String user_email;
    private String user_nm;

    private String zip_cd;
    private String address_info;
    private String address_detail;
}
