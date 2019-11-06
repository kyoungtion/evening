package com.kh.evening.payment.model.service;

import org.springframework.stereotype.Service;

import com.kh.evening.payment.model.vo.Payment;

@Service("pService")
public interface PaymentService {

	int insertPay(Payment p);

}
