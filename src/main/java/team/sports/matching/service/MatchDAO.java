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
	
	//매치 신청
	public int insert(Map map) {
		return template.insert("matchInsert",map);
	}
	
	public BaseTeamDTO selectOne(Map map) {
		return template.selectOne("oneSelect", map);
	}
}
