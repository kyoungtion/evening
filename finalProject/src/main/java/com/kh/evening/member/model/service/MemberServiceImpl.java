package com.kh.evening.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

//import org.apache.catalina.Manager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.member.model.dao.MemberDAO;
import com.kh.evening.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

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

	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public Member enrollView(Member m) {
		return null;
	}

	@Override
	public Member searchId(Member m) {
		return mDAO.searchId(sqlSession, m);
	}

	@Override
	public String getPw(Map<String, Object> paramMap) {
		return null;
	}

	@Override
	public int memberUpdate(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int updatePwd(Member loginUser) {
		return mDAO.updatePwd(sqlSession, loginUser);
	}

	@Override
	public int deleteMember(Member m) {
		return mDAO.deleteMember(sqlSession, m);
	}

}