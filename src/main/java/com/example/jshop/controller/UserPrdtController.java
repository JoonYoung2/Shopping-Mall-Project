package com.example.jshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jshop.dto.AdminDTO;
import com.example.jshop.repository.UserPrdtRepository;
import com.example.jshop.service.UserPrdtService;

@Controller
public class UserPrdtController {
	@Autowired
	private UserPrdtRepository repo;
	@Autowired
	private UserPrdtService service;
	
	@GetMapping("/prdt_index")
	public String podt_index(@RequestParam("prdt_id") String prdt_id, Model model) {
		AdminDTO datas = repo.getData(prdt_id);
		
		model.addAttribute("datas", datas);
		
		return "/user_prdt/prdt_index";
	}
} 
