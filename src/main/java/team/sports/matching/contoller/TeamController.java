package team.sports.matching.contoller;

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
import team.sports.matching.service.BaseTeamDTO;

@SessionAttributes("id")
@Controller
public class TeamController {
	@Resource(name="member")
	private MemberDAO dao;
	
	//팀 만들기 페이지로 이동
	@RequestMapping("/Team/Matching/createTeam.do")
	public String toCreateTeam() {
		
		return "member/CreateTeam.tiles";
	}
	//로그인 하지 않은 상태에서 게시판 url요청시]
		@ExceptionHandler(HttpSessionRequiredException.class)
		public String notAllowed(Model model) {
			//에러 메세지 저장]
			model.addAttribute("NotMember", "로그인 후 이용하세요");
			//무조건 로그인 페이지
			return "/login/Login.tiles";
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
	public String team(@ModelAttribute("id") String id,Model model) {
		List<Map> list = new Vector<Map>();
		list = dao.selectTeamName(id);
		List<String> teams = new Vector<String>();
		for(Map team : list) {
			teams.add(team.get("TEAMNAME").toString());
		}
		model.addAttribute("teams", teams);
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
