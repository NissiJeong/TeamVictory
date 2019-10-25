package team.sports.matching.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
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

import team.sports.matching.service.MatchDAO;
import team.sports.matching.service.MemberDAO;
import team.sports.matching.service.TeamBoardDAO;
import team.sports.matching.service.TeamBoardDTO;
import team.sports.matching.service.BaseTeamDTO;

@SessionAttributes("id")
@Controller
public class TeamController {
	@Resource(name="member")
	private MemberDAO dao;
	@Resource(name="teamboard")
	private TeamBoardDAO teamDao;
	
	//팀 만들기 페이지로 이동
	@RequestMapping("/Team/Matching/createTeam.do")
	public String toCreateTeam() {
		
		return "member/CreateTeam.tiles";
	}
	//로그인 하지 않은 상태에서 게시판 url요청시]
	@ExceptionHandler(HttpSessionRequiredException.class)
	public String isNotMember(Model model) {
		model.addAttribute("NotMember", "로그인 후 이용하세요");
		//로그인이 안된 경우 로그인 페이지로
		return "member/login.tiles";
	}
	//팀 만들기 
	@RequestMapping("/Team/matching/teamJoin.do")
	public String createTeam(@RequestParam Map map,Model model,@ModelAttribute("id") String id) {
		System.out.println(map.get("teamInfo"));
		System.out.println("id:"+id);
		map.put("id", id);
		int affected = dao.teamInsert(map);
		if(affected==1) {
			int confirm = dao.insertTeamMember(map);
			if(confirm==0) {
				dao.deleteTeam(map);
				affected = 0;
			}			
		}		
		model.addAttribute("SUCFAIL", affected);
		return "member/Message";
	}///
	
	//팀페이지로 이동
	@RequestMapping("/Team/Matching/Team.do")
	public String team(@ModelAttribute("id") String id,Model model, Model model2, Model model3, Model model4, Model model5, Model model6, @RequestParam Map map, @RequestParam Map map2, @RequestParam Map map3, @RequestParam Map map4, @RequestParam Map map5, @RequestParam Map map6) {
		List<Map> list = new Vector<Map>();
		list = dao.selectTeamName(id);
		List<String> teams = new Vector<String>();
		for(Map team : list) {
			teams.add(team.get("TEAMNAME").toString());
		}
		model.addAttribute("teams", teams);
		
		//선수목록 보내기
		map2.put("id", id);
		List<TeamBoardDTO> list2 = teamDao.selectList(map2);
		model2.addAttribute("list2",list2);
		
		//최다득점 목록
		map3.put("id", id);
		List<TeamBoardDTO> list3 = teamDao.bestrbiPlayer(map3);
		model3.addAttribute("list3",list3);
		
		//최다삼진 목록
		map4.put("id", id);
		List<TeamBoardDTO> list4 = teamDao.bestsoPlayer(map4);
		model4.addAttribute("list4",list4);
		
		//최다삼진 목록
		map5.put("id", id);
		List<TeamBoardDTO> list5 = teamDao.besthrPlayer(map5);
		model5.addAttribute("list5",list5);
		
		//최다도루 목록
		map6.put("id", id);
		List<TeamBoardDTO> list6 = teamDao.bestsbPlayer(map6);
		model6.addAttribute("list6",list6);
		
		return "member/team.tiles";
	}
		
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/teamSelect.do",produces = "text/html; charset=UTF-8")
	public String match(@RequestParam Map map,@ModelAttribute("id") String id) {
		map.put("id", id);
		System.out.println(map.get("teamName"));
		System.out.println("들어옴");
		dao.selectTeam(map);
		//map에 내 팀 no 입력해야함 
		String ass= "no";	
		return ass;
	}


}
