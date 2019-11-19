package com.kh.evening.gesipan.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.gesipan.model.vo.GesipanReply;

public interface GesipanService {

	int insertGesipan(Gesipan g);

	int getListCount(String category);

	ArrayList<Gesipan> selectGesipanList(PageInfo pi, String category);

	int getSearchListCount(String category, Map<String, String> parameters);

	ArrayList<Gesipan> selectSearchList(PageInfo pi, Map<String, String> parameters);

	Gesipan selectGesipan(int g_id);

	ArrayList<GesipanReply> selectReplyList(int g_ref);

	int insertReply(GesipanReply r);

	Integer getReplyCount(Integer g_ref);

	int updateReply(Map<String, Object> map);

	int deleteReply(Integer r_id);

	int updateGesipan(Gesipan g);

	int deleteGesipan(int g_id);

	int reGesipan(Gesipan g);

	int getListCountByType(String type);

	ArrayList<Gesipan> selectNoticeList(PageInfo pi, String type);

	int deleteAllNotice(String[] idArray);

	int getQnaListCount(String category);

	ArrayList<Gesipan> selectQnaList(PageInfo pi, String category);

	/*Integer getReplyCount(Integer r);*/

	
	
	/*ArrayList<Gesipan> selectCommunityList(PageInfo pi);

	int getCListCount();

	int getSListCount();

	int getQListCount();

	ArrayList<Gesipan> selectSellingList(PageInfo pi);

	ArrayList<Gesipan> selectQnaList(PageInfo pi);*/

	

}
