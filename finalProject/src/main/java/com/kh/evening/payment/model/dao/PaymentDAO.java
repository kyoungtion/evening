package com.kh.evening.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.payment.model.vo.Payment;

@Repository("pDao")
public class PaymentDAO {

	public int insertPay(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.insert("payMapper.insertPay", p);
	}
	

}
