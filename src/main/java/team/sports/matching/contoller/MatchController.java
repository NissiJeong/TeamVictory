package team.sports.matching.contoller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import team.sports.matching.service.MatchDAO;
import team.sports.matching.service.BaseTeamDTO;

@SessionAttributes("id")
@Controller
public class MatchController {
	@Resource(name="match")
	private MatchDAO dao;
	
	//매칭 페이지로 이동
	@RequestMapping("/Team/Matching/Matching.do")
	public String matching(@RequestParam Map map,Model model,@ModelAttribute("id") String id) {
		map.put("id", id);
		List<BaseTeamDTO> list = dao.selectList(map);
		
		model.addAttribute("list",list);
		return "member/matching2.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/matching.do",produces = "text/html; charset=UTF-8")
	public String match(@RequestParam Map map,@ModelAttribute("id") String id) {
		map.put("id", id);
		System.out.println("들어옴");
		//map에 내 팀 no 입력해야함 
		String ass= "no";
		int affected = dao.insert(map);
		if(affected==1) {
			ass="신청완료";
		}
		return ass;
	}
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/modal.do",produces = "text/html; charset=UTF-8")
	public String upModal(@RequestParam Map map,Model model,@ModelAttribute("id") String id) {
		JSONObject json = new JSONObject();
		map.put("id", id);
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key).toString());
		}
		BaseTeamDTO dto = new BaseTeamDTO();
		dto = dao.selectOne(map);
		json.put("teamName", dto.getTeamName());
		json.put("teamRating", dto.getTeamRating());
		json.put("category", dto.getCategory());
		System.out.println(dto.getTeamName()+"받아온 팀 이름");
		System.out.println("json.toJSONString():"+json.toJSONString());
		return json.toJSONString();
	}
}
