package team.sports.matching.contoller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.sports.matching.service.AndBettingDTO;
import team.sports.matching.service.AndroidDAO;
import team.sports.matching.service.FinishGameDTO;
import team.sports.matching.service.GameDTO;
import team.sports.matching.service.MatchDTO;
import team.sports.matching.service.TeamDTO;

@RestController
public class AndroidController {
	@Resource(name="android")
	private AndroidDAO dao;
	
	
	@CrossOrigin
	@RequestMapping(value="/ANDROID/MatchInfo.do",produces="application/json; charset=UTF-8")
	public List<TeamDTO> getTeamInfo(@RequestParam Map map){
		//System.out.println("들어왔다!!");
		List<TeamDTO> teams = new Vector<TeamDTO>();
		teams = dao.selectTeam(map);
		return teams;
	}
	@CrossOrigin
	@RequestMapping(value="/ANDROID/Match.do",produces="application/json; charset=UTF-8")
	public String matching(@RequestParam Map map){
		System.out.println("들어왔다!!");
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		if(map.get("matchTime").toString().substring(0,3).trim().equals("AM")) {
			map.put("matchTime", map.get("matchTime").toString().substring(3,map.get("matchTime").toString().indexOf("시")).trim()+map.get("matchTime").toString().substring(6,map.get("matchTime").toString().indexOf("분")).trim());
		}
		else {
			map.put("matchTime", Integer.parseInt(map.get("matchTime").toString().substring(3,map.get("matchTime").toString().indexOf("시")).trim())+12+map.get("matchTime").toString().substring(6,map.get("matchTime").toString().indexOf("분")).trim());
		}
		map.put("matchDate", map.get("matchDate").toString().split("/")[0].trim()+"-"+map.get("matchDate").toString().split("/")[1].trim()+"-"+map.get("matchDate").toString().split("/")[2].trim());
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key)+"  /  ");
		}
		int match = dao.insertmatch(map);
		return match==1?"yes":"no";
	}
	///////
	@CrossOrigin
	@RequestMapping(value="/ANDROID/saveToken.do",produces="text/plain; charset=UTF-8")
	public String saveTokec(@RequestParam Map map) {
		System.out.println("토큰 전달:"+map.get("token"));
		int tokenInsert = dao.inserToken(map);
		return tokenInsert==1?"yes":"no";
	}
	//나한테 들어온 매칭 list
	@CrossOrigin
	@RequestMapping(value="/ANDROID/MatchList.do",produces="application/json; charset=UTF-8")
	public List<MatchDTO> matchList(@RequestParam Map map){
		System.out.println("들어오았다!");
		for(Object key : map.keySet()) {
			//System.out.println(key+":"+map.get(key));
		}
		List<MatchDTO> matchList = dao.selectMatchList(map);
		for(int i=0;i<matchList.size();i++) {
			//System.out.println(matchList.get(i).getReqdate());
			matchList.get(i).setReqdate(matchList.get(i).getReqdate().substring(0,11).trim());
		}
		return matchList;
	}
	//매칭 결정 
	@CrossOrigin
	@RequestMapping(value="/ANDROID/MatchResult.do",produces="text/plain; charset=UTF-8")
	public String matchResult(@RequestParam Map map) {
		for(Object key: map.keySet()) {
			//System.out.println(key+":"+map.get(key)+" / ");
		}
		if(map.get("result").toString().equals("o")) {
			int updateMatch = dao.updateMatchStatus22(map);
			if(updateMatch==1) {
				Map gameMap = dao.selectGame2222(map);
				gameMap.put("TIME", gameMap.get("TIME")+"00");
				int insertGame = dao.insertGameSchedule222(gameMap);
			}
			return "경기 일정이 잡혔습니다";
		}
		else {
			int updateMatch = dao.updateMatchStatus33(map);
			return "매칭 신청을 거절하였습니다";
		}
	}
	//gameList가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/GameList22.do",produces="application/json; charset=UTF-8")
	public List<GameDTO> gameList22(@RequestParam Map map){
		for(Object key:map.keySet()) {
			//System.out.println(key+":"+map.get(key)+" / ");
		}
		List<GameDTO> gameList = dao.selectGameList233(map);
		for(int i=0;i<gameList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			gameList.get(i).setGamedate(gameList.get(i).getGamedate().substring(0,11).trim());
		}
		return gameList;
	}
	//배팅 리스트 - 예정인 경기(내가 속한팀의 경기 빼고)
	@CrossOrigin
	@RequestMapping(value="/ANDROID/BettingList.do",produces="application/json; charset=UTF-8")
	public List<AndBettingDTO> bettingList22(@RequestParam Map map){
		for(Object key:map.keySet()) {
			//System.out.println("123123"+key+":"+map.get(key)+" / ");
		}
		List<AndBettingDTO> bettingList = dao.selectBetting22(map);
		for(int i=0;i<bettingList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			bettingList.get(i).setGamedate(bettingList.get(i).getGamedate().substring(0,11).trim());
		}
		return bettingList;
	}
	//finish게임 리스트
	@CrossOrigin
	@RequestMapping(value="/ANDROID/finishGameList.do",produces="application/json; charset=UTF-8")
	public List<FinishGameDTO> finishList22(@RequestParam Map map){
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		List<FinishGameDTO> finishList = dao.selectFinish222(map);
		for(int i=0;i<finishList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			finishList.get(i).setGamedate(finishList.get(i).getGamedate().substring(0,11).trim());
		}
		return finishList;
	}
	//배팅하기 전 내 마일리지와 홈팀, 어웨이 팀 정보 가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/getTeamAndMyInfo.do",produces="text/plain; charset=UTF-8")
	public String getTeamAndMyInfo(@RequestParam Map map){
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		//내 마일리지
		int mileage = dao.selectMyMileage(map);
		//홈팀 rating
		int homeRating = dao.selectHomeRating(map);
		//어웨이팀 rating
		int awayRating = dao.selectAwayRating(map);
		//홈팀 5경기 정보
		List<Map> homeList = dao.selectHomeList(map);
		String homeRecord="No Record";
		int homewin = 0;
		int homedraw = 0;
		int homelose = 0;
		for(int i=0;i<homeList.size();i++) {
			for(Object key : homeList.get(i).keySet()) {
				//System.out.print(key+":"+homeList.get(i).get(key)+" / ");
			}
			if(Integer.parseInt(homeList.get(i).get("HOMESCORE").toString())>Integer.parseInt(homeList.get(i).get("AWAYSCORE").toString())) {
				homewin++;
			}
			else if(Integer.parseInt(homeList.get(i).get("HOMESCORE").toString())<Integer.parseInt(homeList.get(i).get("AWAYSCORE").toString())) {
				homelose++;
			}
			else {
				homedraw ++;
			}
			//System.out.println();
		}
		if(homewin!=0 || homedraw!=0 || homelose !=0) {
			homeRecord = (homewin+homedraw+homelose)+"G "+homewin+"W "+homedraw+"D "+homelose+"L";
		}
		//System.out.println("//////////////////////////////");
		//어웨이 5경기 정보
		String aRecord="No Record";
		int awin = 0;
		int adraw = 0;
		int alose = 0;
		List<Map> awayList = dao.selectAwayList(map);
		for(int i=0;i<awayList.size();i++) {
			for(Object key : awayList.get(i).keySet()) {
				//System.out.print(key+":"+awayList.get(i).get(key)+" / ");
			}if(Integer.parseInt(awayList.get(i).get("HOMESCORE").toString())>Integer.parseInt(awayList.get(i).get("AWAYSCORE").toString())) {
				awin++;
			}
			else if(Integer.parseInt(awayList.get(i).get("HOMESCORE").toString())<Integer.parseInt(awayList.get(i).get("AWAYSCORE").toString())) {
				alose++;
			}
			else {
				adraw ++;
			}
			//System.out.println();
		}
		if(awin!=0 || adraw!=0 || alose !=0) {
			aRecord = (awin+adraw+alose)+"G "+awin+"W "+adraw+"D "+alose+"L";
		}
		String totalInfo="";
		Map myList = dao.selectBettingMyId(map);
		String myselectTeam="";
		String myBettingmileage="";
		if(myList != null ) {
			for(Object key : myList.keySet()){
				System.out.println(key+":"+myList.get(key));
			}
			myselectTeam = myList.get("SELECTTEAM").toString();
			myBettingmileage = myList.get("MILEAGE").toString();
			totalInfo = "homerating:"+homeRating+"/homerecord:"+homeRecord+"-awayrating:"+awayRating+"/awayrecord:"+aRecord+"-mileage:"+mileage+"-prevMileage:"+myBettingmileage+"/prevSelectTeam:"+myselectTeam+"-isbetting:"+1;
			return totalInfo;
		}
		//System.out.println("homerating:"+homeRating+" awayrating:"+awayRating+" mileage:"+mileage+" homerecord:"+homeRecord+" awayrecord:"+aRecord);
		totalInfo = "homerating:"+homeRating+"/homerecord:"+homeRecord+"-awayrating:"+awayRating+"/awayrecord:"+aRecord+"-mileage:"+mileage;
		return totalInfo;
	}
	//배팅버튼 클릭시
	@CrossOrigin
	@RequestMapping(value="ANDROID/gettingToGame.do", produces = "text/plain; charset=UTF-8")
	public String bettingToGame(@RequestParam Map map) {
		String betting="no";
		int betmileage = Integer.parseInt(map.get("bettingmileage").toString());
		int mymileage = dao.selectMyMileage(map);
		if(betmileage>mymileage) {
			return "betno";
		}
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		int insert = dao.insertBetting(map);
		if(insert==2) {
			betting="yes";
		}
		return betting;
	}
}
