package team.sports.matching.contoller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import team.sports.matching.service.TeamDTO;
import team.sports.matching.service.impl.MatchDAO;

//@SessionAttributes("id")
@Controller
public class MatchController {
	@Resource(name="match")
	private MatchDAO dao;
	ArrayList<String> tokens = new ArrayList<String>();  	
	//토큰 저장용
	final String apiKey = "AAAAYTTmLoQ:APA91bEW6YUXtn0FdQJb7uPlBMBEGvb04jxmbjqfkwrag0G08YqoWZrcSshBDScpVJnA_BO4ED3OjVh7BraefTs7Jux9gk8IJvVTTJXlQ7_NnmLAVbsb0V1CsXKZlErHkECuczHjQfPi";
	String gcmURL ="https://fcm.googleapis.com/fcm/send";
	JSONArray resultArray = new JSONArray();
	
	//로그인 하지 않고 매칭 페이지로 이동시키면 로그인 페이지로 이동
	/*
	@ExceptionHandler(HttpSessionRequiredException.class)
	public String isNotMember(Model model) {
		model.addAttribute("NotMember", "로그인 후 이용하세요");
		//로그인이 안된 경우 로그인 페이지로
		return "member/login.tiles";
	}*/
	
	//매칭 페이지로 이동
	@RequestMapping("/Team/Matching/Matching.do")
	public String matching(@RequestParam Map map,Model model, Authentication auth) {
		//map.put("id", id);
		
		if(auth == null) {
			return "member/login.tiles";
		}

		//System.out.println("이새캬");

	

		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		int manager = dao.selectTeam(map);
		map.put("manager", manager);
		List<TeamDTO> list = dao.selectList(map);
		
		model.addAttribute("list",list);
		//System.out.println("이새캬");
		return "member/matching2.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/matching.do",produces = "text/html; charset=UTF-8")
	public String match(@RequestParam Map map, Authentication auth) {
		String ass= "no";
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		for(Object key:map.keySet()) {
			//System.out.println(key+":"+map.get(key));
		}
		//System.out.println("들어옴");
		//팀장이 아닌 아이디가 신청하면 alert창 띄우게
		int manager = dao.selectManagerId(map);
		if(manager == 0) {
			ass = "매칭 신청은 팀장만 가능합니다";
		}
		else if(manager == 1){
			int affected = dao.insert(map);
			if(affected==1) {
				String myteam = dao.getMyTeam(map);
				String fcmMessage = myteam+"이 "+map.get("date").toString()+" "+map.get("time").toString()+"시에 경기를 신청했습니다 \r\n경기장 "+map.get("stadium");
				List<Map> tokens = dao.getTokens(map);
				for(Map token:tokens) {
					requestToFCMServer("매칭신청", fcmMessage, token.get("TOKEN").toString());
				}
				ass="신청완료";
			}
		}
		//map에 내 팀 no 입력해야함 		
		return ass;
	}
	
	//fcm메세지 보내는 메소드
		private void requestToFCMServer(String title, String message,String token) {
			try {
				URL url = new URL(gcmURL);
				HttpURLConnection httpConn = (HttpURLConnection)url.openConnection();
				httpConn.setRequestMethod("POST");
				httpConn.setRequestProperty("Content-Type", "application/json");
				httpConn.setRequestProperty("Authorization", "key=" + apiKey);
				String msg =String.format("{\"data\":{\"noti_title\":\"%s\",\"noti_message\":\"%s\"},\"to\":\"%s\"}",title,message,token);
				httpConn.setDoOutput(true);
				OutputStream os = httpConn.getOutputStream();
				os.write(msg.getBytes("UTF-8"));
				os.flush();
				os.close();
				int responseCode = httpConn.getResponseCode();
				BufferedReader reader = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
				String responseString;
				while((responseString=reader.readLine())!=null) {
					System.out.println(responseString);
					JSONParser parser = new JSONParser();
					JSONObject object = (JSONObject)parser.parse(responseString);
					resultArray.add(object);
				}
				reader.close();
			}
			catch(Exception e) {e.printStackTrace();}
		}
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/modal.do",produces = "text/html; charset=UTF-8")
	public String upModal(@RequestParam Map map,Model model,@ModelAttribute("id") String id) {
		String result = "";
		JSONObject json = new JSONObject();
		map.put("id", id);
		for(Object key:map.keySet()) {
			//System.out.println(key+":"+map.get(key).toString());
		}
		TeamDTO dto = new TeamDTO();
		dto = dao.selectOne(map);
		json.put("teamName", dto.getTeamName());
		json.put("teamRating", dto.getTeamRating());
		json.put("category", dto.getCategory());
		//System.out.println(dto.getTeamName()+"받아온 팀 이름");
		json.put("teamLogo", dto.getTeamLogo());
		map.put("teamName2", dto.getTeamName());
		List<Map> gameList = dao.selectGamefive(map);
		for(int i=0;i<gameList.size();i++) {
			String[] dates = gameList.get(i).get("GAMEDATE").toString().split(" ")[0].split("-");
			String date = dates[1]+"월 "+dates[2]+"일";
			json.put("gameDate"+i,date);
			json.put("awayTeam"+i,gameList.get(i).get("AWAYTEAM"));
			if(dto.getTeamName().equals(gameList.get(i).get("AWAYTEAM"))) {
				if(Integer.parseInt(gameList.get(i).get("HOMESCORE").toString())<Integer.parseInt(gameList.get(i).get("AWAYSCORE").toString())) {
					result = gameList.get(i).get("TEAMNAME").toString()+"전 승";
					json.put("gameResult"+i, result);
				}
				else if(Integer.parseInt(gameList.get(i).get("HOMESCORE").toString())==Integer.parseInt(gameList.get(i).get("AWAYSCORE").toString())) {
					result = gameList.get(i).get("TEAMNAME").toString()+"전 무";
					json.put("gameResult"+i, result);
				}
				else {
					result = gameList.get(i).get("TEAMNAME").toString()+"전 패";
					json.put("gameResult"+i, result);
				}
				String score = gameList.get(i).get("AWAYSCORE").toString()+" : "+gameList.get(i).get("HOMESCORE").toString();
				json.put("score"+i, score);
				json.put("homeScore"+i,gameList.get(i).get("HOMESCORE"));
				json.put("awayScore"+i,gameList.get(i).get("AWAYSCORE"));
			}
			else {
				if(Integer.parseInt(gameList.get(i).get("HOMESCORE").toString())>Integer.parseInt(gameList.get(i).get("AWAYSCORE").toString())) {
					result = gameList.get(i).get("AWAYTEAM").toString()+"전 승";
					json.put("gameResult"+i, result);
				}
				else if(Integer.parseInt(gameList.get(i).get("HOMESCORE").toString())==Integer.parseInt(gameList.get(i).get("AWAYSCORE").toString())) {
					result = gameList.get(i).get("AWAYTEAM").toString()+"전 무";
					json.put("gameResult"+i, result);
				}
				else {
					result = gameList.get(i).get("AWAYTEAM").toString()+"전 패";
					json.put("gameResult"+i, result);
				}
				String score = gameList.get(i).get("HOMESCORE").toString()+" : "+gameList.get(i).get("AWAYSCORE").toString();
				json.put("score"+i, score);
				json.put("homeScore"+i,gameList.get(i).get("HOMESCORE"));
				json.put("awayScore"+i,gameList.get(i).get("AWAYSCORE"));
			}			
		}
		//System.out.println("json.toJSONString():"+json.toJSONString());
		return json.toJSONString();
	}
	////해당 팀의 같은 날짜,시간에 경기 잡혀있는지 확인하는 메소드
	@ResponseBody
	@RequestMapping(value="/Team/Matching/CheckDateTime.do",produces = "text/html; charset=UTF-8")
	public String checkDateTime(@RequestParam Map map,@ModelAttribute("id") String id) {
		map.put("id", id);
		for(Object key:map.keySet()) {
			//System.out.println(key+":"+map.get(key));
		}
		//System.out.println("들어옴");
		int affected = dao.checkDateTime(map);
		//map에 내 팀 no 입력해야함 
		String checkDateTime= "yes";
		if(affected==1) {
			checkDateTime = "no";
		}		
		return checkDateTime;
	}//////
	//해당경기장의 같은 날짜, 시간에 매칭이 예약 되어 있는지 확인하는 메소드
	@ResponseBody
	@RequestMapping(value="/Team/Matching/CheckDateTimeStadium.do",produces = "text/html; charset=UTF-8")
	public String checkDateTimeStadium(@RequestParam Map map,@ModelAttribute("id") String id) {
		map.put("id", id);
		for(Object key:map.keySet()) {
			//System.out.println(key+":"+map.get(key));
		}
		//System.out.println("들어옴");
		int affected = dao.checkDateTimeStadium(map);
		//map에 내 팀 no 입력해야함 
		String checkDateTimeStadium= "stadiumYes";
		if(affected==1) {
			checkDateTimeStadium = "stadiumNo";
		}		
		return checkDateTimeStadium;
	}//////
}
