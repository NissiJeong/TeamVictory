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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.sports.matching.service.BoardDTO;
import team.sports.matching.service.BoardService;
import team.sports.matching.service.MessageDTO;
import team.sports.matching.service.PagingUtil;
import team.sports.matching.service.impl.BoardDAO;
import team.sports.matching.service.impl.MessageDAO;

@Controller
public class MessageController{
	
	@Resource(name="messageDAO")
	private MessageDAO messageDao;
	
	@RequestMapping(value = "/Team/Matching/contact.do",method = RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageDTO dto,@RequestParam Map map, Authentication auth // 스프링 씨큐리티 사용시
	) {
		// 서비스 호출]
		// 스프링 씨큐리티 사용시 아래코드 추가
		 UserDetails userDetails=(UserDetails)auth.getPrincipal();		
		 map.put("id",userDetails.getUsername());//씨큐리티 적용후

		ResponseEntity<String> entity = null;
		try {
			messageDao.create(dto);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
}