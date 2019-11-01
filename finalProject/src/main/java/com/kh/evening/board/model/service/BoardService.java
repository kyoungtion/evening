package com.kh.evening.board.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.evening.board.model.dao.BoardDAO;

@Service("bService")
public class BoardService {
  
  @Autowired
  private SqlSession sqlSession;
  
  @Autowired
  private BoardDAO bDAO;

}
