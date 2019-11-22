package com.kh.evening.board.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Board {
  
  private int SG_ID;            // 게시판번호
  private String USER_ID;       // 유저 아이디
  private String b_Category;    // 게시판 종류
  private String SG_BNAME;      // 게시판 이름
  private String SG_NAME;       // 닉네임
  private String TAG_NAME;      // 태그
  private int SG_COUNT;			// 조회수
  private int SG_LIKE;			// 좋아요 카운트
  private int SG_PRICE;         // 판매가격(즉매가)
  private int SG_SPRICE;        // 경매시작가격
  private String SG_INFO;       // 내용
  private String SG_CHECK;      // 거래완료 여부
  private Date SG_ENROLL_DATE;  // 가입일
  private Date SG_UPDATE_DATE;  // 수정일
  private String SG_STATUS;     // 삭제여부
  private Date SG_END_DATE;     // 경매 종료일
  private String SG_DEAL;		// 거래방법
  private String SG_AREA;		// 거래지역
  private String SG_DELIVERY;	// 무료배송여부
  
  private Reply reply;
  

}
