package team.sports.matching.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.sports.matching.service.BoardDTO;
import team.sports.matching.service.BoardService;
import team.sports.matching.service.MessageDTO;
import team.sports.matching.service.MessageService;
import team.sports.matching.service.PagingUtil;
import team.sports.matching.service.impl.BoardDAO;
import team.sports.matching.service.impl.MessageDAO;

	//스프링 씨큐리티를 사용하지 않을때
	@SessionAttributes("id")
	@RequestMapping("/messages/*")
	public class MessageController{
	// 서비스 주입]
	@Resource(name = "messageServiceDAO")
	private MessageDAO MessageService;
	@Inject
	MessageService service;
	@RequestMapping(value = "/",method = RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageDTO dto){
		ResponseEntity<String> entity = null;
		try {
			service.addMessage(dto);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
}