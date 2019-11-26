package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("android")
public class AndroidDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	public List<TeamDTO> selectTeam(Map map) {
		return template.selectList("andSelectTeams", map);
	}
}
