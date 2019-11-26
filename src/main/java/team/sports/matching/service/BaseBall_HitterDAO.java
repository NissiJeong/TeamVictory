package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import team.sports.printdb.baseball.BaseBall_HitterDTO;

@Repository("BaseBall_Hitter")
public class BaseBall_HitterDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public int insert(Map map) {
		return template.insert("hitterInsert",map);
	}///isLogin
	
	public int insertByPars(Map map) {
		return template.insert("hitterInsertByPars",map);
	}
	
	public BaseBall_HitterDTO hitterSelectOne(Map map) {
		return template.selectOne("hitterSelectOne", map);
	}
	
	public List<Map> hitterSelectList(Map map) {
		return template.selectList("hitterSelectList", map);
	}
	
	public List<Map> hitterTotalSelectList(Map map) {
		return template.selectList("hitterTotalSelectList", map);
	}
	
	public List<Map> scrollDown(Map map) {
		return template.selectList("infiniteScrollDown", map);
	}
	
	public List<Map> scrollDownForPitcher(Map map) {
		return template.selectList("downForPitcher", map);
	}
	
	
	public List<Map> hitterDetailView(Map map) {
		return template.selectList("hitterDetailView", map);
	}
	public List<Map> pitcherDetailView(Map map) {
		return template.selectList("pitcherDetailView", map);
	}
	
	public List<Map> hitterDetailViewEachTeam(Map map) {
		return template.selectList("hitterDetailViewEachTeam", map);
	}
	public List<Map> pitcherDetailViewEachTeam(Map map) {
		return template.selectList("pitcherDetailViewEachTeam", map);
	}
	
	public List<Map> hitterDetailViewForTeamName(Map map) {
		return template.selectList("hitterDetailViewForTeamName", map);
	}
	public List<Map> pitcherDetailViewForTeamName(Map map) {
		return template.selectList("pitcherDetailViewForTeamName", map);
	}
	//카운트
	public List<Map> hitterCount(Map map) {
		return template.selectList("hitterCount", map);
	}
	public List<Map> hitterCountTeam(Map map) {
		return template.selectList("hitterCountTeam", map);
	}
	public List<Map> pitcherCount(Map map) {
		return template.selectList("pitcherCount", map);
	}
	public List<Map> pitcherCountTeam(Map map) {
		return template.selectList("pitcherCountTeam", map);
	}
	
	
	
	
	
	////////////////////////////////   멤버 정보 변경용         /////////////////////////////
	
	public int profileChange(Map map) {
		return template.update("profileChange",map);
	}
	public int playerChange(Map map) {
		return template.update("playerChange",map);
	}
	
	public List<Map> getProfile(Map map) {
		return template.selectList("getProfile", map);
	}

	public List<Map> memberInfo(Map map) {
		return template.selectList("memberInfo", map);
	}
	public List<Map> playerInfo(Map map) {
		return template.selectList("playerInfo", map);
	}
	public List<Map> getMileage(Map map) {
		return template.selectList("getMileage", map);
	}
	public List<Map> bettingInfo(Map map) {
		return template.selectList("bettingInfo", map);
	}
	public List<Map> bettingInfo2(Map map) {
		return template.selectList("bettingInfo2", map);
	}
	public List<Map> getCount(Map map) {
		return template.selectList("getCount", map);
	}
	public List<Map> getRate(Map map) {
		return template.selectList("getRate", map);
	}
	
	
	
	////////////////////////////////chart.js 컨트롤용         /////////////////////////////
	public List<Map> getMyHit(Map map) {
		return template.selectList("getMyHit", map);
	}
	public List<Map> getAllHit(Map map) {
		return template.selectList("getAllHit", map);
	}
	public List<Map> getHitSigma(Map map) {
		return template.selectList("getHitSigma", map);
	}
	public List<Map> getMyHitForTeam(Map map) {
		return template.selectList("getMyHitForTeam", map);
	}
	
	
	
	public List<Map> getMyPit(Map map) {
		return template.selectList("getMyPit", map);
	}
	public List<Map> getAllPit(Map map) {
		return template.selectList("getAllPit", map);
	}
	public List<Map> getPitSigma(Map map) {
		return template.selectList("getPitSigma", map);
	}
	public List<Map> getMyPitForTeam(Map map) {
		return template.selectList("getMyPitForTeam", map);
	}
	
	
	
	
	

	
	
	
}/////class




