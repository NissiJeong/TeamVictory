package team.sports.matching.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("admin")
public class AdminDAO {

	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//경기 완료된 게임스케줄 가져오는 메소드
	public int selectSchedule(Map map) {
		return template.selectOne("selectSchedule", map);
	}////

/** 기생 중  **/
	
	public List<Map> openInsertData(Map map) {
		return template.selectList("openInsertData", map);
	}

	public List<Map> insertParsingData(Map map) {
		return template.selectList("insertParsingData", map);
	}
	
	public List<Map> getMembersWithParsing(Map map) {
		return template.selectList("getMembersWithParsing", map);
	}
	public List<Map> getMembersWithParsingPITCHER(Map map) {
		return template.selectList("getMembersWithParsingPITCHER", map);
	}
	
	
	public int updateGameSchedule(Map map) {
		return template.update("updateScheduleWithParsing", map);
	}

	public int insertHitter(Map map) {
		return template.insert("insertHitterWithParsing", map);
		
	}
	public int insertPitcher(Map map) {
		return template.insert("insertPitcherWithParsing", map);
	}
	
	public List<Map> getScoreLogo(Map map) {
		return template.selectList("getScoreLogo", map);
	}
	
	public List<Map> getDetailInfo(Map map) {
		return template.selectList("getDetailInfo", map);
	}
	
	public List<Map> getSummary(Map map) {
		return template.selectList("getSummary", map);
	}
	public List<Map> getEachResult(Map map) {
		return template.selectList("getEachResult", map);
	
	}
	
	public List<Map> selectRating(Map map) {
      return template.selectList("selectRating", map);
   }
   public List<Map> selectCount(Map map) {
      return template.selectList("selectCount", map);
   }
   
   public List<Map> updateRating(Map map) {
      return template.selectList("updateRating", map);
   }
	
}
