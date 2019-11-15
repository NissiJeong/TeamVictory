package team.sports.matching;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;


import team.sports.matching.service.BasketballDAO;
import team.sports.matching.service.BasketballDTO;

@Controller
public class BasketballMatchingHandler extends TextWebSocketHandler{
      
   @Resource(name = "basketball")
   
   private BasketballDAO bdao;
   
   public Map<WebSocketSession, String> clients = new ConcurrentHashMap<WebSocketSession, String>();
  
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
     
	  System.out.println(session.getId()+"접속");
	  clients.put(session, session.getId());//들어온 세션 저장
	  System.out.println("afterConnectionEstablished의 클라이언츠 사이즈 : "+clients.size());
      
      //방 목록 JSON으로 뿌려주기
      Map<String, Object> map = new HashMap<String, Object>();
       
      java.util.List<BasketballDTO> list = bdao.roomList(map);
      
      ObjectMapper mapper = new ObjectMapper();
      
      String roomList = mapper.writeValueAsString(list);
      //String newJson = "{\"start\":"+roomList+"}";
      TextMessage msg2 = new TextMessage("start"+roomList);
      
      System.out.println(roomList);
     
      
      for(WebSocketSession room : clients.keySet()) {
    	  
    	  if(room.getId() == session.getId()) {
    		  
    	  room.sendMessage(msg2);
    	  
    	 
    	  }
      }
      
     
      
   }
   
   //클라이언트와 연결이 끊었졌을때 호출되는 콜백 메소드]
   //-컬렉션에 저장된 클라이언트 삭제
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
     
	   System.out.println(session.getId()+"연결이 끊어졌다 임마");   
	   
	   clients.remove(session);//세션지우기
     
  }
   
   //클라이언트로 부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
   //클라이언트로부터 전송되는 모든 메시지 처리
   
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	   
	   Set<WebSocketSession> rooms=clients.keySet();
	   
	   System.out.println("방수입니다:"+rooms.size());
	   
       System.out.println(session.getId()+"로부터 받은 메시지:"+message.getPayload()); //여기부터문제야
                
        Map connection = new HashMap(); //title = 시작인덱스 5
        Map priUsers = new HashMap(); //이전방 유저 담을 Map
        int startIndex = message.getPayload().indexOf("=");
        //방 만들거나 들어오면 넘어오는 TITLE
        String title="";
        //방 만들거나 들어오면 넘어오는 ID
        String id ="";
        //INSERT용
        int affected=0;
        //DELETE용
        int delete=0;
        //방 유저 수 ++
        int remainCountInc=0;
        //방 유저수 --
        int remainCountDec=0;
        //이전 방
        String priTitle = "";
        
        if(message.getPayload().contains("=")) {
        	
        title = message.getPayload().substring(5,startIndex); 
        
        id = message.getPayload().substring(startIndex+1);
        
        connection.put("id", id);
        connection.put("title", title);
        
        int count = Integer.parseInt(bdao.limitRoom(connection)); //3
       
        System.out.println("접속한 아이디 : "+id);
        System.out.println("접속한 방 : "+title);
        System.out.println("방접속인원 : "+count);
        
        if(count == 3) {
           
           clients.remove(session);
           
           return ;
        }
        
        //접속한 유저가 있는 방
        List<BasketballDTO> existRoom = bdao.selectTitle(connection);//원래있던 방
      
        remainCountInc = bdao.remainCountInc(connection);//현재 들어간방 카운트 +1
        
        
        
        for(int i = 0 ; i < existRoom.size(); i++) {
           System.out.println("들어온 방 : "+title);
           System.out.println("있던 방 : "+existRoom.get(i).getTitle());
           System.out.println("사이즈 : "+existRoom.size());
           
          if(existRoom.get(i).getTitle().equals(title)) { //방장이 새로 방을 생성했을 경우
             //있던방 count -1 후 옮긴 방 +1
        	 //DB에 타이틀이랑 들어와진 title이랑 같지 않을때
        	 remainCountDec = bdao.remainCountDec(existRoom.get(i).getTitle());
        	 remainCountDec = bdao.remainCountDec(existRoom.get(i).getTitle());
        	 remainCountInc = bdao.remainCountInc(connection);//옮긴방에 Count+1
             
          }
          else if(!existRoom.get(i).getTitle().equals(title)) {
        	  
        	  remainCountDec = bdao.remainCountDec(existRoom.get(i).getTitle());
        	  
          }
          else if(existRoom.get(i).getTitle().equals(null)){
            
             remainCountInc = bdao.remainCountInc(connection);//옮긴방에 Count+1
             
          }
        }
       
        //Count가 0인 방 삭제
        bdao.removeRoom();
        Map c8 = new HashMap();
        java.util.List<BasketballDTO> list = bdao.roomList(c8);
        
        for(int i = 0 ; i < list.size(); i++) {
        	System.out.println("removeRoom 실행 된 후 remainCount : "+list.get(i).getRemainCount());
        	System.out.println("removeRoom 실행된 후 남은 title : "+list.get(i).getTitle());
        }
        
        //방 생성시 방뿌려주기
        Map<String, Object> map = new HashMap<String, Object>();
        
        java.util.List<BasketballDTO> titleList = bdao.roomList(map);
        
        ObjectMapper mapper1 = new ObjectMapper();
        
        String roomTitles = mapper1.writeValueAsString(titleList);
        //String newJson = "{\"list\":"+roomTitles+"}";  
        TextMessage msg2 = new TextMessage("list"+roomTitles);
        
        System.out.println("handleTextMessage에서 보냄 : "+roomTitles);
       
        System.out.println("방수:"+rooms.size());
        
        for(WebSocketSession room : rooms) {
        
        	room.sendMessage(msg2);
           
        }
        
        //이전방의 카운트
        delete = bdao.deleteChat(connection);// 접속하면 DELETE  //DELETE가 안되고 INSERT되버림
        
        affected = bdao.chatMember(connection);// 후 INSERT
        
        clients.put(session, id);
        
        System.out.println("session.size() : "+clients.size());
        	
        
        //방 이동시 같은방에 있을 때 접속자목록 뿌리기 / 이전방에도 수정해줘야됨
        List<BasketballDTO> userList = bdao.joinMember(title);
        
        //이전방에 있던 유저목록보내기
       /*
        for(int i = 0 ; i < existRoom.size() ; i++) {
        	if(existRoom.get(i).getTitle() != title) {
        		 priTitle = existRoom.get(i).getTitle();
        		 System.out.println("방 클릭했을 때 이전 방 : "+priTitle);
        		 priUsers.put("title", priTitle);
        	}
        }
        List<BasketballDTO> priUser = bdao.joinMember(priTitle);
        
        System.out.println("이전방에 있던 유저 : "+priUser);
        
        ObjectMapper mapper2 = new ObjectMapper();
        
        String users = mapper2.writeValueAsString(priUser);
        
        TextMessage msg3 = new TextMessage("priUser"+users);
        
        System.out.println("전방에 있던 id : "+users);
        
        for(int i = 0 ; i < priUser.size() ; i++) {
        	
        	System.out.println(priTitle+"에 있는 유저 : "+priUser.get(i).getId());
        	
        	for(WebSocketSession priRoom : clients.keySet()) {
        		
        		System.out.println("이전방 세션 : "+priRoom.getId());
        		
        		if(clients.get(priRoom).equals(priUser.get(i).getId())) {
        			System.out.println(clients.get(priRoom).equals(priUser.get(i).getId()));
        			priRoom.sendMessage(msg3);
        		}
        	}
        }
        */
        //클릭한 방에 있는 유저 클라이언트한테 보내기.
        ObjectMapper mapper = new ObjectMapper();
        
        String roomList = mapper.writeValueAsString(userList);
        
        TextMessage msg = new TextMessage("user"+roomList);
        
        System.out.println("클릭한 방에 접속중인 유저목록:"+roomList);
        
        for(int i = 0 ; i < userList.size(); i++) {
        	
        	System.out.println(title+"에 있는 유저 : "+userList.get(i).getId());
        	
	        for(WebSocketSession room : clients.keySet()) {
	        	
	            System.out.println("첫번째 session : "+room.getId());
	            
	            if(clients.get(room).equals(userList.get(i).getId())) { //같은방 인원한테만 보내기
	            	//방이동시 세션끊기?
	               room.sendMessage(msg);//클라이언트에 보내는메세지.
	            	}
	            else {//이전방 유저한테도 보내야되는데
	            	
	            }
	       }//안쪽 FOR문
         }///바깥 FOR
       }
  
        /* 방 수 0일 때 주석하기 
        if(session.getId() != null) {
            for(WebSocketSession client : clients.keySet()) {
               if(clients.get(client).equals(id)) {
                  clients.remove(client);
               }
            }
            }*/
        else {
  		  //같은방에있는사람에게만 메세지보내기
  		  String userId = message.getPayload().split(":")[1];
  		  List<BasketballDTO> chatId = bdao.chatting(userId);
  		  for(int i = 0 ; i < chatId.size(); i++) {
  			  System.out.println("쿼리로 뽑아낸 아이디 : "+chatId.get(i).getId());//BOK1//여기까지밖에안오네
  			  for(WebSocketSession client : clients.keySet()) {
  				  if(clients.get(client).equals(chatId.get(i).getId()) && !userId.equals(clients.get(client))){//같은방에있는 user에게만 message보낸다
  					  System.out.println("메세지 보낸 ID : "+userId+" 타이틀이 같은 ID : "+(chatId.get(i).getId()));
  					  client.sendMessage(message);
  					  System.out.println("서버에서 보낸 채팅 내용 : "+message);
  					  
  				  }
  			  }
  		  }
			/* return; */ 
  		  }
   }
    //클라이언트와 통신장애시 자동으로 호출되는 메소드]
   @Override
   public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
      System.out.println(session.getId()+"와 통신 장애 발생:"+exception.getMessage());
      
   }
   
   
}///////////////

   