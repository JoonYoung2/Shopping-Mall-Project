package com.example.jshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;

@Service("memberSvc")
public class MemberService {
	@Autowired
    private MemberRepository repo;

	public String register(MemberDTO member) throws Exception {
		
		repo.register(member);
		return "등록 완료";
	}
}
