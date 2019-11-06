package com.kh.evening.gesipan.model.service;

import java.util.ArrayList;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;

public interface GesipanService {

	int insertGesipan(Gesipan g);

	int getListCount();

	ArrayList<Gesipan> selectCommunityList(PageInfo pi);

}
