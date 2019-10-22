package team.sports.matching.service;

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
	
	//아이디 중복확인
	public int isDuplicate(Map map) {
		
		return template.selectOne("isDuplicate",map);
		
	}
	
	//이메일 중복확인
	public int mIsDuplicate(Map map) {
		
		return template.selectOne("mIsDuplicate",map);
	}
	
}/////class
