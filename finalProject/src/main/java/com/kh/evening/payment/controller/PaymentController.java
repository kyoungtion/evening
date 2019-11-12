package com.kh.evening.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.evening.payment.model.exception.PaymentException;
import com.kh.evening.payment.model.service.PaymentService;
import com.kh.evening.payment.model.vo.Payment;

//@SessionAttributes("loginUser")
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	// 배송지 정보 입력 폼
	@RequestMapping("shipInfo.py")
	public String shipInfo() {
		
		return "shipInfo";
	}
	
	// 배송 정보 입력 -> DB
	@RequestMapping("pinsert.py")
	public String insertPay(@ModelAttribute Payment p,
							//@RequestParam("postcode") String postcode,
							@RequestParam("post") String postcode,
							@RequestParam("addr1") String addr1,
							@RequestParam("addr2") String addr2) {
		
		p.setP_ADDRESS(postcode + "/" + addr1 + "/" + addr2);
		
		System.out.println(p);
		int result = pService.insertPay(p);
		
		if(result > 0) {
			return "redirect:index";
		}else {
			throw new PaymentException("배송지 정보 입력에 실패하셨습니다.");
		}
	}
}
