package com.kh.evening.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PageInfo {
  
  private int currentPage;  // 현재 페이지
  private int listCount;    // 총 게시글 갯수
  private int pageLimit;    // 페이지 제한 ( 보여줄 페이지 수 )
  private int maxPage;      // 최대 몇페이지까지 있는지
  private int startPage;    // 시작 페이지
  private int endPage;      // 끝 페이지
  private int boardLimit;   // 한페이지에 몇개의 게시글을 보여주는지

}
