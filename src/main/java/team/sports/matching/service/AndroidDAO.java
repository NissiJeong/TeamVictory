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

	public int insertmatch(Map map) {
		return template.insert("insertMatch", map);
	}

	public int inserToken(Map map) {
		return template.insert("insertToken", map);
	}
	//나에게 신청된 매칭 리스트 가져오기
	public List<MatchDTO> selectMatchList(Map map) {
		return template.selectList("selectMatchList", map);
	}
	//매칭 승인 후 
	public int updateMatchStatus22(Map map) {
		return template.update("updateMatchStatus22222", map);
	}
	//매칭 거절 후 
	public int updateMatchStatus33(Map map) {
		return template.update("updateMatchStatus333", map);
	}
	//매칭 승인 후 그 게임 정보 가져오기
	public Map selectGame2222(Map map) {
		return template.selectOne("selectGame2222",map);
	}
	
	public int insertGameSchedule222(Map gameMap) {
		return template.insert("insertGameSchedule22222",gameMap);
	}
	//게임 리스트 가져오기
	public List<GameDTO> selectGameList233(Map map) {
		return template.selectList("selectGameList2333", map);
	}
}
