package com.kh.evening.board.model.service;

import java.util.ArrayList;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.GoodLike;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.member.model.vo.Member;

public interface BoardService {

  ArrayList<Board> boardList(PageInfo pi, BoardMode bMode);

  int getBoardListCount(String boardCategory);

  ArrayList<Attachment> boardFileList();

  Board selectOne(int sgId);

  Attachment boardFileList(int sgId);

  int viewCount(int sgId);

  ArrayList<String> category();

  int insertAuction(AuctionHistory ah);

  int auctionMaxPrice(int sgId);

  ArrayList<GoodLike> selectGoodLike(String userId);

  int insertGoodLike(GoodLike user);

  int updateGoodLike(GoodLike gl);

  int updateBoardLike(GoodLike user);

  ArrayList<Board> boardAllList(String bCategory);

}
