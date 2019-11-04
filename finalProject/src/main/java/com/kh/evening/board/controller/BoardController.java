package com.kh.evening.board.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;
import javafx.scene.control.Pagination;

@Controller
public class BoardController {

  @Autowired
  private BoardService bService;

  @RequestMapping("auctionList.bo")
  public ModelAndView auctionList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
    int currentPage = 1;
    if (page != null) {
      currentPage = page;
    }
    
    int listCount = bService.getAuctionListCount();
    PageInfo pi = Pageination.getPageInfo(currentPage, listCount);

    ArrayList<Board> alist = bService.boardList(pi);

    if (alist != null) {
      mv.addObject("alist", alist);
      mv.addObject("pi",pi);
      mv.setViewName("auctionBoard");
    } else {
      throw new BoardException("경매 게시판 조회 실패.");
    }

    return mv;
  }

}
