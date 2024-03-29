package com.example.jshop.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.dto.QnaDTO;
import com.example.jshop.repository.QnaRepository;
import com.example.jshop.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QnaController {
	@Autowired
	private QnaService service;
	
	@Autowired
	private QnaRepository repo;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/qna")
	public String qna(Model model, HttpServletResponse response, String msg) {
		String user_id = (String)session.getAttribute("user_id");
		
		// 비회원 접근 제한
		if(user_id == null) {
			return "redirect:/";
		}
		// 비회원 접근 제한
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
	public String qna_write(Model model) {
		String message = repo.getMessage();
		model.addAttribute("msg1", message);
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
	
	@GetMapping("/qna_info")
	public String qna_info(@RequestParam("qna_num") int qna_num, Model model) {
		
		QnaDTO qna = null;
		try {
			qna = repo.qna_select(qna_num);
			String file = qna.getQna_file();
			
			//등록된 파일이 있으면 파일명만 나오게~~~~~~ 아니면 등록된 파일이 없습니다로 세팅
			if(file.equals("등록된 파일이 없습니다.") == false) {
				String[] qna_file = file.split("-", 15);
				qna.setQna_file(qna_file[1]);			
			}
		}catch(Exception e) {
			log.error("error QnaController qna_info() -> {}", e);
		}
		model.addAttribute("data", qna);
		return "user_qna/qna_info";
	}
	
	@GetMapping("/qna_update")
	public String qna_update(@RequestParam("qna_num") int qna_num, Model model) {
		QnaDTO qna = null;
		try {
			qna = repo.qna_select(qna_num);
			String file = qna.getQna_file();
			
			//등록된 파일이 있으면 파일명만 나오게~~~~~~ 아니면 등록된 파일이 없습니다로 세팅
			if(file.equals("등록된 파일이 없습니다.") == false) {
				String[] qna_file = file.split("-", 15);
				qna.setQna_file(qna_file[1]);			
			}
		}catch(Exception e) {
			log.error("error QnaController qna_info() -> {}", e);
		}
		model.addAttribute("data", qna);
		return "user_qna/qna_update";
	}
	
	@PostMapping("/qna_update")
	public String qna_update(MultipartHttpServletRequest multi, Model model) {
		String msg = service.qna_update(multi);
		String num = multi.getParameter("qna_num");
		int qna_num = Integer.parseInt(num);
		if(msg.equals("수정 완료")) {
			return "redirect:qna";
		}
		
		return "user_qna/qna_update";
	}
	
	@GetMapping("/qna_delete")
	public String qna_delete(@RequestParam("qna_num") int qna_num, Model model) {
		model.addAttribute("data", qna_num);
		return "user_qna/qna_delete";
	}
	
	@PostMapping("/qna_delete")
	public String qna_delete(MemberDTO member, int qna_num, String sessionId, Model model) {
		String msg = service.qna_delete(member, qna_num, sessionId);
		if(msg.equals("삭제 완료")) {
			return "redirect:qna";
		}
		
		model.addAttribute("msg", msg);
		return "redirect:qna_delete?qna_num=" + qna_num;
	}
	
	@GetMapping("kakao_qna_delete")
	public String kakao_qna_delete(@RequestParam("qna_num") int qna_num) {
		service.kakao_qna_delete(qna_num);
		return "redirect:qna";
	}
	
	@GetMapping("/download")
	public void download(int qna_num, HttpServletResponse res) {
		String fName = repo.getFile(qna_num);
		if(fName.equals("등록된 파일이 없습니다.") || fName.isEmpty())
			return;
		
		String path = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\qnaUpload\\" + qna_num + "\\";
		path = path + fName;
		
		File file = new File(path);
		if(file.exists() == false)
			return;
		
//		String[] fn = fName.split("-");
		fName = fName.substring(15);
		try {
			fName = URLEncoder.encode(fName, "UTF-8");	//다운로드 시 한글 특수문자 깨짐
		} catch (UnsupportedEncodingException e2) {
			log.error("error QnaController download() -> {}", e2);
		}
		res.addHeader("content-disposition", "attchment;filename="+fName);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, res.getOutputStream());
		} catch (Exception e) {
				try {
					if(fis != null)
						fis.close();
				} catch (IOException e1) {
					log.error("error QnaController download() -> {} ", e1);
				}
			return;
		}
		
		try {
			if(fis != null)
				fis.close();
		} catch (IOException e1) {
			log.error("error QnaController download() -> {} ", e1);
		}
		
	}
}
