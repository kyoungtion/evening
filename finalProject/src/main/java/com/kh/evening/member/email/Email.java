package com.kh.evening.member.email;

public class Email {

   private String subject; //메일제목
   private String content; // 메일 내용
   private String receiver; // 받는 사람의 정보
   public Email() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Email(String subject, String content, String receiver) {
      super();
      this.subject = subject;
      this.content = content;
      this.receiver = receiver;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getReceiver() {
      return receiver;
   }
   public void setReceiver(String receiver) {
      this.receiver = receiver;
   }
   
   
}