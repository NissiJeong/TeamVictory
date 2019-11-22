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

	public List<AndBettingDTO> selectBetting22(Map map) {
		return template.selectList("selectBettingList222", map);
	}

	public List<FinishGameDTO> selectFinish222(Map map) {
		return template.selectList("selectFinishList222", map);
	}
	//내 마일리지 가져오기
	public int selectMyMileage(Map map) {
		return template.selectOne("selectMyMileage222", map);
	}
	//홈팀 5경기 정보 가져오기
	public List<Map> selectHomeList(Map map) {
		return template.selectList("selectHomeList222", map);
	}

	public List<Map> selectAwayList(Map map) {
		return template.selectList("selectAwayList222", map);
	}
	//홈팀 rating
	public int selectHomeRating(Map map) {
		return template.selectOne("selectHomeRating222",map);
	}
	//어웨이 팀 rating
	public int selectAwayRating(Map map) {
		return template.selectOne("selectAwayRating222",map);
	}
	//배팅버튼 클릭시 
	public int insertBetting(Map map) {
		int i = template.insert("insertBetting2222", map);
		int k = template.update("updateMyMileage222222",map);
		return i+k;
	}
	//해당 날짜에 내가 배팅한 기록이 있는지
	public Map selectBettingMyId(Map map) {
		return template.selectOne("selectBettingMyId", map);
	}
	
}
