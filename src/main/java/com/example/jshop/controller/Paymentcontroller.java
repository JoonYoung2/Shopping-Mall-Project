package com.example.jshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jshop.repository.PaymentRepository;
import com.example.jshop.repository.UserPrdtRepository;

@Controller
public class Paymentcontroller {
	@Autowired
	private PaymentRepository repo;
	@Autowired
	private UserPrdtRepository userPrdtRepo;
	
	@GetMapping("/payment")
	public String payment(@RequestParam("user_id") String user_id, Model model) {
		model.addAttribute("user", repo.userInfo_select(user_id));
		model.addAttribute("prdt", userPrdtRepo.cartInfoSelect(user_id));
		return "/user_payment/payment_index";
	}
	@GetMapping("/kakaoPayment")
	public String kakaoPayment() {
		return "/user_payment/kakaoPayment";
	}
}