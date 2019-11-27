package com.kh.evening.payment.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.payment.model.vo.Payment;

@Service("pService")
public interface PaymentService {

	int insertPay(Payment p);

	int getListCount();

	ArrayList<Payment> selectPaymentList(PageInfo pi);

	/*int deletePayment(Payment p);*/

	int getSearchListCount(Map<String, String> parameters);

	ArrayList<Payment> selectSearchList(PageInfo pi, Map<String, String> parameters);

	int deletePayment(String[] idArray);

	int auctionMaxPrice(int sgId);

	int deleteAuction(AuctionHistory au);


}
