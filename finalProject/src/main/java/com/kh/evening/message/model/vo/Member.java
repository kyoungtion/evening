package com.kh.evening.member.model.vo;

import java.sql.Date;

import lombok.*;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
   
   private String user_id;
   private String rank_code;
   private String user_pwd;
   private String nickName;
   private String user_name;
   private String user_email;
   private String phone;
   private String user_residentNumber;
   private String address;
   private Date enroll_date;
   private Date update_date;
   private String bookmark;
   private String status;
   private int penalty_point;
   private Date penalty_date;
   private int penalty_stack;
   
   // rank_code
   private RankCode rankCode;
   
}