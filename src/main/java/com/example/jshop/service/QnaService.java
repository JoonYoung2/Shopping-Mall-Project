package com.example.jshop.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.dto.QnaDTO;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.repository.QnaRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaService {
	@Autowired
	private QnaRepository repo;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberRepository memberRepo;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public String qna_write(MultipartHttpServletRequest multi) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\qnaUpload\\";
		String user_id = (String) session.getAttribute("user_id");
		String qna_title = multi.getParameter("qna_title");
		String qna_content = multi.getParameter("qna_content");
		MultipartFile qna_file = multi.getFile("file");
		String write_time = sdf.format(cal.getTime());

		if (qna_content.equals("") || qna_content.equals(null)) {
			return "본문 내용은 필수입니다.";
		}

		QnaDTO qna = new QnaDTO();
		qna.setQna_content(qna_content);
		qna.setQna_file("등록된 파일이 없습니다.");
		qna.setQna_title(qna_title);
		qna.setUser_id(user_id);
		qna.setWrite_time(write_time);

		try {
			repo.qna_insert(qna);
		} catch (IOException e1) {
			log.error("error QnaService qna_write() -> {}", e1);
		}

		int max_id = repo.maxFindId(); // 고유한 폴더에 첨부파일을 보관하기 or 첨부파일를 update하기 위해서..

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
				log.error("error QnaService qna_write() -> {}", e);
			}
		}

		return "등록 완료";
	}

	public String qna_update(MultipartHttpServletRequest multi) {
		String num = (String) multi.getParameter("qna_num");
		int qna_num = 0;
		try {
			qna_num = Integer.parseInt(num);
		} catch (Exception e) {
			log.error("error QnaService qna_update() -> {}", e);
		}
		String qna_title = (String) multi.getParameter("qna_title");
		String qna_content = (String) multi.getParameter("qna_content");
		
		MultipartFile mfile = multi.getFile("file");
		String qna_file = null;

		QnaDTO qna = new QnaDTO();
		qna.setQna_num(qna_num);
		qna.setQna_content(qna_content);
		
		//if == file이 존재할 때 기존 파일 삭제 후 다시 파일 만들고 새로운 파일 이름으로 update 하기 위해서~~~~
		//else == file이 존재하지 않을 때 기존에 저장되어있던 파일 이름 update하기 위해서~~~
		if (mfile != null && mfile.getSize() != 0) {
			String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\qnaUpload\\";
			String path = dir + qna.getQna_num();
			File folder = new File(path);
			SimpleDateFormat sdf = null;
			Calendar cal = null;
			String fName = "";
			try {
				while (folder.exists()) {
					File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기

					for (int j = 0; j < folder_list.length; j++) {
						folder_list[j].delete(); // 파일 삭제
						log.info("파일이 삭제되었습니다.");

					}
					if (folder_list.length == 0 && folder.isDirectory()) {
						folder.delete();
					}
				}
				if (mfile != null && mfile.getSize() != 0) {
					fName = mfile.getOriginalFilename();
					sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
					cal = Calendar.getInstance();
					fName = sdf.format(cal.getTime()) + fName;

					path = path + "\\" + fName;

					File file = new File(path);
					if (file.exists() == false)
						file.mkdirs();
					try {
						mfile.transferTo(file);
						qna.setQna_file(fName);
					} catch (Exception e) {
						log.error("error QnaService qna_update -> {}", e);
					}
				}
				
			} catch (Exception e1) {
				log.error("error QnaService qna_update -> {}", e1);
			}
		} else {
			qna_file = repo.getFile(qna_num);
			qna.setQna_file(qna_file);
		}
		qna.setQna_title(qna_title);
		repo.qna_update(qna);
		

		return "수정 완료";
	}

	public String qna_delete(MemberDTO member, int qna_num, String sessionId) {
		try {
			MemberDTO check = memberRepo.findId(sessionId);
			if(member.getUser_id().equals(check.getUser_id()) == false) {
				return "아이디가 일치하지 않습니다.";
			}
			if(passwordEncoder.matches(member.getUser_pw(), check.getUser_pw()) == false) {
				return "비밀번호가 일치하지 않습니다.";
			}
			if(member.getUser_id().equals(check.getUser_id()) && passwordEncoder.matches(member.getUser_pw(), check.getUser_pw())) {
				//파일 삭제하기 위해서~~~~
				String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\qnaUpload\\";
				String path = dir + qna_num;
				File folder = new File(path);
				try {
					while (folder.exists()) {
						File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기

						for (int j = 0; j < folder_list.length; j++) {
							folder_list[j].delete(); // 파일 삭제
							log.info("파일이 삭제되었습니다.");

						}
						if (folder_list.length == 0 && folder.isDirectory()) {
							folder.delete();
						}
					}
				} catch (Exception e) {
					log.error("error QnaService qna_delete() -> {}", e);
				}
				//파일 삭제하기 위해서~~~~~
				repo.qna_delete(qna_num);
				return "삭제 완료";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "아이디 또는 비밀번호를 정확하게 입력해주세요.";
	}

	public void kakao_qna_delete(int qna_num) {
		String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\qnaUpload\\";
		String path = dir + qna_num;
		File folder = new File(path);
		try {
			while (folder.exists()) {
				File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기

				for (int j = 0; j < folder_list.length; j++) {
					folder_list[j].delete(); // 파일 삭제
					log.info("파일이 삭제되었습니다.");

				}
				if (folder_list.length == 0 && folder.isDirectory()) {
					folder.delete();
				}
			}
		} catch (Exception e) {
			log.error("error QnaService qna_delete() -> {}", e);
		}
		//파일 삭제하기 위해서~~~~~
		repo.qna_delete(qna_num);
	}
}
