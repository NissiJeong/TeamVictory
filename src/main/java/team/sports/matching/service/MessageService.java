package team.sports.matching.service;

import java.util.List;
import java.util.Map;

public interface MessageService {
	//로그인 용]
	boolean isLogin(Map map);	
	MessageDTO readMessage(String userid, int id);
	void addMessage(MessageDTO dto);
	
}
