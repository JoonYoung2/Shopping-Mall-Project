package com.example.jshop.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.QnaDTO;
import com.example.jshop.repository.QnaRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaService {
	@Autowired
	private QnaRepository repo;
	@Autowired
	private HttpSession session;

	public String qna_write(MultipartHttpServletRequest multi) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\qnaUpload\\";
		String user_id = (String) session.getAttribute("user_id");
		String qna_title = multi.getParameter("qna_title");
		String qna_content = multi.getParameter("qna_content");
		MultipartFile qna_file = multi.getFile("file");
		String write_time = sdf.format(cal.getTime());
		
		System.out.println("user_id ========> " + user_id);
		System.out.println("qna_title =========>" + qna_title);
		System.out.println("qna_content =========>" + qna_content);
		System.out.println("qna_file =========>" + qna_file);
		System.out.println("write_tile ==========>" + write_time);
		
		if(qna_content == "" || qna_content == null) {
			return "본문 내용은 필수입니다.";
		}
		
		QnaDTO qna = new QnaDTO();
		qna.setQna_content(qna_content);
		qna.setQna_file(" ");
		qna.setQna_title(qna_title);
		qna.setUser_id(user_id);
		qna.setWrite_time(write_time);

		try {
			repo.qna_insert(qna);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int max_id = repo.maxFindId(); // 고유한 폴더에 img파일을 보관하기 or img_id를 update하기 위해서..

		String fName = "";
		if (qna_file != null && qna_file.getSize() != 0) {
			fName = qna_file.getOriginalFilename();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			cal = Calendar.getInstance();
			fName = sdf.format(cal.getTime()) + fName;

			String path = dir + max_id + "\\" + fName;

			File file = new File(path);
			if (file.exists() == false)
				file.mkdirs();

			try {
				qna_file.transferTo(file);
				
				repo.fileUpdate(max_id, fName);
			} catch (Exception e) {
				log.error("img_id error ---> {}", e);
			}
		}
		
		return "등록 완료";
	}
}
