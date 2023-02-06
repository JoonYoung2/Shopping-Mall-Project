package com.example.jshop.controller;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.service.MemberService;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@Slf4j
public class MemberController {
	@Autowired
    private MemberService service;
    
    @RequestMapping("/")
    public String index() {
    	return "index";
    }
    
    @GetMapping("/login")
    public void login() {
    	
    }
    @GetMapping("register")
    public String register() {
    	return "signup/register";
    }
    
    @PostMapping("register")
    public String register(MemberDTO member) {
    	log.info("Data info : {}", member);

        String msg = "null";
        try{
            msg = service.register(member);
            
        }catch (Exception e){
            log.info("Error -> {}", e);
        }
        if(!msg.equals("null")) {
            if (msg.equals("등록 완료")) {
                return "redirect:/";
            }
        }
        return "redirect:register";
    }
}
