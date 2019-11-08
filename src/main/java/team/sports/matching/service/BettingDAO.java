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
	
	
	//게임스케줄 배팅 리스트 가져오기
	public  List<BettingDTO> selectList(Map map){
		return template.selectList("bettingList",map);
	}
	
	// 홈팀 어웨이팀 최근 10경기 가져오기 
	public  List<Map> selectListTeamInfo(Map map){
		return template.selectList("selectListTeamInfo",map);
	}
	
	// 배팅 버튼 클릭시  회원의 보유한 마일리지 가져오기 
	public MemberDTO memberPoint(Map map) {
		return template.selectOne("memberPoint",map);
	}
	
	

}
