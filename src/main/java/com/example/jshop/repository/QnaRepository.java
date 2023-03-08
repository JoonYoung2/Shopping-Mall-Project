package com.example.jshop.repository;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.QnaDTO;

@Mapper
public interface QnaRepository {

	public void qna_insert(QnaDTO qna) throws IOException;
	
	public int maxFindId();

	public void fileUpdate(int qna_num, String qna_file);

	public List<QnaDTO> qna_list(String user_id);

	public QnaDTO qna_select(int qna_num);

	public String getMessage();

	public String getFile(int qna_num);

	public void qna_update(QnaDTO qna);

	public void qna_delete(int qna_num);
}
