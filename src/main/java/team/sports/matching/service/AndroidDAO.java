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

	public int profileupdate(Map map) {
		return template.update("updatePfrofile222",map);
	}

	public String selectProfile(Map map) {
		return template.selectOne("selectProfile222", map);
	}
	//이름, 생년월일, 연락처
	public String selectMyInfo222(Map map) {
		String name = template.selectOne("selectName222",map);
		String birth = template.selectOne("selectBirth222", map);
		String contact = template.selectOne("selectContact222", map);
		return name+":"+birth+":"+contact;
	}

	public String selectRecord222(Map map) {
		String tasu = template.selectOne("tasu222",map);
		String tasu2 = tasu==null?"0":tasu;
		String anta = template.selectOne("anta222",map);
		String anta2 = anta==null?"0":anta;
		String tajeom = template.selectOne("tajeom222",map);
		String tajeom2 = tajeom==null?"0":tajeom;
		String ballnet = template.selectOne("ballnet222",map);
		String ballnet2 = ballnet==null?"0":ballnet;
		String tayoul = template.selectOne("tayoul222",map);
		String tayoul2 = tayoul==null?"0":tayoul;
		return tasu2+"타수 "+anta2+"안타 "+tajeom2+"타점 "+ballnet2+"볼넷 "+tayoul2;
	}

	public String select1Record222(Map map) {
		String tasu = template.selectOne("tasu333",map);
		String tasu2 = tasu==null?"0":tasu;
		String anta = template.selectOne("anta333",map);
		String anta2 = anta==null?"0":anta;
		String tajeom = template.selectOne("tajeom333",map);
		String tajeom2 = tajeom==null?"0":tajeom;
		String ballnet = template.selectOne("ballnet333",map);
		String ballnet2 = ballnet==null?"0":ballnet;
		return tasu2+"타수 "+anta2+"안타 "+tajeom2+"타점 "+ballnet2+"볼넷 ";
	}
	//내팀 최근 5경기 기록
	public List<Map> selectMyTeamGameList(Map map) {
		return template.selectList("selectMyTeamGameList222", map);
	}
	//내 팀 기록
	public Map selectMyTeamInfo(Map map) {
		return template.selectOne("selectRegidate222",map);
	}
	//팀원 수 구하기
	public String selectMember(Map map) {
		return template.selectOne("selectMember2222", map);
	}
	//최근 1경기 예측 이력
	public Map selectLastPredic(Map map) {
		return template.selectOne("selectLastPredic222", map);
	}
	//내가 배팅한 경기의 배당률 구하기 위한 쿼리
	public List<Map> selectBettings222(Map map) {
		return template.selectList("selectBettings2222", map);
	}
	//게임 상태 waiting인 것 가져오기
	public List<FinishGameDTO> selectWaitingList(Map map) {
		return template.selectList("selectWaitingGame2222", map);
	}
	//게임 상태 inwaiting으로 업데이트
	public int updateInwating222(Map map) {
		return template.update("updateInwating22222", map);
	}
	//팀원들 마일리지 올리기
	public int updateTeamMemberMileage(Map map) {
		return template.update("updateMileage3333",map);
	}
	//상대방이 게임 종료한 것 가져오기
	public List<FinishGameDTO> selectInWaitingList(Map map) {
		return template.selectList("selectInWaitingGame2222", map);
	}
	//게임 마지막 finish
	public int updateFinish222(Map map) {
		return template.update("updateFinish2222", map);
	}
	//내가 finish버튼 누른 팀의 팀 이름 가져오기
	public Map selectGameSchedule222222(Map map) {
		return template.selectOne("selectGameSchedule2222", map);
	}
	//홈팀의 게임 정보 가져오기 - 레이팅
	public List<Map> selectHomeGameShcedule(Map recentGame) {
		return template.selectList("selectHomeGameSchedule2222", recentGame);
	}
	//어웨이 팀의 게임 정보 가져오기 - 레이팅
	public List<Map> selectAwayGameShcedule(Map recentGame) {
		return template.selectList("selectAwayGameList2222", recentGame);
	}
	//경기 종료 후 홈팀의 레이팅 점수 변경
	public int updateHomeRating(Map recentGame) {
		return template.update("updateHomeRating2222", recentGame);
	}
	//경기 종료 후 어웨이 팀의 레이팅 점수 변경
	public int updateAwayRating(Map recentGame) {
		return template.update("updateAwayRaing2222", recentGame);
	}
	//경기 종료 버튼 누른 경기에 배팅한 사람들과 그 정보 가져오기
	public List<Map> selectBettings3333(Map recentGame) {
		return template.selectList("selectBettings22222222", recentGame);
	}
	//경기 종료 버튼 누른 후 그 경기에 배팅한 사람들의 마일리지 변경해주기
	public int updatePoint22(Map resultMap) {
		return template.update("updatePoint2222", resultMap);
	}
}
