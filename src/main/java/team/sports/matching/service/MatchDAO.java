package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("match")
public class MatchDAO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//매칭페이지 글 뿌려주기
	public List<BaseTeamDTO> selectList(Map map) {
		return template.selectList("teamSelectList", map);
	}
	//팀에 속하지 않은 사용자에게 매칭 글을 보여주기 위한 메소드
	public int selectTeam(Map map) {
		return template.selectOne("selectTeam2", map);
	}
	//매치 신청
	public int insert(Map map) {
		return template.insert("matchInsert",map);
	}
	
	public BaseTeamDTO selectOne(Map map) {
		return template.selectOne("oneSelect", map);
	}
	///스케줄에서 최근 5경기 가져오기
	public List<Map> selectGamefive(Map map){
		System.out.println("teamName: "+map.get("teamName2").toString());
		return template.selectList("selectGamefive",map);
	}
	///해당 팀의 같은 날짜 시간에 경기가 잡혀 있는지 확인
	public int checkDateTime(Map map) {
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		return template.selectOne("checkDateTime", map);
	}
	//해당 경기장의 같은 시간 같은 날짜에 경기가 잡혀있는지 확인 
	public int checkDateTimeStadium(Map map) {
		return template.selectOne("checkDateTimeStadium", map);
	}//
	//로그인한 아이디가 팀장인지 아닌지 확인하는 메소드
	public int selectManagerId(Map map) {
		return template.selectOne("checkManager",map);
	}
}
