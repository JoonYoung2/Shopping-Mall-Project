package com.example.jshop.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.jshop.dto.AdminDTO;
import com.example.jshop.repository.AdminRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	@Autowired
	private AdminRepository repo;
	
	public String prdtWrite(MultipartHttpServletRequest multi) {
		String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\upload\\";
//		String dir = "D:\\springs\\jshop\\jshop_Springboot\\src\\main\\webapp\\resources\\upload\\";
		String admin_id = multi.getParameter("admin_id");
		String prdt_title = multi.getParameter("prdt_title");
		String prdt_nm = multi.getParameter("prdt_nm");
		String prdt_price = multi.getParameter("prdt_price");
		String prdt_color = multi.getParameter("prdt_color");
		String prdt_info = multi.getParameter("prdt_info");
		int prdt_list = Integer.parseInt(multi.getParameter("prdt_list"));
		MultipartFile img_id = multi.getFile("file");
		if(img_id.getSize() == 0) {
			return "업로드 파일을 등록해주세요.";
		}
		AdminDTO admin = new AdminDTO();
		admin.setAdmin_id(admin_id);
		admin.setPrdt_title(prdt_title);
		admin.setPrdt_nm(prdt_nm);
		admin.setPrdt_price(prdt_price);
		admin.setPrdt_color(prdt_color);
		admin.setPrdt_info(prdt_info);
		admin.setPrdt_list(prdt_list);
		admin.setImg_id("임시저장");
		try { 
			repo.prdt_write(admin);
		} catch (IOException e) {
			log.error("error Adminservice prdtWrite() repo.prdt_write error ========> {}", e);;
		}
		
		int max_id = repo.maxFindId(); //고유한 폴더에 img파일을 보관하기 or img_id를 update하기 위해서..
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String fName = "";
		if(img_id != null && img_id.getSize() != 0) {
			fName = img_id.getOriginalFilename();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fName = sdf.format(cal.getTime()) + fName;
			
			String path = dir + max_id + "\\" + fName;
			
			File file = new File(path);
			if(file.exists() == false) 
				file.mkdirs();				
			
			try {
				img_id.transferTo(file);
			} catch (Exception e) {
				log.error("img_id error ---> {}", e);
			} 
		}
		
		repo.imgUpdate(max_id, fName);
		
		return "등록 완료";
	}
	
	public String prdtUpdate(AdminDTO datas) {
		repo.prdtUpdate(datas);
		return "수정 완료";
	}

	public String folderDelete(String id) {
		int prdt_id = Integer.parseInt(id);
		AdminDTO datas = repo.getSelectPrdtInfo(prdt_id);
		String dir = "D:\\springboots\\jshop_Springboot\\src\\main\\webapp\\resources\\upload\\";
//		String dir = "D:\\springs\\jshop\\jshop_Springboot\\src\\main\\webapp\\resources\\upload\\";
		String path = dir + datas.getPrdt_id();
		File folder = new File(path);
		try {
		    while(folder.exists()) {
			File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
					
			for (int j = 0; j < folder_list.length; j++) {
				folder_list[j].delete(); //파일 삭제 						
			}
			if(folder_list.length == 0 && folder.isDirectory()) {
				folder.delete();
				return "폴더 삭제 완료";
			}
		    }
		}catch(Exception e) {
			log.error("error AdminService folderdelete() -> {}", e);
		}
		return "폴더가 없습니다";
	}
}
 