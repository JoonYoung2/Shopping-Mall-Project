package com.example.jshop.repository;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.AdminDTO;

@Mapper
public interface UserPrdtRepository {
	public AdminDTO getData(String prdt_id);
}
 