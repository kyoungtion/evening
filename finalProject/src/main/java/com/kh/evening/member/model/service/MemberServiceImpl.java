package com.kh.evening.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.member.model.dao.MemberDAO;
import com.kh.evening.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	
	/////////////////////////////////////////

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int checkIdDup(String user_id) {
		return mDAO.checkIdDup(sqlSession, user_id);
	}
}
