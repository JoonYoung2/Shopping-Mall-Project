package com.example.jshop.repository;

import java.util.List;
import java.io.IOException;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.AdminDTO;

@Mapper
public interface AdminRepository {
	public void prdt_write(AdminDTO admin) throws IOException;

	public int maxFindId();
	
	public void imgUpdate(int prdt_id, String img_id);

//	public List getImgView();

}
 