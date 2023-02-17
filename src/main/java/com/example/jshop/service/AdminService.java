package com.example.jshop.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
		String admin_id = multi.getParameter("admin_id");
		String prdt_title = multi.getParameter("prdt_title");
		String prdt_nm = multi.getParameter("prdt_nm");
		String prdt_price = multi.getParameter("prdt_price");
		String prdt_color = multi.getParameter("prdt_color");
		String prdt_info = multi.getParameter("prdt_info");
		MultipartFile img_id = multi.getFile("file");
		System.out.println("admin_id -------------> " + admin_id);
		AdminDTO admin = new AdminDTO();
		admin.setAdmin_id(admin_id);
		admin.setPrdt_title(prdt_title);
		admin.setPrdt_nm(prdt_nm);
		admin.setPrdt_price(prdt_price);
		admin.setPrdt_color(prdt_color);
		admin.setPrdt_info(prdt_info);
		admin.setImg_id("임시저장");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			repo.prdt_write(admin);
			try {

				Thread.sleep(1000); //1초 대기

			} catch (InterruptedException e) {

				e.printStackTrace();

			}
		} catch (IOException e) {
			log.error("service repo.prdt_write error ========> {}", e);;
		}
		
		int max_id = repo.maxFindId(); //고유한 폴더에 img파일을 보관하기 or img_id를 update하기 위해서..
		
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
}
 