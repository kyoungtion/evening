package com.kh.evening.board.model.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.evening.board.model.dao.BoardDAO;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;

@Service("bService")
public class BoardService {
  
  @Autowired
  private SqlSession sqlSession;
  
  @Autowired
  private BoardDAO bDAO;

  public ArrayList<Board> boardList(PageInfo pi) {
    return bDAO.boardList(sqlSession,pi);
  }

  public int getAuctionListCount() {
    return bDAO.getAuctionListCount(sqlSession);
  }

}
