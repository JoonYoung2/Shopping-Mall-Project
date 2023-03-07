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
	@Pattern(regexp = "^[a-z]+[a-z0-9]{5,19}$")
	private String user_id;
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$")
    private String user_pw;
    private String user_pw_check;
    @Pattern(regexp = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$")
    private String user_email;
    private String user_nm;
    @Pattern(regexp = "^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$")
    private String user_phoneNum;

    private String zip_cd;
    private String address_info;
    private String address_detail;
    private int loginType;
    private int totalCart_cnt;
    private int result_price;
} 
  