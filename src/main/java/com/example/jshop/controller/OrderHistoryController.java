package com.example.jshop.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jshop.dto.OrderHistoryDTO;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.repository.OrderRepository;
import com.example.jshop.repository.UserPrdtRepository;
import com.example.jshop.service.OrderHistoryService;

@Controller
public class OrderHistoryController {
	@Autowired
	private OrderHistoryService service;
	@Autowired
	private UserPrdtRepository userRepo;
	@Autowired
	private MemberRepository memberRepo;
	@Autowired
	private OrderRepository repo;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/orders")
	public String orders(Model model) {
		String user_id = (String)session.getAttribute("user_id");
		int totalCart_cnt = 0;
		int result_price = 0;
		List<OrderHistoryDTO> list = userRepo.creditInfoSelect(user_id);
		
		for(int i = 0; i < list.size(); ++i) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Calendar cal = Calendar.getInstance();
	        String payment_time = sdf.format(cal.getTime());
			list.get(i).setPayment_time(payment_time);
			list.get(i).setOrder_type(0);
		}
		service.orderInsert(list);
		userRepo.tmpDelete(user_id);
		try {
			memberRepo.totalCntUpdate(totalCart_cnt, user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			memberRepo.resultPriceUpdate(result_price, user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("totalCart_cnt", totalCart_cnt);
		session.setAttribute("result_price", 0);
		List<OrderHistoryDTO> list2 = repo.orderViewSelect(user_id);
		
		
		int total_mount = 0; //총 수량
		int total_price = 0; // 총 금액
		// ------------------------orderView에 날짜만 나오게 하기 위해서--------------------------------
		for(int i = 0; i < list2.size(); ++i) {
			String[] payment_time = list2.get(i).getPayment_time().split(" ", 10);
			list2.get(i).setPayment_time(payment_time[0]);
			total_mount += list2.get(i).getAddCart_cnt();
			total_price += list2.get(i).getTotal_price();
		}
		// ------------------------orderView에 날짜만 나오게 하기 위해서--------------------------------
		
		model.addAttribute("datas", list2);
		model.addAttribute("total_mount", total_mount);
		model.addAttribute("total_price", total_price);
		
		return "user_orders/orders_index";
	}
	
	@PostMapping("/orders")
	public String orderss(Model model) {
		String user_id = (String)session.getAttribute("user_id");
		List<OrderHistoryDTO> list2 = repo.orderViewSelect(user_id);
		int total_mount = 0; //총 수량
		int total_price = 0; // 총 금액
		// ------------------------orderView에 날짜만 나오게 하기 위해서--------------------------------
		for(int i = 0; i < list2.size(); ++i) {
			String[] payment_time = list2.get(i).getPayment_time().split(" ", 10);
			list2.get(i).setPayment_time(payment_time[0]);
			total_mount += list2.get(i).getAddCart_cnt();
			total_price += list2.get(i).getTotal_price();
		}
		// ------------------------orderView에 날짜만 나오게 하기 위해서--------------------------------
		model.addAttribute("datas", list2);
		model.addAttribute("total_mount", total_mount);
		model.addAttribute("total_price", total_price);
		return "user_orders/orders_index";
	}
}