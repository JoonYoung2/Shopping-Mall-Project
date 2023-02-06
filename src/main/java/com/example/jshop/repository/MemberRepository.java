package com.example.jshop.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.jshop.dto.MemberDTO;

@Mapper
public interface MemberRepository {
	public List<MemberDTO> selectUserInfo() throws Exception;

	public void register(MemberDTO member) throws Exception;
}
