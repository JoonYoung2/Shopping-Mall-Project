package com.example.jshop.controller;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.dto.AdminDTO;
import com.example.jshop.dto.LoginLoggerDTO;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.service.MemberService;
import com.example.jshop.service.PrdtViewService;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MemberController {
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired 
	private MemberService service;
	@Autowired 
	private MemberRepository repo;
	@Autowired 
	private HttpSession session;
	@Autowired
	private PrdtViewService prdt;
    
    @GetMapping("/")
    public String index(Model model) {
    	model.addAttribute("prdts", prdt.getImgView());
    	return "user/index";
    }
    
    @GetMapping("login")
    public String login() {
    	if(session.getAttribute("loginType") != null) {
    		return "redirect:/";
    	}
    	return "login/login";
    }
    @PostMapping("login_2")
    public String login(MemberDTO member, Model model) {
    	String rawPassword = member.getUser_pw();
    	log.info("암호화 : {}", passwordEncoder.encode(rawPassword));
    	try {
			MemberDTO check = repo.findId(member.getUser_id());
			log.info("비밀번호 복호화 : {}", passwordEncoder.matches(member.getUser_pw(), check.getUser_pw()));
			if(check != null) {
				if(check.getUser_id().equals(member.getUser_id()) && passwordEncoder.matches(member.getUser_pw(), check.getUser_pw())) {
					session.setAttribute("user_id", member.getUser_id());
					session.setAttribute("loginType", check.getLoginType());
					session.setAttribute("totalCart_cnt", check.getTotalCart_cnt());
					session.setAttribute("result_price", check.getResult_price());
					service.loginLogger(check);
					return "redirect:/";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	String msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
    	model.addAttribute("msg", msg);
    	
    	return "login/login";
    }
    
    @GetMapping("register")
    public String register() {
    	if(session.getAttribute("loginType") != null) {
    		return "redirect:/";
    	}
    	return "signup/register";
    }
    
    @PostMapping("register")
    public String register(@Valid MemberDTO member, BindingResult bindingResult, Model model,
						   HttpServletRequest request) {
		
    	String msg = "";
    	try {
			msg = service.register(member, bindingResult, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	if(msg.equals("등록 완료")) {
    		model.addAttribute("msg", "회원가입 완료");
    		return "login/login";
    	}
    	model.addAttribute("msg", msg);
        return "signup/register";
    }
    
    @GetMapping("logout2")
    public String logout() throws Exception {
    	String login_time = (String)session.getAttribute("login_time");
    	LoginLoggerDTO logger = repo.findLoginLogger(login_time);
    	service.logoutLogger(logger);
    	
		session.invalidate();
    	return "redirect:/";
    }
    
    @GetMapping("/info")
    public String info() {
    	return "/user_info/info_index";
    }
    
    @PostMapping("/info")
    public String info(String user_id, Model model) {
    	try {
			MemberDTO member = repo.findId(user_id);
			model.addAttribute("member", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "/user_info/infomation";
    }
    
    @PostMapping("kakao_infoUpdate")
    public String kakao_infoUpdate(MemberDTO member) {
    	repo.kakao_infoUpdate(member);
    	return "/user_info/info_index";
    }
    
    @PostMapping("infoUpdate")
    public String infoUpdate(MemberDTO member) {
    	repo.infoUpdate(member);
    	return "/user_info/info_index";
    }
    
    @GetMapping("/infoDelete")
    public String infoDelete() {
    	return "/user_info/infoDelete";
    }
    
    @PostMapping("/infoDelete")
    public String infoDelete(MemberDTO member, String sessionId, Model model) throws Exception {
    	String msg = service.infoDelete(member, sessionId);
    	if(msg.equals("아이디 또는 비밀번호가 일치하지 않습니다.")) {
    		model.addAttribute("msg", msg);
    		return "/user_info/infoDelete";
    	}
    	String login_time = (String)session.getAttribute("login_time");
    	LoginLoggerDTO logger = repo.findLoginLogger(login_time);
    	service.logoutLogger(logger);
    	session.invalidate();
    	return "redirect:/";
    }
}