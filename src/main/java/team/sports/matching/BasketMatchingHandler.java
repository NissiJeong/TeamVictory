package team.sports.matching;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class BasketMatchingHandler extends TextWebSocketHandler{
	@Resource(name = "basketball")
	private BasketballDAO dao;
	 
	public Map<WebSocketSession, String> clients = new ConcurrentHashMap<WebSocketSession, String>(); 
	 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		clients.put(session, session.getId());//들어온 세션 저장
		
		System.out.println("BasketballMatching에 접속한 Clients 수 : "+clients.size());
		
		System.out.println(session.getId()+"접속");
		
	      
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		System.out.println(session.getId()+"연결이 끊어졌다 임마");   
		   
		clients.remove(session);//세션지우기
	     
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("클라이언트가 보낸 메세지"+message.getPayload());
		
		if(message.getPayload().contains(":")) {
			
		String hostId = message.getPayload().split(":")[1];
			
		System.out.println("hostId : "+hostId);
			
		clients.put(session, hostId);//session에 id 저장
			
		List<BasketballDTO> chatId = dao.matchUp(hostId);
		
		ObjectMapper mapper = new ObjectMapper();
        
        String roomList = mapper.writeValueAsString(chatId);
        
        TextMessage msg = new TextMessage("user"+roomList);
        
        System.out.println("클릭한 방에 접속중인 유저목록:"+roomList);
        
        
		for(int i = 0 ; i < chatId.size(); i++) {
			  System.out.println("쿼리로 뽑아낸 아이디 : "+chatId.get(i).getId());//BOK1//여기까지밖에안오네
			  for(WebSocketSession client : clients.keySet()) {
				  if(clients.get(client).equals(chatId.get(i).getId())){//같은방에있는 user에게만 message보낸다
  					  System.out.println("메세지 보낸 ID : "+hostId+" 타이틀이 같은 ID : "+(chatId.get(i).getId()));
  					  client.sendMessage(msg);
  					  
  				  }		
					  
				  }
			  }
		
		  Map<String, Object> map = new HashMap<String, Object>();
	       
		  map.put("id", hostId);
		  
	      java.util.List<BasketballDTO> list = dao.waitPlay(map);
	      
	      ObjectMapper mapper1 = new ObjectMapper();
	      
	      String waitList = mapper1.writeValueAsString(list);
	      
	      System.out.println(waitList);
	      //String newJson = "{\"start\":"+roomList+"}";
	      TextMessage msg2 = new TextMessage("start"+waitList);
	      
	      System.out.println(waitList);
	     
	      for(WebSocketSession room : clients.keySet()) {
	    	  
	    	  if(room.getId() == session.getId()) {
	    		  
	    	  room.sendMessage(msg2);
	    	  
	    	  }
	      }
		}
		else if(message.getPayload().contains("!")) {////매치 신청했을때
	    	String title = message.getPayload().split("!")[1];
	    	String request = message.getPayload().split("!")[2];
	    	String place = message.getPayload().split("!")[3];
	    	String time = message.getPayload().split("!")[4];
	    	TextMessage notice = new TextMessage("play@"+request+"@"+place+"@"+time);
	    	System.out.println("신청한사람 : "+request);
	    	System.out.println("클릭한 title : "+title);
	    	System.out.println("신청 장소 : "+place);
	    	System.out.println("신청 시간 : "+time);
	    	List<BasketballDTO> competitor = dao.joinMember(title);
	    	for(int i = 0 ; i < competitor.size() ; i++) {
	    		System.out.println("클릭한 방에 접속중인 유저 : "+competitor.get(i).getId());
	    		for(WebSocketSession competitors : clients.keySet()) {
	    			if(clients.get(competitors).equals(competitor.get(i).getId())) {
	    				competitors.sendMessage(notice);
	    				System.out.println("보낸 메세지 : "+notice);
	    			}
	    		}
	    	}
	      }
		else if(message.getPayload().contains("$")) {
			
			System.out.println("여기까지오냐?");
			
			int end = message.getPayload().indexOf("$");
			String hostId = message.getPayload().substring(end+1);
			
			System.out.println("신청승인받은 아이디 : "+hostId);
			
			List<BasketballDTO> chatId = dao.matchUp(hostId);
			
			ObjectMapper mapper = new ObjectMapper();
	        
	        String roomList = mapper.writeValueAsString(chatId);
	        
	        TextMessage msg = new TextMessage("yes-수락하였습니다");
	        
	        System.out.println("클릭한 방에 접속중인 유저목록:"+roomList);
	        
			for(int i = 0 ; i < chatId.size(); i++) {
				  System.out.println("쿼리로 뽑아낸 아이디 : "+chatId.get(i).getId());//BOK1//여기까지밖에안오네
				  for(WebSocketSession client : clients.keySet()) {
					  if(clients.get(client).equals(chatId.get(i).getId())){//같은방에있는 user에게만 message보낸다
	  					  System.out.println("메세지 보낸 ID : "+hostId+" 타이틀이 같은 ID : "+(chatId.get(i).getId()));
	  					  client.sendMessage(msg);
	  					  
	  				  }		
						  
					  }
			}
		}
		else if(message.getPayload().contains("^")) {
			
			int end = message.getPayload().indexOf("^");
			String hostId = message.getPayload().substring(end+1);
			System.out.println("거절당한 아이디 : "+hostId);
			
			
			List<BasketballDTO> chatId = dao.matchUp(hostId);
			
			ObjectMapper mapper = new ObjectMapper();
	        
	        String roomList = mapper.writeValueAsString(chatId);
	        
	        TextMessage msg = new TextMessage("no*거절하였습니다!");
	        
	        System.out.println("클릭한 방에 접속중인 유저목록:"+roomList);
	        
			for(int i = 0 ; i < chatId.size(); i++) {
				  System.out.println("쿼리로 뽑아낸 아이디 : "+chatId.get(i).getId());//BOK1//여기까지밖에안오네
				  for(WebSocketSession client : clients.keySet()) {
					  if(clients.get(client).equals(chatId.get(i).getId())){//같은방에있는 user에게만 message보낸다
	  					  System.out.println("메세지 보낸 ID : "+hostId+" 타이틀이 같은 ID : "+(chatId.get(i).getId()));
	  					  client.sendMessage(msg);
	  					  
	  				  }		
						  
					  }
			}
		}
	
	}
		
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		
		
	}

	

	
	
	
}
