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
	//로그아웃
	public int memberRegi(Map map) {
		
		return template.insert("memberRegi", map);
		
	}///memberRegi
	///팀 만들기
	public int teamInsert(Map map) {
		return template.insert("teamInsert",map);
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
}/////class
