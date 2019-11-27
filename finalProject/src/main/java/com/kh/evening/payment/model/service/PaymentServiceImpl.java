package com.kh.evening.payment.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.payment.model.dao.PaymentDAO;
import com.kh.evening.payment.model.vo.Payment;

@Service("pService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDAO pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertPay(Payment p) {
		return pDao.insertPay(sqlSession, p);
	}

	@Override
	public int getListCount() {
		return pDao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Payment> selectPaymentList(PageInfo pi) {
		return pDao.selectPaymentList(sqlSession, pi);
	}

/*	@Override
	public int deletePayment(Payment p) {
		return pDao.deletePayment(sqlSession, p);
	}*/

	@Override
	public int getSearchListCount(Map<String, String> parameters) {
		return pDao.selectSearchListCount(sqlSession, parameters);
	}

	@Override
	public ArrayList<Payment> selectSearchList(PageInfo pi, Map<String, String> parameters) {
		return pDao.selectSearchList(sqlSession, pi, parameters);
	}

	@Override
	public int deletePayment(String[] idArray) {
		return pDao.deletePayment(sqlSession, idArray);
	}

	@Override
	public int auctionMaxPrice(int sgId) {
		return pDao.autionMaxPrice(sqlSession, sgId);
	}

	@Override
	public int deleteAuction(AuctionHistory au) {
		return pDao.deleteAuction(sqlSession, au);
	}
	
}
