package com.example.jshop.dto;

import lombok.Data;

@Data
public class LoginLoggerDTO {
	private int log_id;
	private String user_id;
	private int loginType;
	private String user_ip;
	private String login_time;
	private String logout_time;
}
 