
/**


package team.sports.printdb.baseball;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import team.sports.printdb.baseball.BaseBall_HitterDTO;

@Repository("Hitter")
public class HitterDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public int insert(Map map) {
		return template.insert("hitterInsert",map);
	}///isLogin
	
	
	public HitterDTO hitterSelectOne(Map map) {
		return template.selectOne("hitterSelectOne", map);
	}

	
	public List<Map> hitterSelectList(Map map) {
		return template.selectList("hitterSelectList", map);
	}
	
	
	public List<Map> scrollDown(Map map) {
		
		return template.selectList("infiniteScrollDown", map);
	}
	
	
}/////class



**/
