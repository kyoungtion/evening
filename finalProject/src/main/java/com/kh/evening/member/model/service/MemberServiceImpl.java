package com.kh.evening.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

//import org.apache.catalina.Manager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
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
   public String searchId(Member m) {
      return mDAO.searchId(sqlSession, m);
   }

   @Override
   public Member kakaoLogin(Member m) {
      return mDAO.kakaoId(sqlSession, m);
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

   @Override
   public int getMyPostListCount(Map<String, String> map) {
      return mDAO.getMyPostListCount(sqlSession, map);
   }

   @Override
   public ArrayList<Gesipan> selectMyPost(PageInfo pi, Map<String, String> map) {
      return mDAO.selectMyPost(sqlSession, map, pi);
   }

   @Override
   public int getMemberListCount() {
      return mDAO.getMemberListCount(sqlSession);
   }

   @Override
   public ArrayList<Member> getMembers(PageInfo pi) {
      return mDAO.getMembers(sqlSession, pi);
   }

   @Override
   public int updateRankCode(Member m) {
      return mDAO.updateRankCode(sqlSession, m);
   }

   @Override
   public int deleteAllMember(String[] idArray) {
      return mDAO.deleteAllMember(sqlSession, idArray);
   }

   @Override
   public int getSearchMemberListCount(Map<String, String> parameters) {
      return mDAO.selectSearchMemberListCount(sqlSession, parameters);
   }

   @Override
   public ArrayList<Member> getSearchMemberList(PageInfo pi, Map<String, String> parameters) {
      return mDAO.selectSearchMemberList(sqlSession, pi, parameters);
   }

   @Override
   public int getDeActiMemberListCount() {
      return mDAO.getDeActiMemberListCount(sqlSession);
   }

   @Override
   public ArrayList<Member> getDeActiMemberList(PageInfo pi) {
      return mDAO.getDeActiMemberList(sqlSession, pi);
   }

   @Override
   public int activateMember(Member m) {
      return mDAO.activateMember(sqlSession, m);
   }

   @Override
   public int activateAllMember(String[] idArray) {
      return mDAO.activateAllMember(sqlSession, idArray);
   }

   @Override
   public int requestSeller(Member m) {
      return mDAO.requestSeller(sqlSession, m);
   }

   @Override
   public int getSellerRequestListCount() {
      return mDAO.getSellerRequestListCount(sqlSession);
   }

   @Override
   public ArrayList<Member> getSellerRequestListCount(PageInfo pi) {
      return mDAO.getSellerRequestList(sqlSession, pi);
   }

   @Override
   public int acceptMember(Member m) {
      return mDAO.acceptMember(sqlSession, m);
   }

   @Override
   public int acceptAllMember(String[] idArray) {
      return mDAO.acceptAllMember(sqlSession, idArray);
   }

   @Override
   public String getPw(Map<String, Object> paramMap) {
      // TODO Auto-generated method stub
      return null;
   }

}