package com.example.jshop.repository;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.MemberDTO;

@Mapper
public interface PaymentRepository {
	public MemberDTO userInfo_select(String user_id);
}
