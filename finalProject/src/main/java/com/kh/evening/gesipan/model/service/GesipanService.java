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

	Integer getReplyCount(Integer r);

	
	
	/*ArrayList<Gesipan> selectCommunityList(PageInfo pi);

	int getCListCount();

	int getSListCount();

	int getQListCount();

	ArrayList<Gesipan> selectSellingList(PageInfo pi);

	ArrayList<Gesipan> selectQnaList(PageInfo pi);*/

	

}