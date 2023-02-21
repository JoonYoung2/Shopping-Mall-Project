package com.example.jshop.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@ToString
@Data
@NoArgsConstructor
public class MemberDTO {
	private String user_id;
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$")
    private String user_pw;
    private String user_pw_check;
    private String user_email;
    private String user_nm;

    private String zip_cd;
    private String address_info;
    private String address_detail;
    private int loginType;
    private int totalCart_cnt;
} 
  