package com.example.jshop.repository;

import java.util.List;
import java.io.IOException;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.AdminDTO;
import com.example.jshop.dto.QnaDTO;

@Mapper
public interface AdminRepository {
	public void prdt_write(AdminDTO admin) throws IOException;

	public int maxFindId();
	
	public void imgUpdate(int prdt_id, String img_id);

	public List<AdminDTO> getAllPrdtInfo();
	
	public AdminDTO getSelectPrdtInfo(int prdt_id);
	
	public void prdtUpdate(AdminDTO datas);
	
	public void prdtDelete(String prdt_id);

	public List<QnaDTO> getQnaInfo();

}
  