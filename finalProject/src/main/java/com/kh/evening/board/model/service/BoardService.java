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

  public ArrayList<Board> auctionList(PageInfo pi) {
    return bDAO.auctionList(sqlSession,pi);
  }

  public int getAuctionListCount() {
    return bDAO.getAuctionListCount(sqlSession);
  }

  public ArrayList<Board> auctionEndTimeList(PageInfo pi) {
    return bDAO.auctionEndTimeList(sqlSession, pi);
  }

  public ArrayList<Attachment> boardFileList() {
    return bDAO.boardFileList(sqlSession);
  }

  public int getSecondGoodListCount() {
    return bDAO.getSecondGoodListCount(sqlSession);
  }

  public ArrayList<Board> secondGoodBoardList(PageInfo pi) {
    return bDAO.secondGoodBoardList(sqlSession,pi);
  }

  public ArrayList<Board> auctionPriceAscList(PageInfo pi) {
    return bDAO.auctionPriceAscList(sqlSession, pi);
  }

  public ArrayList<Board> auctionPriceDescList(PageInfo pi) {
    return bDAO.auctionPriceDescList(sqlSession, pi);
  }

  public ArrayList<Board> secondGoodPriceAscList(PageInfo pi) {
    return bDAO.secondGoodPriceAscList(sqlSession, pi);
  }

  public ArrayList<Board> secondGoodPriceDescList(PageInfo pi) {
    return bDAO.secondGoodPriceDescList(sqlSession, pi);
  }


}
