/*package com.kh.evening.member.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
   
   
   @Autowired
   protected JavaMailSender mailSender; //얘는 왜 오류가 날까?
   
   public void SendMail(Email email) {
      
   
      MimeMessage msg = EmailSender.createMimeMessage();
      
      try {
         
         msg.setSubject(email.getSubject());
         msg.setText(email.getContent());
         msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
         
      }catch(MessagingException e) {
         System.out.println("MessagingException");
         e.printStackTrace();
      }
   
      try {
         mailSender.send(msg);
         
      }catch(MailException e) {
         System.out.println("MailException발생!!");
         
      
      }
      
      
      
   }

   private static MimeMessage createMimeMessage() {
      // TODO Auto-generated method stub
      return null;
   }

   private static MimeMessage createMaimeMessage() {
      // TODO Auto-generated method stub
      return null;
   }

}
*/