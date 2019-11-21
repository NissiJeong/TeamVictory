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

import team.sports.matching.service.AndroidDAO;
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
			System.out.println(key+":"+map.get(key));
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
			System.out.println(key+":"+map.get(key)+" / ");
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
			System.out.println(key+":"+map.get(key)+" / ");
		}
		List<GameDTO> gameList = dao.selectGameList233(map);
		for(int i=0;i<gameList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			gameList.get(i).setGamedate(gameList.get(i).getGamedate().substring(0,11).trim());
		}
		return gameList;
	}
}
