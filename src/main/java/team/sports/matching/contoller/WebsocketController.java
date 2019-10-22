package team.sports.matching.contoller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/Team/Matching/chat-ws.do") 
	public String basketball(Model model, HttpServletRequest req) throws Exception {
	
		logger.info("chat.-ws.do RUN ! / Run Time : "+ new Date());
		
		MemberDAO login = (MemberDAO)req.getSession().getAttribute("isLogin");
		if(login == null) {
			return "member/login.tiles";
		}
		else {
			return "member/WebProtoType.tiles"; 
		}
		
		
		 
	}////////basketball()
}
