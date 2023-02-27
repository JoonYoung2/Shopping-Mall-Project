package com.example.jshop.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String orders(@RequestParam("user_id") String user_id, Model model) {
		int totalCart_cnt = 0;
		int result_price = 0;
		List<OrderHistoryDTO> list = userRepo.creditInfoSelect(user_id);
		
		System.out.println("OrderHistoryDTO List result user_id ========> " + list.get(0).getUser_id());
		System.out.println("OrderHistoryDTO List result prdt_id ========> " + list.get(0).getPrdt_id());
		System.out.println("OrderHistoryDTO List result prdt_price ========> " + list.get(0).getPrdt_price());
		System.out.println("OrderHistoryDTO List result addCart_cnt ========> " + list.get(0).getAddCart_cnt());
		System.out.println("OrderHistoryDTO List result total_price ========> " + list.get(0).getTotal_price());
		System.out.println("OrderHistoryDTO List result prdt_title ========> " + list.get(0).getPrdt_title());
		System.out.println("OrderHistoryDTO List result prdt_color ========> " + list.get(0).getPrdt_color());
		System.out.println("OrderHistoryDTO List result img_id ========> " + list.get(0).getImg_id());
		
		
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
		List<OrderRepository> list2 = repo.orderViewSelect(user_id);
		model.addAttribute("datas", list2);
		
		return "user_orders/orders_index";
	}
}