package team.sports.matching.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import team.sports.matching.service.BoardDTO;
import team.sports.matching.service.BoardService;

public class BoardServiceImpl implements BoardService {

	//DAO객체 주입]
	@Resource(name="boardDAO")
	private BoardDAO dao;
	
	@Override
	public boolean isLogin(Map map) {	
		return dao.isLogin(map);
	}
	@Override
	public List<BoardDTO> selectList(Map map) {		
		return dao.selectList(map);
	}
	
	@Override
	public List<BoardDTO> noticeList(Map map) {		
		return dao.noticeList(map);
	}
	
	@Override
	public int getTotalRecord(Map map) {		
		return dao.getTotalRecord(map);
	}
	@Override
	public BoardDTO selectOne(Map map) {		
		return dao.selectOne(map);
	}
	@Override
	public int delete(Map map) {		
		return dao.delete(map);
	}
	@Override
	public int insert(Map map) {		
		return dao.insert(map);
	}
	@Override
	public int update(Map map) {		
		return dao.update(map);
	}



}
