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
}


