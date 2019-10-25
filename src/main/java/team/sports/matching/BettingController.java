package team.sports.matching;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import team.sports.matching.service.BettingDAO;
import team.sports.matching.service.BettingDTO;

@Controller
public class BettingController {

	@Resource(name = "Betting")
	private BettingDAO bettingDao;

	// Top 메뉴 클릭시
	@RequestMapping("/Team/Matching/Betting.do")
	public String betting(Model model) {

		List<BettingDTO> list = bettingDao.selectList(new HashMap());

		// 경기예정일경우 HomeScore 와 awayScore가 null이므로
		// EL표현식에서는 0으로 처리되므로 yet 변경해준다.
		for (BettingDTO dto : list) {
			if (dto.getHomeScore() == null && dto.getAwayScore() == null) {
				dto.setHomeScore("-1");
				dto.setAwayScore("-1");
			}

			System.out.print("[" + (list.indexOf(dto) + 1) + "] ");
			System.out.println(
					String.format("홈팀 : %s 경기일자  : %"
							+ "s 경기장 : %s 경기시간 : %s  어웨이 : %s  게임상태 : %s  홈스코어 : %s  어웨이스코어 : %s",
							dto.getTeamname(), dto.getGameDate(), dto.getStadium(), dto.getTime(), dto.getAwayTeam(),
							dto.getGameStatus(), dto.getHomeScore(), dto.getAwayScore()));
		}

		model.addAttribute("list", list);

		return "member/in-play.tiles";
	}

	
	  @RequestMapping(value = "/Team/Matching/BettingView.do", method =
	  RequestMethod.GET) public String bettingView() {
	  
	  return "member/BettingView.tiles";
	  
	  }
	 

	// 테이블의 상세보기 클릭시
	@ResponseBody
	@RequestMapping(value = "/Team/Matching/viewJsonArray.do", produces = "text/html; charset=UTF-8")
	public String bettingViewAjax(@RequestParam Map map, HttpServletRequest req) {
		
		JSONObject json  = new JSONObject();
          for(Object key : map.keySet())
        	  System.out.println(String.format("%s : %s ",key,map.get(key).toString()));
          
          map.put("home", "h");
          List<Map> homeList =  bettingDao.selectListTeamInfo(map);
          map.remove("home");
          
          List<Map> awayeList = bettingDao.selectListTeamInfo(map);
          
          for(Map homemap : homeList) {
        	  for (Object key : homemap.keySet() ) {
        		    if(key.toString().equals("GAMEDATE")) {
        		    	homemap.put(key,homemap.get(key).toString().split(" ")[0].trim());
        		    }
        		  System.out.println(String.format("컬럼명 : %s  , 데이터 : %s", key,homemap.get(key).toString()));
        	  }
        	 
          }
          json.put("home", homeList);
         
         for(Map awaymap : awayeList) {
       	  for (Object key : awaymap.keySet() ) {
       		    if(key.toString().equals("GAMEDATE")) {
       		    	awaymap.put(key,awaymap.get(key).toString().split(" ")[0].trim());
       		    }
       		  System.out.println(String.format("컬럼명 : %s  , 데이터 : %s", key,awaymap.get(key).toString()));
       	  }
       	 
         }
          
         json.put("away", awayeList);  
   
  
         
       System.out.println(json.toJSONString());
           
          
		return json.toJSONString();

	}///
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/Ajax/AjaxJsonArray.do" ,produces =
	 * "text/html; charset=UTF-8") public String ajaxJsonArray(HttpServletRequest
	 * req) { System.out.println("요청방식 : "+req.getMethod()); //비즈니스 로직 호출 Map map =
	 * new HashMap(); map.put("start",1); map.put("end",10);
	 * 
	 * List<ReplyBBSDto> list = dao.selectList(map); // [{ }, { }, { }] 형태로 반환 (
	 * json 배열)
	 * 
	 * JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션) 호출시에는 List계열 컬렉션에 반드시 Map계열 컬렉션이
	 * 저장되어야 한다] ReplyBBSDTO를 Map으로 변경] ReplyBbsDTO를 Map으로 저장해서 List계열 컬렉션에 저장
	 * 
	 * List<Map> collections = new Vector<Map>(); for(ReplyBBSDto dto : list) { Map
	 * record = new HashMap(); record.put("title",dto.getTitle());
	 * record.put("name",dto.getName()); //json 형식에서 date타입일경우 ""( 더블커테이션)이 없이
	 * 2019-09-17로 나온다 // 숫자만 있으면 상관없지만 - (대시)가 있기때문에 " " 감싸줘야 자바스크립트에서 // 읽어올수있으므로
	 * toString() 해줘야한다. record.put("postDate",dto.getPostDate().toString());
	 * collections.add(record); }
	 * 
	 * System.out.println(JSONArray.toJSONString(collections));
	 * 
	 * return JSONArray.toJSONString(collections);
	 * 
	 * // 안드로이드 KosmoApp 연동시 // return
	 * "[{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_0.gif','text':'이미지0번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_1.gif','text':'이미지1번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_2.gif','text':'이미지2번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_3.gif','text':'이미지3번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_4.gif','text':'이미지4번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_5.gif','text':'이미지5번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_6.gif','text':'이미지6번'},{'url':'http://192.168.0.51:8080/SpringNoMavenProj/Images/num_7.gif','text':'이미지7번'}]";
	 * 
	 * }///////////// ajaxJsonArray
	 */

}
