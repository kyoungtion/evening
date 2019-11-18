package com.kh.evening.gesipan.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Gesipan {
	
//	 경히 안뇨오옹옹 키보드 소리가 참 좋구나아아아 히힣
//	 경히야아아아아아ㅓ다리니아라다내댜구어파타ㅣ니ㅏㄷ자ㅣㅓㄴ아ㅣㄴ앙ㄴ리ㅏ젇가ㅣㄴ이ㅏ미ㅏㅇ라아가
//	 마라탕먹으러간다 오늘으으으으르르를 ㅎ___ㅎ
//	 파이널 힘들지? 흑흑
//	 힘내애 ㅠ__ㅠ <33333
	private int g_id;
	private String g_category;
	private String g_title;
	private String g_content;
	private String g_writer;
	private String nickname;
	private int g_count;
	private Date g_enroll_date;
	private Date g_update_date;
	private int g_ref;
	private String g_status;
	private String locked;
	private String g_pwd;
	private int g_order;
	private String g_type;

}
