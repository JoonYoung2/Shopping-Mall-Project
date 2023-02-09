package com.example.jshop.controller;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.service.MemberService;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@Slf4j
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private MemberRepository repo;
	@Autowired private HttpSession session;
    
    @RequestMapping("/")
    public String index() {
    	return "index";
    }
    
    @GetMapping("login")
    public String login() {
    	return "login/login";
    }
    @PostMapping("login")
    public String login(MemberDTO member, Model model) {
    	try {
			MemberDTO check = repo.findId(member.getUser_id());
			if(check != null) {
				if(check.getUser_id().equals(member.getUser_id()) && check.getUser_pw().equals(member.getUser_pw())) {
					session.setAttribute("user_id", member.getUser_id());
					session.setAttribute("user_pw", member.getUser_pw());
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
    	return "signup/register";
    }
    
    @PostMapping("register")
    public String register(MemberDTO member, Model model) {
    	try {
			MemberDTO check = repo.findId(member.getUser_id());
			if(check != null) {
				String msg = "동일한 아이디가 존재합니다.";
				model.addAttribute("msg", msg);
				return "signup/register";
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
    	
        String msg = "null";
        try{
            msg = service.register(member);
            
        }catch (Exception e){
            log.info("Error -> {}", e);
        }
        if(!msg.equals("null")) {
            if (msg.equals("등록 완료")) {
                return "redirect:login";
            }
        }
        
        model.addAttribute("msg", msg);
        return "signup/register";
    }
    
    @GetMapping("logout")
    public String logout() {
    	session.invalidate();
    	return "redirect:/";
    }
}
