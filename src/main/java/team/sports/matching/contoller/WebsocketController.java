package team.sports.matching.contoller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import team.sports.matching.HomeController;
import team.sports.matching.service.BasketballDAO;
import team.sports.matching.service.BasketballDTO;
import team.sports.matching.service.MemberDAO;

@Controller
public class WebsocketController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name = "member")
	private MemberDAO dao;

	@Resource(name = "basketball")
	private BasketballDAO bdao;

	@ExceptionHandler({ HttpSessionRequiredException.class })
	public String notAllowed(Model model) {
		// 무조건 록인 페이지로 이동]
		return "member/login.tiles";
	}

	@RequestMapping("/Team/Matching/chat-ws.do")
	public String basketball(Model model, Authentication auth, @RequestParam Map map) throws Exception {
		/* Spring Security */
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		String id = userDetails.getUsername();

		// System.out.println("id : "+id);

		logger.info("chat.-ws.do RUN ! / Run Time : " + new Date());
		if (id == null) {

			return "member/login.tiles";

		} else {
			return "member/Basketball.tiles";
		}
	}//////// basketball()

	@ResponseBody
	@RequestMapping(value = "/Team/Matching/createRoom.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String createRoom(@RequestParam Map map, Authentication auth) {
		
		int affected = 0;
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		
		map.put("id", userDetails.getUsername());
		
		String title = null; //만든 title
		
		affected = bdao.createRoom(map);
		if (affected == 1) {
			// System.out.println("방 생성완료");
			bdao.chatMember(map);
			title = map.get("title").toString();
		}

		return title;
	}

	@RequestMapping(value = "/Team/Matching/listRoom.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String listRoom() {

		Map map = new HashMap();

		java.util.List<BasketballDTO> list = bdao.roomList(map);

		java.util.List<Map> collections = new Vector<Map>();
		for (BasketballDTO dto : list) {
			Map record = new HashMap();
			record.put("title", dto.getTitle());
			record.put("id", dto.getId());
			record.put("area", dto.getArea());
			record.put("position", dto.getPosition());
			record.put("regidate", dto.getRegidate().toString());
			record.put("readycount", dto.getReadyCount());

			collections.add(record);
		}

		return JSONArray.toJSONString(collections);

	}/////////// listRoom

	@ResponseBody
	@RequestMapping(value = "/Team/Matching/checkTitle.do", produces = "text/html; charset=UTF-8")
	public String checkTitle(@RequestParam Map map) {
		int duplicated = bdao.titleDuplicate(map);
		String impossible = "impossible";
		if (duplicated == 0) {
			impossible = "possible";
		}
		return impossible;
	}

	@ResponseBody
	@RequestMapping("/Team/Matching/Ent.do")
	public String enter(@RequestParam Map map) {

		
		int enter = Integer.parseInt(bdao.limitRoom(map));
		
		int existUser = Integer.parseInt(bdao.existUser(map));
		
		
		System.out.println("클릭한 방의 인원 : "+enter);
		String impossible = "impossible";

		if (enter < 3 && existUser==0) {
			impossible = "possible";
		}

		return impossible;

	}

	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/Team/Matching/ExistUser.do") public String
	 * userList(@RequestParam Map map) { System.out.println("두번째 AJAX");
	 * 
	 * int exist = Integer.parseInt(bdao.existUser(map)); System.out.println(exist);
	 * 
	 * return ""; }
	 */
	 

}//////////// class