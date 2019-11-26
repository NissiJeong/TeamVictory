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

	// 배팅시 포인트 차감 
	public int pointMinus(Map<String, Object> map) {
		
		return template.update("bettingPointMinus",map);
	}

	//배팅테이블에 정보 입력 
	public int bettingInsert(Map<String, Object> map) {
		return template.insert("bettingInsert",map);
	}
	 
	//내가 배팅한
	public  List<Map> selectMyBettingList(Map map){
		return template.selectList("MyBettingList",map);
	}

	public Map bettingSelectOne(Map map) {
		  
		return  template.selectOne("bettingSelectOne", map);
	}

	public List<Map> bettingInfo(Map<String, Object> map) {
		
		return template.selectList("bettingInfoSelectList", map);
	}

	public List<Map> myBettingListChk(String id) {
		
		return template.selectList("myBettingListChk",id);
	}

	//배팅카운트 일정시간마다 표시하는 메서드 
	public List<Map> countLongPolling( List<Map> mapperList) {
		
		return  template.selectList("countLongPolling", mapperList);
	}

	// 상세보기 상대전적
	public List<Map> opponentRecordList(Map map) {
		
		return template.selectList("opponentRecordList",map);
	}


	/*
	public List<Map<String, Object>> dividendUpdate(Map<String, Object> map) {
		
		return template.selectList("dividendUpdate", map);
	}
*/	

}
