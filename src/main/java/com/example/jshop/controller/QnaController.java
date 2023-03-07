package com.example.jshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.QnaDTO;
import com.example.jshop.repository.QnaRepository;
import com.example.jshop.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;
	
	@Autowired
	private QnaRepository repo;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/qna")
	public String qna(Model model) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		List<QnaDTO> list = repo.qna_list(user_id);
		
		//~~~~~~~~~~~~~1~list 번호 주기위해서~~~~~~~~
		int sum = 0;
		for(int i = 0; i < list.size(); ++i) {
			++sum;
			list.get(i).setQna_sequence(sum);
			String write_time = list.get(i).getWrite_time();
			String[] write = write_time.split(" ", 10);
			list.get(i).setWrite_time(write[0]);
		}
		//~~~~~~~~~~~~~1~list 번호 주기위해서~~~~~~~~
		
		model.addAttribute("datas", list);
		return "user_qna/qna_index";
	}
	
	@GetMapping("/qna_write")
	public String qna_write() {
		return "user_qna/qna_write";
	}
	
	@PostMapping("/qna_write")
	public String qna_write(MultipartHttpServletRequest multi, Model model) {
		String msg = service.qna_write(multi);
		if("등록 완료".equals(msg)) {
			return "redirect:/qna";
		}
		model.addAttribute("msg", msg);
		return "user_qna/qna_write";
	}
}
