package team.sports.matching.service;

import java.util.List;
import java.util.Map;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("basketball")

public class BasketballDAO {
	
	@Resource(name="template")
	
	private SqlSessionTemplate template;
	
	public int createRoom(Map map) {
		
		return template.insert("createRoom",map);
		
	}///////createRoom
	
	public int titleDuplicate(Map map) {
		
		return template.selectOne("titleDuplication",map);
	}
	
	public List<BasketballDTO> roomList(Map map) {
		
		return template.selectList("roomList",map);
		
	}/////////listRoom
	
	public int chatMember(Map map) {
		
		return template.insert("chatMember",map);		
	}
	
	public List<BasketballDTO> selectChatmember(Map map) {
		
		return template.selectList("titleSelect", map);
		
	}
	
	public String limitRoom(Map map) {
		
		return template.selectOne("limitRoom",map); 
	}
	
	public String existUser(Map map) {
		
		return template.selectOne("existUser",map);
		
	}
	
	public int deleteChat(Map map) {
		
		return template.delete("deleteChat", map);
	}
	
	public List<BasketballDTO> joinMember(String title){
		
		return template.selectList("joinMember",title);
	}
	
	public List<BasketballDTO> chatting(String userId){
		
		return template.selectList("chatting",userId);
	}
	
	public int remainCountInc(Map map) {
		
		return template.update("remainCountInc",map);
		
	}
	
	public int remainCountDec(String id) {
		
		return template.update("remainCountDec", id);
		
	}
	
	public int removeRoom() {
		
		return template.delete("removeRoom");
	}
	
	public List<BasketballDTO> selectTitle(Map map){
		
		return template.selectList("selectTitle",map);
	}
	
}


