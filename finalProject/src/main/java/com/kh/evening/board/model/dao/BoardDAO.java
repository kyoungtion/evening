package com.kh.evening.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

  public ArrayList<Board> auctionList(SqlSession sqlSession, PageInfo pi, String modeSet) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 건너띄기
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); // 건너띄고, ~만큼 읽기

    return (ArrayList) sqlSession.selectList("boardMapper.auctionList", modeSet, rowBounds);
  }

  public int getBoardListCount(SqlSession sqlSession, String boardCategory) {
    return sqlSession.selectOne("boardMapper.getAuctionListCount",boardCategory);
  }

  public ArrayList<Attachment> boardFileList(SqlSession sqlSession) {
    return (ArrayList) sqlSession.selectList("boardMapper.boardFileList");
  }

  public ArrayList<Board> secondGoodBoardList(SqlSession sqlSession, PageInfo pi, String modeSet) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    return (ArrayList) sqlSession.selectList("boardMapper.secondGoodBoardList", modeSet, rowBounds);
  }



}
