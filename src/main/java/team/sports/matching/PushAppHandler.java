package team.sports.matching;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import team.sports.matching.service.impl.PushDAO;

public class PushAppHandler extends TextWebSocketHandler {
	
	private Map<WebSocketSession,String> clients =new HashMap<WebSocketSession, String>();
	
	@Resource(name="push")
	private PushDAO dao;
	String id;
	String teamname;
	String date;
	String time;
	String stadium;
	String pushId;
	String myTeam;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//System.out.println("asdasd");
		System.out.println(session.getId()+"연결");
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+"연결이 끊어젔어요");	
		
				clients.remove(session);
			
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		if(message.getPayload().indexOf("id")!=-1) {
			id = message.getPayload().substring(3, message.getPayloadLength());
			//System.out.println(id);
			clients.put(session, id);
			myTeam = dao.selectTeam(id);
		}
		else {
			String[] gameInfo = message.getPayload().split(",");
			teamname = gameInfo[0].split(":")[1];
			date = gameInfo[1].split(":")[1].split("-")[0]+"년 "+gameInfo[1].split(":")[1].split("-")[1]+"월 "+gameInfo[1].split(":")[1].split("-")[2]+"일";
			//date = gameInfo[1].split(":")[1];
			time = gameInfo[2].split(":")[1];
			stadium = gameInfo[3].split(":")[1];
			//System.out.println(teamname+date+time+stadium);	
			pushId = dao.selectId(teamname);
		}
		
		//System.out.println(myTeam+"팀이"+pushId+"에게 매칭을 신청했습니다");
		for(WebSocketSession client:clients.keySet()) {
			if(clients.get(client).equals(pushId)) {
				System.out.println("아이디!!!:"+clients.get(client).toString());
				TextMessage pushMessage = new TextMessage(myTeam+"팀이 "+date+" "+time+"시 매칭을 신청하였습니다 \r\n"+stadium+" 경기장");
				client.sendMessage(pushMessage);
				System.out.println(myTeam+"팀이 "+date+" "+time+"시 매칭을 신청하였습니다 \r\n경기장 "+stadium);
			}
		}
		//clients.put(, value)
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId()+"와 통신 장애 발생:"+exception.getMessage());
	}
}
