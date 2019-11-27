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
	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	// 아이디 유효성 검사
	public int checkIdDup(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("memberMapper.idCheck", user_id);
	}

	// 로그인
	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	// 아이디찾기
	public String searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId", m);
	}

	// 비밀번호 변경
	/*
	 * @Transactional public int searchPwd(Member m ) throws Exception{ return
	 * sqlsession.update("member.update_pw",m); }
	 */
	public Member kakaoId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.kakaoId", m);
	}

// 경희
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

		return (ArrayList) sqlSession.selectList("memberMapper.selectMyPost", map, rb);
	}

	public int getMemberListCount(SqlSessionTemplate sqlSession, String mType) {
		return sqlSession.selectOne("memberMapper.getMemberListCount", mType);
	}

	public ArrayList<Member> getMembers(SqlSessionTemplate sqlSession, PageInfo pi, String mType) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("memberMapper.getMembers", mType, rb);
	}

	public int updateRankCode(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateRankCode", m);
	}

	public int deleteAllMember(SqlSessionTemplate sqlSession, String[] idArray) {
		return sqlSession.update("memberMapper.deleteAllMember", idArray);
	}

	public int selectSearchMemberListCount(SqlSessionTemplate sqlSession, Map<String, String> parameters) {
		return sqlSession.selectOne("memberMapper.selectSearchMemberListCount", parameters);
	}

	public ArrayList<Member> selectSearchMemberList(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, String> parameters) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("memberMapper.selectSearchMemberList", parameters, rb);
	}

	public int getDeActiMemberListCount(SqlSessionTemplate sqlSession, String memberType) {
		return sqlSession.selectOne("memberMapper.getDeActiMemberListCount", memberType);
	}

	public ArrayList<Member> getDeActiMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String memberType) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("memberMapper.getDeActiMemberList", memberType, rb);
	}

	public int activateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.activateMember", m);
	}

	public int activateAllMember(SqlSessionTemplate sqlSession, String[] idArray) {
		return sqlSession.update("memberMapper.activateAllMember", idArray);
	}

	public int requestSeller(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.requestSeller", m);
	}

	public int getSellerRequestListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getSellerRequestListCount");
	}

	public ArrayList<Member> getSellerRequestList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("memberMapper.getSellerRequestList", null, rb);
	}

	public int acceptMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.acceptMember", m);
	}

	public int acceptAllMember(SqlSessionTemplate sqlSession, String[] idArray) {
		return sqlSession.update("memberMapper.acceptAllMember", idArray);
	}

	public int getSellerListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getSellerListCount");
	}

	public ArrayList<Member> getSellerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getSellerList", null, rb);
	}

  public int updatePenaltyPoint(SqlSessionTemplate sqlSession, Member user) {
    return sqlSession.update("memberMapper.updatePenaltyPoint",user);
  }

//   public Member searchId(SqlSessionTemplate sqlSession, String user_name,String user_email) {
//      return (Member) sqlSession.selectMap("memberMapper.searchId",user_name,user_email);
//   }

	public Member searchPwd(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.searchPwd", map);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Map<String, String> map) {
		System.out.println("DAOMap: " + map);
		return sqlSession.update("memberMapper.changePwd",map);
	}


}