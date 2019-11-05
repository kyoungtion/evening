package com.kh.evening.used.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.used.model.dao.UsedDao;




@Service("uService")
public class UsedServiceImpl implements UsedService{

	@Autowired
	private UsedDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(sqlSession,b);
	}

	@Override
	public int insertAttachment(Attachment atm) {
		return bDao.insertAttachment(sqlSession,atm);
	}
	
	
}
