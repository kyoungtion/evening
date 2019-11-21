package com.kh.evening.message.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.gesipan.model.vo.GesipanReply;
import com.kh.evening.message.model.vo.Message;

@Repository("messageDAO")
public class MessageDAO {


	public ArrayList<Message> receiveList(SqlSession sqlSession) {
		return (ArrayList) sqlSession.selectList("messageMapper.receiveList");
	}

	
	

}
