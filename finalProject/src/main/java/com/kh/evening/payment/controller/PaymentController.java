package com.kh.evening.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.evening.payment.model.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	@RequestMapping("shipInfo.py")
	public String shipInfo() {
		
		return "shipInfo";
	}
}
