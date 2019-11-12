



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
	public List<Map> hitterDetailView(Map map) {
		return template.selectList("hitterDetailView", map);
	}
	public List<Map> hitterDetailViewEachTeam(Map map) {
		return template.selectList("hitterDetailViewEachTeam", map);
	}
	public List<Map> hitterDetailViewForTeamName(Map map) {
		return template.selectList("hitterDetailViewForTeamName", map);
	}
	
	
	
	////////////////////////////////   멤버 정보 변경용         /////////////////////////////
	public int profileChange(Map map) {
		return template.update("profileChange",map);
	}
	
	public List<Map> getProfile(Map map) {
		return template.selectList("getProfile", map);
	}
	
	
	
}/////class




