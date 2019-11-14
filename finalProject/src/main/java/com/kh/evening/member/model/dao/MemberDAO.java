package com.kh.evening.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int checkIdDup(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("memberMapper.idCheck", user_id);
	}

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public Member searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId", m);
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

	public int getMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getMemberListCount");
	}

	public ArrayList<Member> getMembers(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getMembers", null, rb);
	}

//   public Member searchId(SqlSessionTemplate sqlSession, String user_name,String user_email) {
//      return (Member) sqlSession.selectMap("memberMapper.searchId",user_name,user_email);
//   }

//   public String getPw(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
//      return sqlSession.selectOne("memberMapper.getPw", paramMap);
//   }

}