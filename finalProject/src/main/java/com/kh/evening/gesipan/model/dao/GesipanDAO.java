package com.kh.evening.gesipan.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.gesipan.model.vo.Gesipan;

@Repository("gDAO")
public class GesipanDAO {

	public int insertGesipan(SqlSessionTemplate sqlSession, Gesipan g) {
		return sqlSession.insert("gesipanMapper.insertGesipan", g);
	}

}
