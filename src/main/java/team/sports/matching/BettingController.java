package team.sports.matching;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
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

import team.sports.matching.contoller.MatchController;
import team.sports.matching.service.BettingDAO;
import team.sports.matching.service.BettingDTO;
import team.sports.matching.service.MemberDTO;

@Controller
public class BettingController {

	@Resource(name = "Betting")
	private BettingDAO bettingDao;
	
	

	// Top 메뉴 클릭시
	@RequestMapping("/Team/Matching/Betting.do")
	public String betting(Model model) {

		List<BettingDTO> list = bettingDao.selectList(new HashMap());

		// 경기예정일경우 HomeScore 와 awayScore가 null이므로
		// EL표현식에서는 0으로 처리되므로 -1로 변경해준다.
		for (BettingDTO dto : list) {
			if (dto.getHomeScore() == null && dto.getAwayScore() == null) {
				dto.setHomeScore("-1");
				dto.setAwayScore("-1");
			}
             //요일 세팅 
		     dto.setGameDay(dayString(dto.getGameDate()));	
		     //시간  00:00 으로 맞추기 
		     dto.setTime(timeColon(dto.getTime().trim()));
			
			
			System.out.print("[" + (list.indexOf(dto) + 1) + "] ");
			System.out.println(
					String.format("홈팀 : %s 경기일자  : %s 요일 :  %s " 
							+ "경기장 : %s 경기시간 : %s  어웨이 : %s  게임상태 : %s  홈스코어 : %s  어웨이스코어 : %s",
							dto.getTeamname(), dto.getGameDate(),dto.getGameDay(), dto.getStadium(), dto.getTime(), dto.getAwayTeam(),
							dto.getGameStatus(), dto.getHomeScore(), dto.getAwayScore()));
		} //for

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
      	if (  homemap.get("AWAYTEAM").equals(map.get("hometeam"))){
      		  String temp="";
      		  
      		  temp= homemap.get("AWAYTEAM").toString();
      		homemap.put("AWAYTEAM", homemap.get("HOMETEAM").toString());
      		homemap.put("HOMETEAM", temp);
      		
				
				  temp = homemap.get("AWAYSCORE").toString();
				  homemap.put("AWAYSCORE",Integer.parseInt(homemap.get("HOMESCORE").toString()) );
				  homemap.put("HOMESCORE", Integer.parseInt(temp));
				 
      		  
      	  }
      	
      	  for (Object key : homemap.keySet() ) { //맵이 하나의 레코드  key가 컬럼명
      		    if(key.toString().equals("GAMEDATE")) {
      		    	homemap.put(key,homemap.get(key).toString().split(" ")[0].trim());
      		    }
      		   
      		         		    
      		    
      		    
      		  System.out.println(String.format("컬럼명 : %s  , 데이터 : %s", key,homemap.get(key).toString()));
      	  }
      	 
        }
        json.put("home", homeList);
        
        
        
       
       for(Map awaymap : awayeList) {
      	 
      	 if (  awaymap.get("AWAYTEAM").equals(map.get("awayteam"))){
      		 
     		  String temp="";
     		 temp= awaymap.get("AWAYTEAM").toString();
     		awaymap.put("AWAYTEAM", awaymap.get("HOMETEAM").toString());
     		awaymap.put("HOMETEAM", temp);
     		
				
				  temp = awaymap.get("AWAYSCORE").toString(); 
				  awaymap.put("AWAYSCORE",Integer.valueOf(awaymap.get("HOMESCORE").toString()) );
				 awaymap.put("HOMESCORE", Integer.parseInt(temp));
				 
     		  
     	  }
      	 
      	 
     	  for (Object key : awaymap.keySet() ) {
     		    if(key.toString().equals("GAMEDATE")) {
     		    	awaymap.put(key,awaymap.get(key).toString().split(" ")[0].trim());
     		    }
     		  System.out.println(String.format("컬럼명 : %s  , 데이터 : %s", key,awaymap.get(key).toString()));
     	  }
     	 
       }
        
       json.put("away", awayeList);  
       
       
		//키, 값 출력하기 
		 Set keys =json.keySet();
		 for (Object key : json.keySet()) {
			
			System.out.println(String.format("키 : %s 카운트 : %s",key.toString(),((List)json.get(key)).size()   ));
			
			for(int i=0; i<((List)json.get(key)).size(); i++) {
				System.out.print("["+((List)json.get(key)).indexOf(((List)json.get(key)).get(i))+"] ");
			System.out.println(((List)json.get(key)).get(i));
			}
			
		  
		 }
		
 		System.out.println(json.toJSONString());
          
        
		return json.toJSONString();


	}///
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/Point.do" ,produces = "text/html; charset=UTF-8")
	public String  modalPoint(@RequestParam Map map) {
		System.out.println("Point.do 들어오냐");
		    System.out.println("id값 : "+map.get("id").toString());
		    MemberDTO mDto =  bettingDao.memberPoint(map);
		    String  point ="";
		   if( mDto !=null)
			   point= mDto.getPoint();
		
		return point;
	
	}
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

	
	public static  String dayString(java.sql.Date date) {
		    
		    Calendar cal = Calendar.getInstance() ;
		    cal.setTime(date);
		  
		     
		    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
		     String day="";
		      
		     
		    switch(dayNum){
		        case 1:
		            day = "(일)";break ;
		        case 2:
		            day = "(월)";break ;
		        case 3:
		            day = "(화)";break ;
		        case 4:
		            day = "(수)";break ;
		        case 5:
		            day = "(목)";break ;
		        case 6:
		            day = "(금)";break ;
		        case 7:
		            day = "(토)";break ;
		             
		    }
		    
		    return day ;
	}//////////////
	
	
	public static String timeColon(String time) {
		StringBuffer buf = new StringBuffer();
		if (time.length() ==4) {
			buf.append(time.substring(0,2)+":"+time.substring(2,4));
			}
			else {
				buf.append("0"+time.substring(0,1)+":"+time.substring(1,3));
			}
		return buf.toString();
		
	}/////////
	
	
}
