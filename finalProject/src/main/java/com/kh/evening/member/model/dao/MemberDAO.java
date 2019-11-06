package com.kh.evening.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int checkIdDup(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("memberMapper.idCheck", user_id);
	}

}
