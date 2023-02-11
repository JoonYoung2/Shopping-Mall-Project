package com.example.jshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;



@Service("memberSvc")
public class MemberService {
	@Autowired private MemberRepository repo;
	
	public String register(MemberDTO member) throws Exception {
		if(member.getUser_pw().equals(member.getUser_pw_check())) {
			
			repo.register(member);
			return "등록 완료";			
		}
		return "비밀번호가 일치하지 않습니다.";
	}
}
