package com.kh.evening.gesipan.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;

@Repository("gDAO")
public class GesipanDAO {

	public int insertGesipan(SqlSessionTemplate sqlSession, Gesipan g) {
		return sqlSession.insert("gesipanMapper.insertGesipan", g);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gesipanMapper.selectListCount");
	}

	public ArrayList<Gesipan> selectCommunityList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gesipanMapper.selectCommunityList", null, rb);
	}

}
