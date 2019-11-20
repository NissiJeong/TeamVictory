package team.sports.matching.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import team.sports.matching.service.BoardDTO;
import team.sports.matching.service.BoardService;

@Repository
@Service("boardServiceDAO")
public class BoardDAO implements BoardService {
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate template;
	//로그인 용]
	@Override
	public boolean isLogin(Map map) {
		return (Integer)template.selectOne("boardIsLogin",map)==0?false:true;
	}
	//전체 목록용]
	@Override
	public List<BoardDTO> selectList(Map map) {		
		return template.selectList("boardSelectList",map);
	}
	//공지사항 리스트
	@Override
	public List<BoardDTO> noticeList(Map map) {		
		return template.selectList("noticeList",map);
	}
	
	//조회수 올리는 메소드]
	public int getCountNo(Map map) {
		return template.update("updateboardcount",map);
	}

	@Override
	public int getTotalRecord(Map map) {		
		return template.selectOne("boardTotal",map);
	}//////////

	@Override
	public BoardDTO selectOne(Map map) {		
		return template.selectOne("boardSelectOne", map);
	}

	@Override
	public int delete(Map map) {
		/*메모 삭제-프로그래밍적으로 삭제하거나 혹은 
		   부모 삭제시 자동으로 해당 자식도 삭제하도록 FK설정
		  REFERENCES 부모테이블(PK컬럼) ON  DELETE CASCADE
		*/
		
		//부모삭제]
		return template.delete("boardDelete",map);
	}
    //입력용]
	@Override
	public int insert(Map map) {	
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		return template.insert("boardInsert", map);
	}

	@Override
	public int update(Map map) {		
		return template.update("boardUpdate",map);
	}
	
	
	
}
