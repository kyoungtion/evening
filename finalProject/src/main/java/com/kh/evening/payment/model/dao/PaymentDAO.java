package com.kh.evening.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.payment.model.vo.Payment;

@Repository("pDao")
public class PaymentDAO {

	public int insertPay(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.insert("payMapper.insertPay", p);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("payMapper.getListCount");
	}

	public ArrayList<Payment> selectPaymentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getPageLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPageLimit());
		return (ArrayList)sqlSession.selectList("payMapper.selectPaymentList", null, rowBounds);
	}
	

}
