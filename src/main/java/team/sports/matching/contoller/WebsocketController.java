package team.sports.matching.contoller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


import team.sports.matching.HomeController;
import team.sports.matching.service.MemberDAO;

@SessionAttributes("id")
@Controller
public class WebsocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="member")
	private MemberDAO dao;
	
	@ExceptionHandler({HttpSessionRequiredException.class})
	public String notAllowed(Model model) {
		//무조건 록인 페이지로 이동]
		return "member/login.tiles";
	}	
	
	@RequestMapping("/Team/Matching/chat-ws.do") 
	public String basketball(@ModelAttribute("id") String id, Model model, HttpServletRequest req) throws Exception {
	
		//mv.setViewName("chat/chattingview");
		//시큐리티 적용해도 세션의 값을 User로 불러올 수 있음.
		//User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println("user name : "+user.getUsername());
		System.out.println("id : "+id);
		
		
		logger.info("chat.-ws.do RUN ! / Run Time : "+ new Date());
		if(id == null) {
			
			return "member/login.tiles";
			
		}
		else {
			return "member/Basketball.tiles"; 
		}
		
			
		
	}////////basketball()
}
