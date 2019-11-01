package team.sports.matching.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.sports.matching.service.MessageDTO;
import team.sports.matching.service.MessageService;

@Service
public class MessageDAO implements MessageService{
	
	@Inject
	MessageDAO messageDao;
	
	
	@Transactional
	@Override
	public void addMessage(MessageDTO dto) {
		messageDao.create(dto);
		
	}
	private void create(MessageDTO dto) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public MessageDTO readMessage(String userid, int id) {
		return null;
	}
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
		

}
