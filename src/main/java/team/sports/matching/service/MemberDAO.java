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
}
