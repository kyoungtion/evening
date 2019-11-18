package com.kh.evening.payment.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.payment.model.vo.Payment;

@Service("pService")
public interface PaymentService {

	int insertPay(Payment p);

	int getListCount();

	ArrayList<Payment> selectPaymentList(PageInfo pi);

}
