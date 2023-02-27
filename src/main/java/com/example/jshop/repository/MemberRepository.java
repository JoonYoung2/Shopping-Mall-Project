package com.example.jshop.repository;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.LoginLoggerDTO;
import com.example.jshop.dto.MemberDTO;

@Mapper
public interface MemberRepository {
	public MemberDTO findId(String id) throws Exception;
	
	public void register(MemberDTO member) throws Exception;
	
	public void kakao_register(MemberDTO member) throws Exception;
	
	public void loginLogger(LoginLoggerDTO log) throws Exception;
	
	public LoginLoggerDTO findLoginLogger(String login_time) throws Exception;
	
	public void totalCntUpdate(int totalCart_cnt, String user_id) throws Exception;

	public void resultPriceUpdate(int result_price, String user_id) throws Exception;
}
  