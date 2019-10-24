package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("Betting")
public class BettingDAO {
	
	// 데이터소스 주입
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public  List<BettingDTO> selectList(Map map){
		return template.selectList("bettingList",map);
	}
	
	public  List<Map> selectListTeamInfo(Map map){
		return template.selectList("selectListTeamInfo",map);
	}
	

}
