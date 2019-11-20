package team.sports.matching.contoller;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.sports.matching.service.AndroidDAO;
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
			System.out.println(key+":"+map.get(key)+"  /  ");
		}
		//List<TeamDTO> teams = new Vector<TeamDTO>();
		//teams = dao.selectTeam(map);
		return "12312";
	}
	
}
