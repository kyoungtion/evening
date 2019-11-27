package com.kh.evening.message.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.evening.message.model.vo.Message;

public interface MessageService {

	ArrayList<Message> receiveList(String user_ID);



	ArrayList<Message> sendList(String user_ID);



	void insertMessage(Map param);



	List<Map<String, Object>> rmessageDetail(Map rparam);



	List<Map<String, Object>> smessageDetail(Map sparam);


	int checkUpdate(Map rparam);



	int getCount(String user_id);



	int deleteRow(String seq);



















	

}