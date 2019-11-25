package com.kh.evening.message.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.evening.message.model.vo.Message;

public interface MessageService {

	ArrayList<Message> receiveList(String user_ID);



	ArrayList<Message> sendList(String user_ID);



	void insertMessage(Map param);





	

}
