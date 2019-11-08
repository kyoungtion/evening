package com.kh.evening.gesipan.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.dao.GesipanDAO;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.gesipan.model.vo.GesipanReply;


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
	public int getListCount(String category) {
		return gDAO.selectListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Gesipan> selectGesipanList(PageInfo pi, String category) {
		return gDAO.selectGesipanList(sqlSession, pi, category);
	}
	
	@Override
	public int getSearchListCount(String category, Map<String, String> parameters) {
		return gDAO.selectSearchListCount(sqlSession, parameters);
	}

	@Override
	public ArrayList<Gesipan> selectSearchList(PageInfo pi, Map<String, String> parameters) {
		return gDAO.selectSearchList(sqlSession, pi, parameters);
	}

	@Override
	public Gesipan selectGesipan(int g_id) {
		Gesipan g = null;
		int result = gDAO.addReadCount(sqlSession, g_id);
		if(result > 0) {
			g = gDAO.selectGesipan(sqlSession,g_id);
		}
		return g;
	}

	@Override
	public ArrayList<GesipanReply> selectReplyList(int g_ref) {
		return gDAO.selectReplyList(sqlSession, g_ref);
	}

	@Override
	public int insertReply(GesipanReply r) {
		return gDAO.insertReply(sqlSession, r);
	}

	@Override
	public Integer getReplyCount(Integer g_ref) {
		return gDAO.getReplyCount(sqlSession, g_ref);
	}

	

	/*@Override
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
	}*/

	
	


}
