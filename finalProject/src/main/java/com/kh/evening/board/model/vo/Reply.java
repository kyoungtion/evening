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
public class Reply {

	private int REPLY_ID; 			// 댓글 번호
	private String REPLY_DATE; 		// 댓글 날자
	private String USER_ID;			// 유저 아이디
	private String NICKNAME;		// 별명
	private int SG_ID;				// 게시판 번호
	private String REPLY_INFO;		// 댓글 내용 
	private int REPLY_ADD;			// 대댓글 번호
	private Date REPLY_ENROLL_DATE;	// 등록일
	private Date REPLY_UPDATE_DATE;	// 수정일
	private String REPLY_STATUS;	// 삭제 여부

}
