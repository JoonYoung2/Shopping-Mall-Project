package com.example.jshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.AdminDTO;
import com.example.jshop.repository.AdminRepository;
import com.example.jshop.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired
	private HttpSession session;
	@Autowired
	private AdminService service;
	@Autowired
	private AdminRepository repo; 
	
	@GetMapping("/admin")
	public String admin(Model model) {
		if((Integer)session.getAttribute("loginType") != 3) {
			return "redirect:/";
		}
		model.addAttribute("datas", repo.getAllPrdtInfo());
		
		return "/admin/adminView";
	}
	
	@GetMapping("/prdtWrite")
	public String prdtWrite() {
		if((Integer)session.getAttribute("loginType") != 3) {
			return "redirect:/";
		}
		return "/admin/prdtWrite";
	}
	@PostMapping("write")
	public String prdtFrom(MultipartHttpServletRequest multi) {
		String msg = "";
		try {
			msg = service.prdtWrite(multi);
		}catch(Exception e) {
			log.error("error -> {}", e);
		}
		if(msg.equals("등록 완료")) {
			return "redirect:/admin";			
		}
		
		return "/admin/prdtWrite"; 
	}
	
	@GetMapping("/prdtView")
	public String prdtView(@RequestParam ("prdt_id") String id, Model model) {
		int prdt_id = Integer.parseInt(id);
		model.addAttribute("datas", repo.getSelectPrdtInfo(prdt_id));
		return "/admin/prdtView";
	}
	
	@GetMapping("/prdtUpdate")
	public String prdtUpdate(@RequestParam ("prdt_id") String id, Model model) {
		int prdt_id = Integer.parseInt(id);
		model.addAttribute("datas", repo.getSelectPrdtInfo(prdt_id));
		return "/admin/prdtUpdate";
	}
	@PostMapping("update")
	public String prdtUpdate(AdminDTO datas) {
		String msg = service.prdtUpdate(datas);
		if(msg.equals("수정 완료") == false) {
			return "/admin/prdtUpdate";
		}
		return "redirect:/admin";
	}
	
	@GetMapping("/prdtDelete")
	public String prdtDelete(@RequestParam ("prdt_id") String id, Model model) {
		int prdt_id = Integer.parseInt(id);
		model.addAttribute("datas", repo.getSelectPrdtInfo(prdt_id));
		return "/admin/prdtDelete";
	}
	@PostMapping("delete")
	public String prdtDelete(String prdt_id) {
		String msg = service.folderDelete(prdt_id);
		if(msg.equals("폴더가 없습니다")) {
			return "/admin/prdtDelete";
		}
		repo.prdtDelete(prdt_id);
		return "redirect:/admin";
	}
	
	@GetMapping("/ex1")
	public String ex1() {
		return "/ex1";
	}
}
