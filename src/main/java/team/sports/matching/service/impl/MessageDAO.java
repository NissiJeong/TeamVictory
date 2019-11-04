package team.sports.matching.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import team.sports.matching.service.MessageDTO;



@Service("messageDAO")
public class MessageDAO {
	
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;
	MessageDAO messageDao;
	
	public int create(MessageDTO dto) {
		return template.insert("create", dto);
	}
	
	public MessageDTO readMessage(String userid, int id) {
		
		return null;
	}
	
	public void addMessage(MessageDTO dto) {
		
	}
	
	
	
	
	
		

}
