package team.sports.matching;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.RequestWrapper;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;
import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import team.sports.matching.service.BasketballDAO;
import team.sports.matching.service.BasketballDTO;

@Controller
public class BasketballMatchingHandler extends TextWebSocketHandler{
		
	@Resource(name = "basketball")
	
	private BasketballDAO bdao;
	
	private Map<WebSocketSession, String> clients = new ConcurrentHashMap<WebSocketSession, String>();
		
				
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		clients.put(session, session.getId());//들어온 세션 저장
		
		//방 목록 JSON으로 뿌려주기
		Map<String, Object> map = new HashMap<String, Object>();
		   
		java.util.List<BasketballDTO> list = bdao.roomList(map);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String roomList = mapper.writeValueAsString(list);
				
		TextMessage msg2 = new TextMessage(roomList);
		
		for(WebSocketSession room : clients.keySet()) {
		
		room.sendMessage(msg2);
			
			
		}
		
	}
	
	//클라이언트와 연결이 끊었졌을때 호출되는 콜백 메소드]
	//-컬렉션에 저장된 클라이언트 삭제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//System.out.println(session.getId()+"연결이 끊어젔어요");	
		clients.remove(session);//세션지우기
		
			}
	
	//클라이언트로 부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
	//클라이언트로부터 전송되는 모든 메시지 처리
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		  System.out.println(session.getId()+"로부터 받은 메시지:"+message.getPayload());
		  		  
		  //clients.remove(session);
		  
		  Map connection = new HashMap(); //title = 시작인덱스 5
		  
		  int startIndex = message.getPayload().indexOf("=");
		  String title="";
		  String id ="";
		  int affected=0;
		  int delete=0;
		  int remainCountInc=0;
		  int remainCountDec=0;
		  
		  //jsp에서 받은 title로 SELECT해서 리턴시켜주면 될거같은데..
		  if(message.getPayload().contains("=")) {
		  title = message.getPayload().substring(5,startIndex); 
		  id = message.getPayload().substring(startIndex+1);
		  
		  connection.put("id", id);
		  connection.put("title", title);
		  
		  
		  int count = Integer.parseInt(bdao.limitRoom(connection)); //3
		 
		  System.out.println("접속한 아이디 : "+id);
		  System.out.println("접속한 방 : "+title);
		  
		  if(count == 3) {
			  
			  clients.remove(session);
			  
			  return ;
		  }
		  
		  
		  for(WebSocketSession client : clients.keySet()) {
			  if(clients.get(client).equals(id)) {
				  clients.remove(client);
			  }
		  }
		  
		  //기존있던방에서 새로운방 생성시 Exception발생. selectOne이기때문에tlqfktlqkftlqkflaklfks
		  List<BasketballDTO> existRoom = bdao.selectTitle(connection);
		  for(int i = 0 ; i < existRoom.size(); i++) {
			  System.out.println(existRoom);
			  System.out.println("있던 방 : "+existRoom.get(i).getTitle()==title);
			  System.out.println("새로 들어간 방 : "+title);
			 if(existRoom.get(i).getTitle() != title) {
				 remainCountDec = bdao.remainCountDec(existRoom.get(i).getTitle());
				 remainCountInc = bdao.remainCountInc(connection);//옮긴방에 Count+1
			 }
		  }
		  //System.out.println("새로 들어간 방 : "+title);
		  //System.out.println("있던 방 : "+existRoom);
		  //System.out.println(connection.get("title"));
		  //처음접속시엔 타이틀이 insert되기 전..
		  //affected = bdao.chatMember(connection);// 후 INSERT
		  /*
		  if(existRoom != title ) {
			  
			  remainCountDec = bdao.remainCountDec(existRoom);
			  remainCountInc = bdao.remainCountInc(connection);
			  System.out.println("remainCountDec : "+remainCountDec);
			  //현재있는방 remainCount - 1
			  //들어온방 remainCount + 1
			  //처음 방에 접속시에는 existRoom이 null이니까 remainCountInc가 성립안됨?
		  }
		  else if(existRoom.equals(null)){
			  remainCountInc = bdao.remainCountInc(connection);
		  }
		  else if(existRoom == title) {
			  remainCountInc = bdao.remainCountInc(connection);
		  }
		  	  bdao.removeRoom();
		  */
		  //같은방에 같은 id접속 방지용
		  delete = bdao.deleteChat(connection);// 접속하면 DELETE	  
		  affected = bdao.chatMember(connection);// 후 INSERT
		  
		  System.out.println("remainCountInc : "+remainCountInc);
		  
		  clients.put(session, id);
		  
		  //같은방에 있을 때 접속자목록 뿌리기
		  
			
		  List<BasketballDTO> userList = bdao.joinMember(title);//SELECT id FROM chatmember WHERE title=#{title}
		  
		  ObjectMapper mapper = new ObjectMapper();
		  String roomList = mapper.writeValueAsString(userList);
		  TextMessage msg2 = new TextMessage(roomList);
		  for(WebSocketSession room : clients.keySet()) {
		  		System.out.println("첫번째 session : "+room.getId());//같은세션한테만 보내네
				//if(clients.get(room).equals(userList.get(i).getId())) { //이거왜안되냐?
					room.sendMessage(msg2);//클라이언트에 보내는메세지.
				//}
			}
		  
			/*
			 * for(int i = 0 ; i < userList.size(); i++) {//같은방에있는 유저 수만큼
			 * System.out.println(title+"에 있는 유저 : "+userList.get(i).getId());//같은방에있는 유저목록
			 * TextMessage msg = new TextMessage("List:"+userList.get(i).getId());//같은방에있는
			 * 유저목록을 msg에 저장 for(WebSocketSession room : clients.keySet()) {
			 * System.out.println("첫번째 session : "+room.getId());//같은세션한테만 보내네
			 * //if(clients.get(room).equals(userList.get(i).getId())) { //이거왜안되냐?
			 * room.sendMessage(msg);//클라이언트에 보내는메세지. //} } }
			 */
		  }
		  else {
		  //같은방에있는사람에게만 메세지보내기
		  String userId = message.getPayload().split(":")[1];
		  List<BasketballDTO> chatId = bdao.chatting(userId);
		  for(int i = 0 ; i < chatId.size(); i++) {
			  System.out.println("쿼리로 뽑아낸 아이디 : "+chatId.get(i).getId());//BOK1
			  for(WebSocketSession client : clients.keySet()) {
				  System.out.println("두번째 session : "+client.getId());
				  if(clients.get(client).equals(chatId.get(i).getId()) && !userId.equals(clients.get(client))){//같은방에있는 user에게만 message보낸다
					  System.out.println("메세지 보낸 ID : "+userId+" 타이틀이 같은 ID : "+(chatId.get(i).getId()));
					  client.sendMessage(message);
				  }
				 
			  }
		  }
		  }
		  
		
	}
	 //클라이언트와 통신장애시 자동으로 호출되는 메소드]
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId()+"와 통신 장애 발생:"+exception.getMessage());
	}
	
	
}///////////////

	
