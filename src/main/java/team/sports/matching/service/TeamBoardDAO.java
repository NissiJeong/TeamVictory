package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import team.sports.printdb.baseball.HitterDTO;
import team.sports.printdb.baseball.PitcherDTO;

@Repository("teamboard")
public class TeamBoardDAO {
	// 데이터소스 주입
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//선수목록
	public List<TeamBoardDTO> selectList(Map map) {
		return template.selectList("TeamBoardList", map);
	}
	
	//팀원 구하기
	public List<Map> memberSelect(){
		return template.selectList("memberSelect"); 
	}
	
	//최다득점 TOP3
	public List<TeamBoardDTO> bestrbiPlayer(Map map) { 
		return template.selectList("BestrbiPlayer", map); 
	}
	
	//최다삼진 TOP3
	public List<TeamBoardDTO> bestsoPlayer(Map map) { 
		return template.selectList("BestsoPlayer", map); 
	}
	
	//최다홈런 TOP3
	public List<TeamBoardDTO> besthrPlayer(Map map) { 
		return template.selectList("BesthrPlayer", map); 
	}

	//최다도루 TOP3
	public List<TeamBoardDTO> bestsbPlayer(Map map) { 
		return template.selectList("BestsbPlayer", map); 
	}
	//팀목록
	public List<Map> teamselectList(Map map) { 
		return template.selectList("TeamSearchList", map); 
	}
	
	//팀목록
	public List<TeamBoardDTO> teamNameSearch(Map map) { 
		return template.selectList("TeamNameSearch", map); 
	}
	
	//경기일정
	public List<TeamBoardDTO> gameSchedule(Map map){
		return template.selectList("GameSchedule", map);
	}
	
	//팀소개
	public List<TeamBoardDTO> teamInfo(Map map) {
		return template.selectList("TeamSelf", map);
	}

	//투수랭킹
	public List<PitcherDTO> pitcherRank(Map map) {
		return template.selectList("PitcherRank", map);
	}
	//타자랭킹
	public List<HitterDTO> hitterRank(Map map) {
		return template.selectList("HitterRank", map);
	}

	//팀기네스 - 최다득점
	public List<TeamBoardDTO> teamGuinnessScore(Map map) {
		return template.selectList("TeamGuinnessScore",map);
	}

	public List<TeamBoardDTO> teamGuinnessHomeRun(Map map) {
		return template.selectList("TeamGuinnessHomRun",map);
	}

	public List<TeamBoardDTO> teamGuinnessHit(Map map) {
		return template.selectList("TeamGuinnessHit",map);
	}

	public List<TeamBoardDTO> teamGuinnessStrikeOut(Map map) {
		return template.selectList("TeamGuinnessStrikeOut",map);
	}
}
