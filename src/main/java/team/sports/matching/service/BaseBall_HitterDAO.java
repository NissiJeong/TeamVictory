



package team.sports.matching.service;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("BaseBall_Hitter")
public class BaseBall_HitterDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public int insert(Map map) {
		System.out.println("dao까지는 오냐 ");
		
		return template.insert("hitterInsert",map);
	
	}///isLogin
	
	
	public int hitterSelectOne(Map map) {
		
		template.selectOne("hitterSelectOne");
		return template.selectOne("hitterSelectOne");
		
	}
	
}/////class




