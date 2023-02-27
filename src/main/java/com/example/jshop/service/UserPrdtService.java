package com.example.jshop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.AddCartDTO;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.repository.UserPrdtRepository;

@Service
public class UserPrdtService {
	@Autowired
	private UserPrdtRepository repo;
	@Autowired
	private MemberRepository MemberRepo;
	@Autowired
	private HttpSession session;
	
	public String addCart(AddCartDTO add) {
		AddCartDTO check = repo.findSamePrdtId(add.getPrdt_id(), add.getUser_id());
		if(check != null) {
			if(check.getPrdt_id() == add.getPrdt_id()) {
				int total_price = add.getAddCart_cnt() * add.getPrdt_price();
				add.setTotal_price(total_price);
				repo.cartUpdate(add);
				
				//----------------------CartAdd 갯수 파악-----------------------
				
				List<AddCartDTO> list = repo.selectTotalTmpInfo(add.getUser_id());
				int sum = 0;
				for(int i = 0; i < list.size(); ++i) {
					sum += list.get(i).getAddCart_cnt();
				}
				try {
					MemberRepo.totalCntUpdate(sum, add.getUser_id());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.setAttribute("totalCart_cnt", sum);
				
				//----------------------CartAdd 갯수 파악-----------------------
				
				//----------------------Cart총 결재 금액-------------------------
				
				List<AddCartDTO> list2 = repo.cartInfoSelect(add.getUser_id());
				int sum2 = 0;
				for(int i = 0; i < list2.size(); ++i) {
					sum2 += list2.get(i).getTotal_price();
				}
				try {
					MemberRepo.resultPriceUpdate(sum2, add.getUser_id());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.setAttribute("result_price", sum2);
				
				//----------------------Cart총 결재 금액-------------------------
				
				return "업데이트 완료";
			}
		}
		int total_price = add.getAddCart_cnt() * add.getPrdt_price();
		add.setTotal_price(total_price);
		repo.cartInsert(add);
		
		//----------------------CartAdd 갯수 파악-----------------------
		
		List<AddCartDTO> list = repo.selectTotalTmpInfo(add.getUser_id());
		int sum = 0;
		for(int i = 0; i < list.size(); ++i) {
			sum += list.get(i).getAddCart_cnt();
		}
		try {
			MemberRepo.totalCntUpdate(sum, add.getUser_id());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("totalCart_cnt", sum);
		
		//----------------------CartAdd 갯수 파악-----------------------
		
		//----------------------Cart총 결재 금액-------------------------
		
		List<AddCartDTO> list2 = repo.cartInfoSelect(add.getUser_id());
		int sum2 = 0;
		for(int i = 0; i < list2.size(); ++i) {
			sum2 += list2.get(i).getTotal_price();
		}
		try {
			MemberRepo.resultPriceUpdate(sum2, add.getUser_id());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("result_price", sum2);
		
		//----------------------Cart총 결재 금액-------------------------
		return "담기 완료";
	}
}
 