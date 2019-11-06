package com.kh.evening.gesipan.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.dao.GesipanDAO;
import com.kh.evening.gesipan.model.vo.Gesipan;


@Service("gService")
public class GesipanServiceImpl implements GesipanService{
	@Autowired
	private GesipanDAO gDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertGesipan(Gesipan g) {
		return gDAO.insertGesipan(sqlSession, g);
	}

	@Override
	public int getCListCount() {
		return gDAO.getCListCount(sqlSession);
	}

	@Override
	public int getSListCount() {
		return gDAO.getSListCount(sqlSession);
	}

	@Override
	public int getQListCount() {
		return gDAO.getQListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Gesipan> selectCommunityList(PageInfo pi) {
		return gDAO.selectCommunityList(sqlSession, pi);
	}

	@Override
	public ArrayList<Gesipan> selectSellingList(PageInfo pi) {
		return gDAO.selectSellingList(sqlSession, pi);
	}

	@Override
	public ArrayList<Gesipan> selectQnaList(PageInfo pi) {
		return gDAO.selectQnaList(sqlSession, pi);
	}


}
