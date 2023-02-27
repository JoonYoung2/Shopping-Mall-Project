package com.example.jshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.OrderHistoryDTO;
import com.example.jshop.repository.OrderRepository;

@Service
public class OrderHistoryService {
	@Autowired
	private OrderRepository repo;
	
	
	public String orderInsert(List<OrderHistoryDTO> list) {
		for(int i = 0; i < list.size(); ++i) {
			OrderHistoryDTO order = list.get(i);
			repo.orderInsert(order);
		}
        return "저장 완료";
	}
}
