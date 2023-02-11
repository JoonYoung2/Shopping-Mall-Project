package com.example.jshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;

import java.util.Collections;


@Service
public class MemberService  {
	@Autowired
	private MemberRepository repo;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public String register(MemberDTO member) throws Exception {
		if(member.getUser_pw().equals(member.getUser_pw_check())) {
			String rawPassword = member.getUser_pw();
			member.setUser_pw(
					passwordEncoder.encode(rawPassword)
			);
			repo.register(member);
			return "등록 완료";			
		}
		return "비밀번호가 일치하지 않습니다.";
	}
}
