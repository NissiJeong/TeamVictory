package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class TeamBoardDAO {
	// 데이터소스 주입
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	public List<TeamBoardDTO> selectList(Map map){
		return template.selectList("TeamBoardList",map);
	}
}
