package com.example.jshop.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.AdminDTO;
import com.example.jshop.dto.QnaDTO;
import com.example.jshop.repository.AdminRepository;
import com.example.jshop.repository.QnaRepository;
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
	@Autowired
	private QnaRepository qnaRepo;

	@GetMapping("/admin")
	public String admin(Model model) {
		if ((Integer) session.getAttribute("loginType") != 3) {
			return "redirect:/";
		}
		model.addAttribute("datas", repo.getAllPrdtInfo());
		return "/admin/adminView";
	}

	@GetMapping("/tablePrdt")
	public String prdtTable(Model model) {
		model.addAttribute("datas", repo.getAllPrdtInfo());
		return "/admin/tablePrdt";
	}

	@GetMapping("/tableQna")
	public String qnaTable(Model model) {
		List<QnaDTO> list = repo.getQnaInfo();
		int sum = 0;
		for (int i = 0; i < list.size(); ++i) {
			++sum;
			list.get(i).setQna_sequence(sum);
			String time = list.get(i).getWrite_time();
			time = time.substring(0, 10);
			list.get(i).setWrite_time(time);
		}
		model.addAttribute("datas", list);
		return "admin/tableQna";
	}

	@GetMapping("/tableMember")
	public String tableMember(Model model) {
		model.addAttribute("datas", repo.getMemberInfo());
		return "admin/tableMember";
	}

	@GetMapping("/prdtWrite")
	public String prdtWrite() {
		if ((Integer) session.getAttribute("loginType") != 3) {
			return "redirect:/";
		}
		return "/admin/prdtWrite";
	}

	@PostMapping("write")
	public String prdtFrom(MultipartHttpServletRequest multi, Model model) {
		String msg = "";
		try {
			msg = service.prdtWrite(multi);
		} catch (Exception e) {
			log.error("error -> {}", e);
		}
		if (msg.equals("업로드 파일을 등록해주세요.")) {
			model.addAttribute("msg", msg);
			return "/admin/prdtWrite";
		}
		if (msg.equals("등록 완료")) {
			return "redirect:/tablePrdt";
		}

		return "/admin/prdtWrite";
	}

	@GetMapping("/prdtView")
	public String prdtView(@RequestParam("prdt_id") String id, Model model) {
		int prdt_id = Integer.parseInt(id);
		model.addAttribute("datas", repo.getSelectPrdtInfo(prdt_id));
		return "/admin/prdtView";
	}

	@GetMapping("/prdtUpdate")
	public String prdtUpdate(@RequestParam("prdt_id") String id, Model model) {
		int prdt_id = Integer.parseInt(id);
		model.addAttribute("datas", repo.getSelectPrdtInfo(prdt_id));
		return "/admin/prdtUpdate";
	}

	@PostMapping("update")
	public String prdtUpdate(AdminDTO datas) {
		String msg = service.prdtUpdate(datas);
		if (msg.equals("수정 완료") == false) {
			return "/admin/prdtUpdate";
		}
		return "redirect:/tablePrdt";
	}

	@GetMapping("/prdtDelete")
	public String prdtDelete(@RequestParam("prdt_id") String id, Model model) {
		int prdt_id = Integer.parseInt(id);
		model.addAttribute("datas", repo.getSelectPrdtInfo(prdt_id));
		return "/admin/prdtDelete";
	}

	@PostMapping("delete")
	public String prdtDelete(String prdt_id) {
		String msg = service.folderDelete(prdt_id);
		if (msg.equals("폴더가 없습니다")) {
			return "/admin/prdtDelete";
		}
		repo.prdtDelete(prdt_id);
		return "redirect:/tablePrdt";
	}

	@GetMapping("qnaView")
	public String qnaView(@RequestParam("qna_num") int qna_num, Model model) {
		QnaDTO qna = qnaRepo.qna_select(qna_num);

		if (qna.getQna_file().equals("등록된 파일이 없습니다.") == false) {
			String qna_file = qna.getQna_file().substring(15);
			qna.setQna_file(qna_file);
		}

		model.addAttribute("data", qna);

		return "/admin/qnaView";
	}
	
	@GetMapping("qnaDelete")
	public String qnaDelete(@RequestParam("qna_num") int qna_num, Model model) {
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
			log.error("error AdminController qnaDelete() -> {}", e);
		}
		//파일 삭제하기 위해서~~~~~
		qnaRepo.qna_delete(qna_num);
		List<QnaDTO> list = repo.getQnaInfo();
		int sum = 0;
		for (int i = 0; i < list.size(); ++i) {
			++sum;
			list.get(i).setQna_sequence(sum);
			String time = list.get(i).getWrite_time();
			time = time.substring(0, 10);
			list.get(i).setWrite_time(time);
		}
		model.addAttribute("datas", list);
		model.addAttribute("msg", "Q&A게시글을 삭제하셨습니다.");
		return "/admin/tableQna";
	}

	@GetMapping("/ex1")
	public String ex1() {
		return "/ex1";
	}
}
