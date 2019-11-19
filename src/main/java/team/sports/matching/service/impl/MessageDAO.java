package team.sports.matching.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import team.sports.matching.service.BoardDTO;
import team.sports.matching.service.MessageDTO;



@Repository("messageDAO")
public class MessageDAO {
	
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;
	MessageDAO messageDao;
	
	//입력용]
	public int insert(Map map) {
		
		return template.insert("messageInsert", map);
	}

	
	
	//전체 목록용]
	public List<MessageDTO> selectList(Map map) {		
		return template.selectList("messageSelectList",map);
	}
	
	public int getTotalRecord(Map map) {		
		return template.selectOne("messageTotal",map);
	}//////////
	
	public MessageDTO selectOne(Map map) {		
		return template.selectOne("messageSelectOne", map);
	}
		
	public int delete(Map map) {	
		return template.delete("messageDelete",map);
	}
	
}
