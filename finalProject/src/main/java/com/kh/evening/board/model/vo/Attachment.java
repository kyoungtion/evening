package com.kh.evening.board.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Attachment {
  
  private int FILE_ID;              // 파일 번호
  private int SG_ID;                // 게시판 번호
  private String ORIGINALFILENAME;  // 오리지널 이름
  private String RENAMEFILENAME;    // 수정된 이름
  private Date FILE_ENROLL_DATE;    // 등록일
  private Date FILE_UPDATE_DATE;    // 수정일
  private String FILE_STATUS;       // 삭제여부

}
