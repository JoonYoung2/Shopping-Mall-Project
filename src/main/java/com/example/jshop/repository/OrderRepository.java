package com.example.jshop.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jshop.dto.OrderHistoryDTO;

@Mapper
public interface OrderRepository {
	public void orderInsert(OrderHistoryDTO order);

	public List<OrderRepository> orderViewSelect(String user_id);
}
