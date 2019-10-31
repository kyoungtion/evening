package com.kh.evening.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.evening.board.model.service.BoardService;

@Controller
public class BoardController {
  
  @Autowired
  private BoardService bService;
  
  @RequestMapping("auctionList.bo")
  public String auctionList() {
    return "auctionBoard";
  }

}
