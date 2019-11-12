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

}
