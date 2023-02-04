package com.example.jshop.sample.dto;

import lombok.Data;

@Data
public class UserInfo {
    private String user_id;
    private String user_pw;
    private String user_email;
    private String user_nm;

    private String zip_cd;
    private String address_info;
    private String address_detail;
}