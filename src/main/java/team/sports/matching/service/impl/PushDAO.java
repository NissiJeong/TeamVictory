package team.sports.matching.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;



@Repository("push")
public class PushDAO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public String selectId(String teamname) {
		return template.selectOne("selectId", teamname);
	}
	
	public String selectTeam(String id) {
		return template.selectOne("pushSelectTeam", id);
	}
}
