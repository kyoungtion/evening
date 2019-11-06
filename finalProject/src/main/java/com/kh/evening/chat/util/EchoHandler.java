package com.kh.evening.chat.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler{

    //세션을 모두 저장한다.
    //방법 1 :  1:1 채팅
	//private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
    
    //방법 2 : 전체 채팅
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("=================afterConnectionEstablished===============");
    	
    	//맵을 쓸때 방법
    	//sessions.put(session.getId(), session);
        //List쓸때 방법
        sessionList.add(session);
        //세션값을 불러온
        //0번째 중괄호에 session.getId()을 넣으라는뜻
        logger.info("{} 연결됨", session.getId()); 
        
        //Session값을 가지고 데이터베이스등의 작업을 하면 채팅 참여 사용자 정보 리스트를 구현할 수 있다.//
        System.out.println("채팅방 입장자: " + session.getPrincipal().getName());
    }
    
    /**
     * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        //0번째에 session.getId() 1번째에 message.getPayload() 넣음
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});
        
        //연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
        //getPrincipal()를 이용해서 세션에 물려있는 유저의 정보를 불러온다.세션의 정보는 User를 이용한것과 동일하다.//
        for(WebSocketSession sess : sessionList){
        	sess.sendMessage(new TextMessage(session.getPrincipal().getName()+ "|" + message.getPayload()));
        }
        
        // 맵 방법.
        /*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
        //session.sendMessage(new TextMessage("echo:" + message.getPayload()));
    }
    
    /**
     * 클라이언트 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        //List 삭제
        sessionList.remove(session);
        
        //Map 삭제
        //sessions.remove(session.getId());
        
        logger.info("{} 연결 끊김.", session.getId());
        
        System.out.println("채팅방 퇴장자: " + session.getPrincipal().getName());
    }
 
}