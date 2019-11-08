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
	
	public List<BasketballDTO> listRoom(Map map) {
		
		return template.selectList("roomList",map);
		
	}/////////listRoom
	
	public int chatMember(Map map) {
		
		return template.insert("chatMember",map);		
	}
	
	public List<BasketballDTO> selectTitle(Map map) {
		
		return template.selectList("titleSelect", map);
		
	}
	
	public String limitRoom(Map map) {
		
		return template.selectOne("limitRoom",map); 
	}
	
	public String dontEnter(Map map) {
		
		return template.selectOne("dontEnter",map);
		
	}
	
	public int checkId(Map map) {
		
		return template.selectOne("checkId",map);
	}
	
	public int deleteChat(Map map) {
		
		return template.delete("deleteChat", map);
	}
	
}


