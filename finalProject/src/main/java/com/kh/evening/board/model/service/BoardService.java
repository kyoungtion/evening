package com.kh.evening.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.GoodLike;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.board.model.vo.Reply;
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
  
	int insertBoard(Board b);

	int insertAttachment(Attachment atm);

	int updateBoard(Board b,int type);

	int updateAttachment(Attachment atm);

	int deleteBoard(int sgId);

	ArrayList<Reply> selectReplyList(int sgId, PageInfo pi);

	int insertReply(Reply r, boolean add);

	int deleteReply(Reply r, boolean b);

	int getReplyListCount(int sG_ID);

	int replyUpdate(Reply r);

	int getBoardListCount(Map<String, String> map);

	ArrayList<Board> myBoardList(PageInfo pi, Map<String, String> map);

	int getAuctionHistoryCount(String user_id);

	ArrayList<AuctionHistory> getAuctionHistoryList(PageInfo pi, String user_id);

	ArrayList<Board> myLikeList(PageInfo pi, Map<String, String> map);

	int myLikeListCount(Map<String, String> map);

	int updateall(String user_id);

}
