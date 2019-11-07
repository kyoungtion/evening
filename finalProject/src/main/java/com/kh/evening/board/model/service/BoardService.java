package com.kh.evening.board.model.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.evening.board.model.dao.BoardDAO;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;

@Service("bService")
public class BoardService {

  @Autowired
  private SqlSession sqlSession;

  @Autowired
  private BoardDAO bDAO;

  public ArrayList<Board> auctionList(PageInfo pi, String modeSet) {
    return bDAO.auctionList(sqlSession, pi, modeSet);
  }

  public int getBoardListCount(String boardCategory) {
    return bDAO.getBoardListCount(sqlSession, boardCategory);
  }

  public ArrayList<Attachment> boardFileList() {
    return bDAO.boardFileList(sqlSession);
  }

  public ArrayList<Board> secondGoodBoardList(PageInfo pi, String modeSet) {
    return bDAO.secondGoodBoardList(sqlSession, pi,modeSet);
  }



}
