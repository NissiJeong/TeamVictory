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
   
   @Resource(name="member")
   private MemberDAO dao;
   
   @Resource(name="basketball")
   private BasketballDAO bdao;
   
   @ExceptionHandler({HttpSessionRequiredException.class})
   public String notAllowed(Model model) {
      //무조건 록인 페이지로 이동]
      return "member/login.tiles";
   }   
   
   @RequestMapping("/Team/Matching/chat-ws.do") 
   public String basketball(Model model, Authentication auth, @RequestParam Map map) throws Exception {
      /*Spring Security*/
      UserDetails userDetails = (UserDetails)auth.getPrincipal();
      map.put("id", userDetails.getUsername());
      
      String id = userDetails.getUsername();
      System.out.println("왜들어와?");
      System.out.println(map.get("room"));
      System.out.println("id : "+id);
      
      logger.info("chat.-ws.do RUN ! / Run Time : "+ new Date());
      if(id == null) {
         
         return "member/login.tiles";
         
      }
      else {
         return "member/Basketball.tiles"; 
      }
   }////////basketball()
   
   @RequestMapping(value="/Team/Matching/createRoom.do", method = RequestMethod.POST)
   public String createRoom(@RequestParam Map map) {
	   int affected = 0;
	   System.out.println("들어왔따.");
	   affected = bdao.createRoom(map);
	   if(affected == 1) {
		   System.out.println("방 생성완료");
	   }
	   return "member/Basketball.tiles";
   }
   
   @RequestMapping(value = "/Team/Matching/listRoom.do", produces = "text/html; charset=UTF-8")
   @ResponseBody
   public String listRoom() {
	   System.out.println("들어오냐?");
	   Map map = new HashMap();
	   map.put("start", 1);
	   map.put("end", 2);
	   java.util.List<BasketballDTO> list = bdao.listRoom(map);
	   
	   java.util.List<Map> collections = new Vector<Map>();
	   for(BasketballDTO dto : list) {
		   Map record = new HashMap();
		   record.put("no", dto.getNo());
		   record.put("title", dto.getNo());
		   record.put("area", dto.getNo());
		   record.put("position", dto.getNo());
		   record.put("regidate", dto.getNo().toString());
		   record.put("remainuser", dto.getRemainuser());
		   
		   collections.add(record);
	   }
	   System.out.println(JSONArray.toJSONString(collections));
	   return JSONArray.toJSONString(collections);
	   
   }///////////listRoom
   
}////////////class