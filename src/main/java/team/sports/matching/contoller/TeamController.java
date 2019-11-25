package team.sports.matching.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oreilly.servlet.MultipartRequest;

import team.sports.matching.service.CommonUtils;
import team.sports.matching.service.MemberDAO;
import team.sports.matching.service.TeamBoardDAO;
import team.sports.matching.service.TeamBoardDTO;
import team.sports.matching.service.TeamDTO;
import team.sports.printdb.baseball.HitterDTO;
import team.sports.printdb.baseball.PitcherDTO;
import team.sports.matching.service.impl.MatchDAO;


@SessionAttributes("id") 
@Controller
public class TeamController {
	@Resource(name="member")
	private MemberDAO dao;
	@Resource(name="teamboard")
	private TeamBoardDAO teamDao;
	int count;
	List<Integer> countList = new Vector<Integer>();
	int newCount=0;
	
	//팀 만들기 페이지로 이동    
	@RequestMapping("/Team/Matching/createTeam.do")
	public String toCreateTeam(Authentication auth,Model model) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String id = userDetails.getUsername();
		int dupliManager = dao.checkManagerId(id);
		model.addAttribute("dupliManager", dupliManager);
		return "member/CreateTeam.tiles";
	}          
	
	//팀서치페이지
	@RequestMapping("/Team/Matching/searchTeam.do") 
	public String teamList(@ModelAttribute("teamName") String teamName, @RequestParam Map map, Model model, Authentication auth) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		System.out.println("들어오냐..?");
		System.out.println("teamName"+teamName);
		map.put("teamName",teamName);
		
		List<Map> totalList = teamDao.memberSelect();//팀원구하기
		List<Map> list = teamDao.teamselectList(map);
		System.out.println("=============================");    
		for(int i=0;i<list.size();i++) {		
			System.out.println("팀원"+totalList.get(i).get("TEAMCOUNT").toString());
			list.get(i).put("TOTALMEMBER", totalList.get(i).get("TEAMCOUNT"));
		
		}
		System.out.println("===============================");
		for(int i=0;i<list.size();i++) {			
			for(Object key:list.get(i).keySet()) {
				System.out.println(key+":"+list.get(i).get(key));
			}
		}
		System.out.println("123123123123123");
		model.addAttribute("list", list);
		 
		//내정보입력
		map.put("id",  userDetails.getUsername()); 
		List<Map> mylist = teamDao.myinfo(map);
		model.addAttribute("myinfo", mylist);
		for(Map team : mylist) {
			System.out.println("이름 : " +team.get("NAME").toString());
		}
		return "member/searchTeam.tiles";
	}
	
	//팀 이름 확인하기
	@ResponseBody
	@RequestMapping(value="/Team/Matching/checkTeam.do",produces = "text/html; charset=UTF-8")
	public String checkTeam(@RequestParam Map map, Authentication auth) {
		String duplic= "no";
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		//System.out.println("들어옴");
		//팀장이 아닌 아이디가 신청하면 alert창 띄우게
		int dupli = dao.checkTemanName(map);
		if(dupli != 1) {
			duplic = "yes";
		}
		return duplic;
	}
	//최신 매칭 글 개수 반환
	@ResponseBody
	@RequestMapping("/Team/matching/selectMatching.do")
	public String scheduleUpdate(Authentication auth,@RequestParam Map map) {
		//System.out.println("1231");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		count = dao.selectMatching(map);
		countList.add(count);
		
		newCount = dao.selectWaiting(map);
		return String.valueOf(newCount);
	}
	//inwaiting인 글의 개수 구하기 
	@ResponseBody
	@RequestMapping("/Team/matching/selectInWaiting.do")
	public String selectInWaiting(Authentication auth,@RequestParam Map map) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		/*int isManager = dao.isManager(map);
		if(isManager == 0) {
			return 
		}*/
		newCount = dao.selectInWaiting(map);
		return String.valueOf(newCount);
	}
	
	//가입 waiting인 글의 개수 구하기 
	@ResponseBody
	@RequestMapping("/Team/matching/selectTeamWaiting.do")
	public String selectTeamWaiting(Authentication auth,@RequestParam Map map) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		/*int isManager = dao.isManager(map);
		if(isManager == 0) {
			return 
		}*/
		newCount = teamDao.selectTeamWaiting(map);
		return String.valueOf(newCount);
	}
	
	//매칭 결정 후 데이터베이스 update 메소드
	@ResponseBody
	@RequestMapping(value="/Team/Matching/decideMatch.do",produces = "text/html; charset=UTF-8")
	public String decideMatch(@RequestParam Map map,Authentication auth) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		//matching 테이블 matchStatus를 complete으로
		if(map.get("match").toString().trim().equals("yes")) {
			int update = dao.updateMatchStatus(map);
			//matchingNo 이용해서 gameSchedule에 insert시킬 데이터 가져오기
			Map inMap = dao.selectGame(map);
			if(inMap.get("TIME").toString().length()==2) {
				inMap.put("TIME", (inMap.get("TIME").toString()+"00"));
			}
			for(Object key : inMap.keySet()) {				
				//System.out.println(key+":"+inMap.get(key));
			}
			//gameSchedule에 데이터 입력
			int isInsert = dao.insertSchedule(inMap);
			if(isInsert==1) {
				int mileage = dao.updateMileage222(map);
			}
			//System.out.println("123123123");
			return "매치가 성사되었습니다 \r\n팀원들의 마일리지가 +200 되었습니다";
		}
		//matching 테이블 matchingStatus를 cancel로
		else {
			int reject = dao.cancelMatch(map);
			return "매칭이 거절되었습니다";
		}
	}
	//매칭 정보 가져오기
	@ResponseBody
	@RequestMapping("/Team/matching/selectMatchingInfo.do")
	public String matchingInfo(Authentication auth,@RequestParam Map map) throws JsonProcessingException {
		//newCount = 0;
		//System.out.println("123123123");
		int matchCount = Integer.parseInt(map.get("matchCount").toString());
		map.put("matchCount", matchCount);
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		List<Map> matchingInfo = dao.selectMachingInfo(map);
		List<String> teamRecord = new Vector<String>();
		//Map<String,String> recordMap = new HashMap<String, String>();
		for(int i=0; i<matchingInfo.size();i++) {
			String recordStr ="No Record";
			int win = 0;
			int lose = 0;
			int draw = 0;
			System.out.println("teamname:"+matchingInfo.get(i).get("TEAMNAME")+" rating:"+matchingInfo.get(i).get("TEAMRATING"));
			matchingInfo.get(i).put("REGIDATE",matchingInfo.get(i).get("REGIDATE").toString().substring(0, 11).trim());
			matchingInfo.get(i).put("REQDATE",matchingInfo.get(i).get("REQDATE").toString().substring(0, 11).trim());
			map.put("teamName", matchingInfo.get(i).get("TEAMNAME"));
			List<Map> record = dao.selectRecord222(map);		
			System.out.println("record size: "+record.size());
			for(int k=0;k<record.size();k++) {
				if(record.get(k).get("TEAMNAME").toString().trim().equals(matchingInfo.get(i).get("TEAMNAME").toString().trim())) {
					if(Integer.parseInt(record.get(k).get("HOMESCORE").toString())<Integer.parseInt(record.get(k).get("AWAYSCORE").toString())) {
						win++;
					}
					else if(Integer.parseInt(record.get(k).get("HOMESCORE").toString())>Integer.parseInt(record.get(k).get("AWAYSCORE").toString())) {
						lose++;
					}
					else {
						draw++;
					}
				}
				else if(record.get(k).get("AWAYTEAM").toString().trim().equals(matchingInfo.get(i).get("TEAMNAME").toString().trim())){
					if(Integer.parseInt(record.get(k).get("HOMESCORE").toString())>Integer.parseInt(record.get(k).get("AWAYSCORE").toString())) {
						win++;
					}
					else if(Integer.parseInt(record.get(k).get("HOMESCORE").toString())<Integer.parseInt(record.get(k).get("AWAYSCORE").toString())) {
						lose++;
					}
					else {
						draw++;
					}
				}
			}
			System.out.println("win:"+win+"lose:"+lose+"draw:"+draw);
			if(win != 0 || lose !=0) {
				recordStr = (win+lose+draw)+"G"+"</br>"+win+"W "+draw+"D "+lose+"L";
			}	
			teamRecord.add(recordStr);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(matchingInfo);
		String matchRecord = mapper.writeValueAsString(teamRecord);
		String newJsonStr = "";
		if(jsonStr.equals("[]")) {
			newJsonStr = jsonStr;
		}
		else {
			newJsonStr = "{\"info\":"+jsonStr+", \"record\":"+matchRecord+"}";
		}		
		System.out.println(newJsonStr);
		return newJsonStr;
	}
	
	//inwaiting 정보 가져오기
	@ResponseBody
	@RequestMapping("/Team/matching/gameFinish.do")
	public String finishInfo(Authentication auth,@RequestParam Map map) throws JsonProcessingException {
		System.out.println("123123123");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		List<Map> finishInfo = dao.selectFinishInfo(map);
		//List<String> teamRecord = new Vector<String>();
		for(int i=0; i<finishInfo.size();i++) {
			for(Object key : finishInfo.get(i).keySet()) {
				System.out.print(key+":"+finishInfo.get(i).get(key)+"  /  ");
			}
			System.out.println();
		}
		for(int i=0; i<finishInfo.size();i++) {
			finishInfo.get(i).put("GAMEDATE",finishInfo.get(i).get("GAMEDATE").toString().substring(0, 11).trim());			
			if(finishInfo.get(i).get("TIME").toString().length()==3) {
				finishInfo.get(i).put("TIME", finishInfo.get(i).get("TIME").toString().substring(0,1)+":"+finishInfo.get(i).get("TIME").toString().substring(1));
	         }
	         else if(finishInfo.get(i).get("TIME").toString().length()==4) {
	        	 finishInfo.get(i).put("TIME", finishInfo.get(i).get("TIME").toString().substring(0,2)+":"+finishInfo.get(i).get("TIME").toString().substring(2));
	         }
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(finishInfo);
		//String matchRecord = mapper.writeValueAsString(teamRecord);
		String newJsonStr = "";
		if(jsonStr.equals("[]")) {
			newJsonStr = jsonStr;
		}
		else {
			newJsonStr = "{\"info\":"+jsonStr+"}";
		}		
		System.out.println(newJsonStr);
		return newJsonStr;
	}
	
	//가입 waiting 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/Team/matching/signupmember.do", produces = "text/html; charset=UTF-8")
	public String signUpTeammember(Authentication auth,@RequestParam Map map) throws JsonProcessingException {
		System.out.println("123123123");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		List<Map> signupmember = teamDao.selectSignup(map);
		//List<String> teamRecord = new Vector<String>();
		/*
		  for(int i=0; i<signupmember.size();i++) { for(Object key :
		  signupmember.get(i).keySet()) {
		  System.out.print(key+":"+signupmember.get(i).get(key)+"  /  "); }
		  System.out.println(); }
		 */
		for(int i=0; i<signupmember.size();i++) {
			signupmember.get(i).put("REGIDATE",signupmember.get(i).get("REGIDATE").toString().substring(0, 11).trim());
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(signupmember);
		//String matchRecord = mapper.writeValueAsString(teamRecord);
		String newJsonStr = "";
		if(jsonStr.equals("[]")) {
			newJsonStr = jsonStr;
		}
		else {
			newJsonStr = "{\"info\":"+jsonStr+"}";
		}		
		//System.out.println(newJsonStr);
		return newJsonStr;
	
		
	}
	
	//가입승인 업데이트
	@ResponseBody
	@RequestMapping("/Team/Matching/signupComplete.do")
	public String signupComplete(@RequestParam Map map, Authentication auth) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String id = userDetails.getUsername();
		for(Object key : map.keySet()) {
			System.out.println("저장값 "+key+":"+map.get(key));
		}
		System.out.println("===================");
		//int affected = teamDao.updateTeammember(map);
		//teamDao.updateTeammember(map);
		int affected = teamDao.updateRegiStatus(map);
		System.out.println("===================");
		
		//System.out.println(affected); 
		//if(affected == 1) {
			System.out.println("들어오냐???");
		//}
		return "yes";
	}
	
	//gameFinsh버튼 누른 후 요청
	@ResponseBody
	@RequestMapping("/Team/Matching/finishGame.do")
	public String gameFinish(@RequestParam Map map, Authentication auth) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String id = userDetails.getUsername();
		map.put("id", id);
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		List<Map> managers = dao.selectManagerId(map);
		String ids = "";
		//버튼을 누른 팀의 팀장 id를 ids에 저장
		for(int i=0;i<managers.size();i++) {
			ids+=managers.get(i).get("MANAGER_ID").toString();
		}
		//매니저만 finish 누를 수 있음!!
		if(ids.indexOf(id)==-1) {
			return "No";
		}
		int affected = dao.updateGameStatus222(map);
		//finish누른 사람이 manager일때
		if(affected == 1) {			
			//팀원들의 마일리지 올리기
			int mileage = dao.updateMileage222(map);
			//팀 rating 계산하는 로직
			List<Map> HomeGameList = dao.selectHomeGameSchedule(map);
			List<Map> AwayGameList = dao.selectAwayGameSchedule(map);
			String hometeam = HomeGameList.get(0).get("TEAMNAME").toString();
			double homeRating = Double.parseDouble(HomeGameList.get(HomeGameList.size()-1).get("TEAMRATING").toString());
			int home_homescore = Integer.parseInt(HomeGameList.get(0).get("HOMESCORE").toString());
			int home_awayscore = Integer.parseInt(HomeGameList.get(0).get("AWAYSCORE").toString());
			int homeMatchCount = HomeGameList.size();
			String awayteam = AwayGameList.get(0).get("AWAYTEAM").toString();
			double awayRating = Double.parseDouble(AwayGameList.get(AwayGameList.size()-1).get("TEAMRATING").toString());
			int awayMatchCount = AwayGameList.size();
			int away_awayscore = Integer.parseInt(AwayGameList.get(0).get("HOMESCORE").toString());
			int away_homescore = Integer.parseInt(AwayGameList.get(0).get("AWAYSCORE").toString());
			double homeNewRating = CommonUtils.calcRating(homeRating, awayRating, homeMatchCount, home_homescore, home_awayscore);
			double awayNewRating = CommonUtils.calcRating(awayRating, homeRating, awayMatchCount, away_homescore, away_awayscore);
			System.out.println("home Rating:"+hometeam+":"+homeNewRating+"away Rating:"+awayteam+":"+awayNewRating);
			map.put("homeNewRating", homeNewRating);
			map.put("awayNewRating", awayNewRating);
			int isHomeUpdate = dao.updateHomeRating(map);
			int isAwayUpdate = dao.updateAwayRating(map);
			for(int i=0; i<HomeGameList.size();i++) {
				for(Object key : HomeGameList.get(i).keySet()) {
					//System.out.print(key+":"+HomeGameList.get(i).get(key)+"/");
				}
				//System.out.println();
			}
			map.put("gamedate", HomeGameList.get(0).get("GAMEDATE"));
			map.put("time",HomeGameList.get(0).get("TIME"));
			map.put("stadium", HomeGameList.get(0).get("STADIUM"));
			for(Object key : map.keySet()) {
				System.out.println(key+":"+map.get(key));
			}
			List<Map> bettingPersons = dao.selectBettings(map);
			double totalMileage = 0;
			double homeMileage = 0;
			double drawMileage = 0;
			double awayMileage = 0;
			
			for(int i=0; i<bettingPersons.size();i++) {
				totalMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				if(hometeam.equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
					homeMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}
				else if("DRAW".equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
					drawMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}
				else {
					awayMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}				
				for(Object key : bettingPersons.get(i).keySet()) {
					System.out.print(key+":"+bettingPersons.get(i).get(key)+"/");
				}
				System.out.println();
			}
			Map resultMap = new HashMap(); 
			for(int i=0; i<bettingPersons.size();i++) {
				resultMap.put("id", bettingPersons.get(i).get("ID").toString());
				if(home_homescore>home_awayscore) {
					if(hometeam.equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
						double myMileage =  totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/homeMileage);
						System.out.println("홈팀이 이겼을 때 내가 딴 돈:"+myMileage);
						resultMap.put("myMileage", myMileage);
						int update = dao.updatePoint(resultMap);
					}
					else {
						double myMileage = 0;
						resultMap.put("myMileage", myMileage);
						int update = dao.updatePoint(resultMap);
					}					
				}
				else if(home_homescore==home_awayscore) {
					if("DRAW".equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
						double myMileage = totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/drawMileage);
						System.out.println("draw했을 떄 내가 딴 돈:"+myMileage);
						resultMap.put("myMileage", myMileage);
						int update = dao.updatePoint(resultMap);
					}
					else {
						double myMileage = 0;
						resultMap.put("myMileage", myMileage);
						int update = dao.updatePoint(resultMap);
					}
				}
				else {
					if(awayteam.equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
						double myMileage =  totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/awayMileage);
						System.out.println("away팀이 이겼을 때 내가 딴 돈:"+myMileage);
						resultMap.put("myMileage", myMileage);
						int update = dao.updatePoint(resultMap);
					}
					else {
						double myMileage = 0;
						resultMap.put("myMileage", myMileage);
						int update = dao.updatePoint(resultMap);
					}
				}
			}			
			return "yes";
		}
		return null;
	}
	
	
	//팀페이지로 이동
	@RequestMapping("/Team/Matching/Team.do") 
	public String team(Authentication auth,Model model, @RequestParam Map map) {
		
		List<Map> list = new Vector<Map>();
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String id = userDetails.getUsername();
		list = dao.selectTeamName(id);
		List<String> teams = new Vector<String>();
		for(Map team : list) {
			teams.add(team.get("TEAMNAME").toString());
		}
		model.addAttribute("teams", teams);
		
		if(map.get("TEAMNAME222") == null) {	
			//선수목록 보내기
			map.put("id", id);
			List<TeamBoardDTO> list2 = teamDao.selectList(map);
			model.addAttribute("list2",list2);
			
			//최다득점 목록
			List<TeamBoardDTO> list3 = teamDao.bestrbiPlayer(map);
			model.addAttribute("list3",list3);
			
			//최다삼진 목록
			List<TeamBoardDTO> list4 = teamDao.bestsoPlayer(map);
			model.addAttribute("list4",list4);
			
			//최다삼진 목록
			List<TeamBoardDTO> list5 = teamDao.besthrPlayer(map);
			model.addAttribute("list5",list5);
			
			//최다도루 목록
			List<TeamBoardDTO> list6 = teamDao.bestsbPlayer(map);
			model.addAttribute("list6",list6);
			 
			//경기일정
			List<TeamBoardDTO> list7 = teamDao.gameSchedule(map);
			model.addAttribute("list7",list7);
			
			//팀소개
			List<TeamBoardDTO> list8 = teamDao.teamInfo(map);
			for(TeamBoardDTO team : list8) {
				System.out.println("매니저아이디 : " +team.getManager_id()); 
			}
			model.addAttribute("list8",list8);
			
			//투수랭킹
			List<PitcherDTO> list9 = teamDao.pitcherRank(map); 
			model.addAttribute("pitcherrank",list9);
			
			//타자랭킹
			List<HitterDTO> list10 = teamDao.hitterRank(map);
			model.addAttribute("hitterrank",list10);
			
			//팀기네스-최다득점
			List<TeamBoardDTO> list11 = teamDao.teamGuinnessScore(map);
			model.addAttribute("teamguinnessscore",list11);
			  
			//팀기네스-최다홈런
			List<TeamBoardDTO> list12 = teamDao.teamGuinnessHomeRun(map);
			model.addAttribute("teamguinnesshomerun",list12);
	
			//팀기네스-최다안타
			List<TeamBoardDTO> list13 = teamDao.teamGuinnessHit(map);
			model.addAttribute("teamguinnesshit",list13);
	
			//팀기네스-최다삼진
			List<TeamBoardDTO> list14 = teamDao.teamGuinnessStrikeOut(map);
			model.addAttribute("teamguinnessstrikeout",list14);
			return "member/team.tiles";
		}
		else {
			
			String TEAMNAME222 = map.get("TEAMNAME222").toString();
			System.out.println("teamname222:"+TEAMNAME222);
			map.put("TEAMNAME222", TEAMNAME222);
			for(Object key : map.keySet()) {      
				String value=(String) map.get(key); 
				System.out.println("key : " + key + ", value : " +value);
			}
			
			//선수목록 보내기
			map.put("id", id);
			List<TeamBoardDTO> list2 = teamDao.selectListSelect(map);
			model.addAttribute("list2",list2);
			
			//최다득점 목록
			List<TeamBoardDTO> list3 = teamDao.bestrbiPlayerSelect(map);
			model.addAttribute("list3",list3);  
			
			//최다삼진 목록
			List<TeamBoardDTO> list4 = teamDao.bestsoPlayerSelect(map);
			model.addAttribute("list4",list4);
			
			//최다홈런 목록
			List<TeamBoardDTO> list5 = teamDao.besthrPlayerSelect(map);
			model.addAttribute("list5",list5);
			
			//최다도루 목록
			List<TeamBoardDTO> list6 = teamDao.bestsbPlayerSelect(map);
			model.addAttribute("list6",list6);
			
			//경기일정
			List<TeamBoardDTO> list7 = teamDao.gameScheduleSelect(map);
			model.addAttribute("list7",list7);
			
			//팀소개
			List<TeamBoardDTO> list8 = teamDao.teamInfoSelect(map);	
			model.addAttribute("list8",list8);
			
			//투수랭킹
			List<Map> list9 = teamDao.pitcherRankSelect(map);
			model.addAttribute("pitcherrank",list9);
			
			//타자랭킹
			List<Map> list10 = teamDao.hitterRankSelect(map);
			model.addAttribute("hitterrank",list10);
			
			//팀기네스-최다득점
			List<TeamBoardDTO> list11 = teamDao.teamGuinnessScoreSelect(map);
			model.addAttribute("teamguinnessscore",list11);
			
			//팀기네스-최다홈런
			List<TeamBoardDTO> list12 = teamDao.teamGuinnessHomeRunSelect(map);
			model.addAttribute("teamguinnesshomerun",list12);
	
			//팀기네스-최다안타
			List<TeamBoardDTO> list13 = teamDao.teamGuinnessHitSelect(map);
			model.addAttribute("teamguinnesshit",list13);
	
			//팀기네스-최다삼진
			List<TeamBoardDTO> list14 = teamDao.teamGuinnessStrikeOutSelect(map);
			model.addAttribute("teamguinnessstrikeout",list14);
			
			return "member/team.tiles";
		}
	}
	
	//팀 바꾸기 ajax
	/*@ResponseBody
	@RequestMapping(value="/Team/Matching/teamSelect.do",produces = "text/html; charset=UTF-8")
	public String match(@RequestParam Map map,Authentication auth) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String id = userDetails.getUsername();
		map.put("id", id);
		System.out.println("팀이름 : " + map.get("teamName"));
		System.out.println("로그인한 아이디 : " + map.get("id"));
		System.out.println("들어옴");
		dao.selectTeam(map);
		//map에 내 팀 no 입력해야함 
		String ass= "no";	
		return ass;
	}*/
}