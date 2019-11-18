package com.kh.evening.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

  public ArrayList<Board> boardList(SqlSession sqlSession, PageInfo pi, BoardMode bMode) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 건너띄기
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); // 건너띄고, ~만큼 읽기

    return (ArrayList) sqlSession.selectList("boardMapper.boardList", bMode, rowBounds);
  }

  public int getBoardListCount(SqlSession sqlSession, String boardCategory) {
    return sqlSession.selectOne("boardMapper.getAuctionListCount", boardCategory);
  }

  public ArrayList<Attachment> boardFileList(SqlSession sqlSession) {
    return (ArrayList) sqlSession.selectList("boardMapper.boardFileList");
  }

  public Attachment boardFileList(SqlSession sqlSession, int sg_id) {
    return sqlSession.selectOne("boardMapper.boardFileOne", sg_id);
  }

  public Board boardSelectOne(SqlSession sqlSession, int sg_id) {
    return sqlSession.selectOne("boardMapper.boardSelectOne", sg_id);
  }

  public int viewCount(SqlSession sqlSession, int sg_id) {
    sqlSession.update("boardMapper.boardViewCount", sg_id);
    return 1;
  }

  public ArrayList<String> insertF(SqlSession sqlSession) {
    return (ArrayList) sqlSession.selectList("boardMapper.category");
  }

  public int insertAuction(SqlSession sqlSession, AuctionHistory ah) {
    return sqlSession.insert("boardMapper.insertAuction",ah);
  }

  public int auctionMaxPrice(SqlSession sqlSession, int sgId) {
    return sqlSession.update("boardMapper.auctionMaxPrice",sgId);
  }




}
