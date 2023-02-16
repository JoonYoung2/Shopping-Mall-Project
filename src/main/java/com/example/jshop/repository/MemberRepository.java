package com.example.jshop.repository;

import org.apache.ibatis.annotations.Mapper;
import com.example.jshop.dto.MemberDTO;

@Mapper
public interface MemberRepository {
	public MemberDTO findId(String id) throws Exception;
	
	public void register(MemberDTO member) throws Exception;
	
	public void kakao_register(MemberDTO member) throws Exception;
}
 