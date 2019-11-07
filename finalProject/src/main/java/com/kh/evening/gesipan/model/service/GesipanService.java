package com.kh.evening.gesipan.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;

public interface GesipanService {

	int insertGesipan(Gesipan g);

	int getListCount(String category);

	ArrayList<Gesipan> selectGesipanList(PageInfo pi, String category);

	int getSearchListCount(String category, Map<String, String> parameters);

	ArrayList<Gesipan> selectSearchList(PageInfo pi, Map<String, String> parameters);
	
	/*ArrayList<Gesipan> selectCommunityList(PageInfo pi);

	int getCListCount();

	int getSListCount();

	int getQListCount();

	ArrayList<Gesipan> selectSellingList(PageInfo pi);

	ArrayList<Gesipan> selectQnaList(PageInfo pi);*/

	

}
