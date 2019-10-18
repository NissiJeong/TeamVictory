package team.sports.matching.contoller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import team.sports.matching.service.MatchDAO;
import team.sports.matching.service.TeamDTO;


@Controller
public class MatchController {
	@Resource(name="match")
	private MatchDAO dao;
	
	//매칭 페이지로 이동
	@RequestMapping("/Team/Matching/Matching.do")
	public String matching(@RequestParam Map map,Model model) {
		List<TeamDTO> list = dao.selectList(map);
		model.addAttribute("list",list);
		return "member/matching2.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/matching.do",produces = "text/html; charset=UTF-8")
	public String match(@RequestParam Map map) {
		System.out.println("들어옴");
		//map에 내 팀 no 입력해야함 
		String ass= "no";
		int affected = dao.insert(map);
		if(affected==1) {
			ass="신청완료";
		}
		return ass;
	}
}
