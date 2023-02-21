package com.example.jshop.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.AddCartDTO;
import com.example.jshop.dto.AdminDTO;

@Mapper
public interface UserPrdtRepository {
	public AdminDTO getData(String prdt_id);

	public AddCartDTO findSamePrdtId(int prdt_id, String user_id);

	public void cartUpdate(AddCartDTO add);

	public void cartInsert(AddCartDTO add);

	public List<AddCartDTO> selectTotalTmpInfo(String user_id);
	
	public List<AddCartDTO> cartInfoSelect(String user_id);
}
 