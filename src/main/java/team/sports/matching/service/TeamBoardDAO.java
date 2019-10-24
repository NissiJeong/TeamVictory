package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("teamboard")
public class TeamBoardDAO {
	// 데이터소스 주입
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public List<TeamBoardDTO> selectList(Map map) {
		return template.selectList("TeamBoardList", map);
	}
	
	public List<TeamBoardDTO> pitcherList(Map map) { 
		return template.selectList("PitcherList", map); 
	}
	
}
