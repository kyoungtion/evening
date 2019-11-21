package com.kh.evening.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {
	
	@Autowired
	SqlSession sqlsession = null;



	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int checkIdDup(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("memberMapper.idCheck", user_id);
	}

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.updatePwd", loginUser);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.deleteMember", m);
	}

	public int getMyPostListCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.getMyPostListCount", map);
	}

	public ArrayList<Gesipan> selectMyPost(SqlSessionTemplate sqlSession, Map<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyPost", map, rb);
	}

	public String searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId",m);
	}

	public int check_id(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public void update_pw(Member m) {
		// TODO Auto-generated method stub
		
	}
	
	public Object login(String user_email) {
		// TODO Auto-generated method stub
		return null;
	}

	// 비밀번호 변경
		@Transactional
		public int searchPwd(Member m ) throws Exception{
			return sqlsession.update("member.update_pw",m);
		}
	





}