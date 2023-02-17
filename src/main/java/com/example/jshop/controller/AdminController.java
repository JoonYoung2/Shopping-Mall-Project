package com.example.jshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin")
	public String admin() {
		
		return "/admin/adminView";
	}
	@GetMapping("/prdtWrite")
	public String prdtWrite() {
		return "/admin/prdtWrite";
	}
	@PostMapping("write")
	public String prdtFrom(MultipartHttpServletRequest multi) {
		String msg = "";
		String prdt_nm = multi.getParameter("prdt_nm");
		log.info("prdt_nm : {}", prdt_nm);
		try {
			msg = service.prdtWrite(multi);
		}catch(Exception e) {
			log.error("error -> {}", e);
		}
		if(msg.equals("등록 완료")) {
			return "/admin/adminView";			
		}
		
		return "/admin/prdtWrite"; 
	}
}
