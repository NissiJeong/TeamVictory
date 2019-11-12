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

import com.oreilly.servlet.MultipartRequest;

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
	public String teamList(@ModelAttribute("teamName") String teamName, @RequestParam Map map, Model model) {
		System.out.println("들어오냐..?");
		System.out.println("teamName"+teamName);
		map.put("teamName",teamName);
		List<Map> totalList = teamDao.memberSelect();
		
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
		
		return "member/searchTeam.tiles";
	}
	
	//로그인 하지 않은 상태에서 게시판 url요청시]
	/*@ExceptionHandler(HttpSessionRequiredException.class)
	public String isNotMember(Model model) {
		model.addAttribute("NotMember", "로그인 후 이용하세요");
		//로그인이 안된 경우 로그인 페이지로
		return "member/login.tiles";
	}*/
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
		
		//선수목록 보내기
		map.put("id", id);
		List<TeamBoardDTO> list2 = teamDao.selectList(map);
		model.addAttribute("list2",list2);
		
		//최다득점 목록
		map.put("id", id);
		List<TeamBoardDTO> list3 = teamDao.bestrbiPlayer(map);
		model.addAttribute("list3",list3);
		
		//최다삼진 목록
		map.put("id", id);
		List<TeamBoardDTO> list4 = teamDao.bestsoPlayer(map);
		model.addAttribute("list4",list4);
		
		//최다삼진 목록
		map.put("id", id);
		List<TeamBoardDTO> list5 = teamDao.besthrPlayer(map);
		model.addAttribute("list5",list5);
		
		//최다도루 목록
		map.put("id", id);
		List<TeamBoardDTO> list6 = teamDao.bestsbPlayer(map);
		model.addAttribute("list6",list6);
		
		//경기일정
		map.put("id", id);
		List<TeamBoardDTO> list7 = teamDao.gameSchedule(map);
		model.addAttribute("list7",list7);
		
		//팀소개
		map.put("id",id);
		List<TeamBoardDTO> list8 = teamDao.teamInfo(map);
		model.addAttribute("list8",list8);
		
		//투수랭킹
		map.put("id",id);
		List<PitcherDTO> list9 = teamDao.pitcherRank(map);
		model.addAttribute("pitcherrank",list9);
		
		//타자랭킹
		map.put("id",id);
		List<HitterDTO> list10 = teamDao.hitterRank(map);
		model.addAttribute("hitterrank",list10);
		
		//팀기네스-최다득점
		map.put("id",id);
		List<TeamBoardDTO> list11 = teamDao.teamGuinnessScore(map);
		model.addAttribute("teamguinnessscore",list11);
		
		//팀기네스-최다홈런
		map.put("id",id);
		List<TeamBoardDTO> list12 = teamDao.teamGuinnessHomeRun(map);
		model.addAttribute("teamguinnesshomerun",list12);

		//팀기네스-최다안타
		map.put("id",id);
		List<TeamBoardDTO> list13 = teamDao.teamGuinnessHit(map);
		model.addAttribute("teamguinnesshit",list13);

		//팀기네스-최다삼진
		map.put("id",id);
		List<TeamBoardDTO> list14 = teamDao.teamGuinnessStrikeOut(map);
		model.addAttribute("teamguinnessstrikeout",list14);
				
		return "member/team.tiles";
	}
	
	//팀 바꾸기 ajax
	@ResponseBody
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
	}
}