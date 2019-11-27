package com.kh.evening.payment.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.AuctionHistory;
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

	public int deletePayment(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.update("payMapper.deletePayment", p);
	}

	public int selectSearchListCount(SqlSessionTemplate sqlSession, Map<String, String> parameters) {
		return sqlSession.selectOne("payMapper.selectSearchListCount", parameters);
	}

	public ArrayList<Payment> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, String> parameters) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("payMapper.selectSearchList", parameters, rb);
	}

	public int deletePayment(SqlSessionTemplate sqlSession, String[] idArray) {
		return sqlSession.update("payMapper.deletePayment", idArray);
	}


	public int autionMaxPrice(SqlSessionTemplate sqlSession, int sgId) {
		return sqlSession.update("payMapper.auctionMaxPrice", sgId);
	}

	public int deleteAuction(SqlSessionTemplate sqlSession, AuctionHistory au) {
		return sqlSession.insert("payMapper.deleteAuction", au);
	}
	

}
