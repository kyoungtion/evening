package com.kh.evening.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
