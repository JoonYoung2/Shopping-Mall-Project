package com.example.jshop.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.service.KakaoService;

@Controller
public class KakaoController {
	@Autowired private KakaoService service;
	@Autowired private HttpSession session;
	@Autowired private MemberRepository repo;
	
	@GetMapping("kakao_login")
    public String redirectkakao(@RequestParam("code") String code, Model model) throws IOException {
            System.out.println("code : " + code);
            
            //접속토큰 get
            String kakaoToken = service.getReturnAccessToken(code);
            
            System.out.println("kakaoToken : " + kakaoToken);
            //접속자 정보 get
            MemberDTO result = service.getUserInfo(kakaoToken);
            System.out.println("user_id = "+result.getUser_id()+"user_nm = "+result.getUser_nm());
            String user_id = result.getUser_id();
            String user_nm = result.getUser_nm();
            model.addAttribute("msg1", user_id);
            model.addAttribute("msg2", user_nm);
            
            try {
				if(repo.findId(user_id) != null)
					return "redirect:/";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            System.out.println(user_id);
            return "signup/kakao_register";
    }
	@GetMapping("kakao_register")
	public String kakao_register() {
		return "signup/kakao_register";
	}
	@PostMapping("kakao_register")
	public String kakao_register(MemberDTO member, Model model) {
		try {
			String msg = service.kakao_register(member);
			if("이미 등록".equals(msg) || "등록 완료".equals(msg))
				return "redirect:/";
			model.addAttribute("msg", msg);
			model.addAttribute("msg1", member.getUser_id());
			model.addAttribute("msg2", member.getUser_nm());
			return "signup/kakao_register";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:kakao_register";
	}
}