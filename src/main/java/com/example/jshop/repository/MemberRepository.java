package com.example.jshop.repository;

import java.util.List;

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

	public void kakao_infoUpdate(MemberDTO member);
	
	public void infoUpdate(MemberDTO member);

	public void infoDelete(String user_id);
	
	public void tmpDelete(String user_id);

	public void creditDelete(String user_id);

	public void qnaDelete(String user_id);

	public List<Integer> qna_upload_select(String user_id);
}
  