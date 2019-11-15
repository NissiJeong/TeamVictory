package team.sports.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("member")
public class MemberDAO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//로그인
	public boolean isLogin(Map map) {
		
		return (Integer)template.selectOne("memberIsLogin",map)==0?false:true;
	}///isLogin
	
	//회원가입
	public int memberRegi(Map map) {
		
		return template.insert("memberRegi", map);
		
	}///memberRegi
	//회원 가입 후 auth_security테이블에 사용자 권한 추가
	public int regiAuth(Map map) {
		return template.insert("regiAuth", map);
	}
	//회원가입후 auth_sequrity에 등록 안됐을 경우 member에 등록된 행 제거
	public int deleteMember(Map map) {
		return template.delete("deleteMember", map);
	}
	public int checkManagerId(String id) {
		return template.selectOne("checkManagerId", id);
	}
	///팀 만들기
	public int teamInsert(Map map) {
		return template.insert("teamInsert",map);
	}
	//팀 이름 중복 확인
	public int checkTemanName(Map map) {
		return template.selectOne("checkTeamName", map);
	}
	//팀멤버 테이블에 팀 insert
	public int insertTeamMember(Map map) {
		return template.insert("teamMemberInsert",map);
	}
	public int deleteTeam(Map map) {
		return template.delete("deleteTeam", map);
	}
	//id와 같은 팀명 가져오기 
	public List<Map> selectTeamName(String id){
		return template.selectList("selectTeamName",id); 
	}
	//ajax로 고른 팀 데이터 가져오기
	public Map selectTeam(Map map) {
		return template.selectOne("selectTeam", map);
	}/////
	
	//아이디 중복확인
	public int isDuplicate(Map map) {
		
		return template.selectOne("isDuplicate",map);
		
	}
	
	//이메일 중복확인
	public int mIsDuplicate(Map map) {

		return template.selectOne("mIsDuplicate",map);
	}

	public String selectPass(Map map) {
		return template.selectOne("selectPass", map);
	}

	public MemberDTO findByStringId(String username) {
		return template.selectOne("findByStringId", username);
	}

	public int selectMatching(Map map) {
		return template.selectOne("selectMatching", map);
	}
	//매칭 신청한 팀 정보 가져오기
	public List<Map> selectMachingInfo(Map map) {
		
		return template.selectList("selectMatchingInfo", map);
	}
	//매칭 신청한 팀의 최근 5경기 기록 가져오기
	public List<Map> selectRecord222(Map map) {		
		return template.selectList("selectRecord222", map);
	}
	//matchStatus update(complete)
	public int updateMatchStatus(Map map) {
		return template.update("updateMatchStatus", map);
		
	}
	//게임스케쥴에 넣은 데이터 가져오기
	public Map selectGame(Map map) {
		
		return template.selectOne("selectGame",map);
	}
	//게임스케쥴에 인설트
	public int insertSchedule(Map inMap) {
		return template.insert("insertSchedule", inMap);
	}
	//matching reject 후 matchStatus cancel
	public int cancelMatch(Map map) {
		
		return template.update("cancelMatch", map);
	}
	//matchingstatus waiting 가져오기
	public int selectWaiting(Map map) {
		return template.selectOne("selectWaiting",map);
	}
	

}/////class
