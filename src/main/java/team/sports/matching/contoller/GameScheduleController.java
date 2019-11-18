package team.sports.matching.contoller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
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
public class GameScheduleController {
	
	@Resource(name="match")
	private MatchDAO dao;
	
	//GameSchedule페이지로 이동
	@RequestMapping("/Team/Matching/gameSchedule.do")
	public String matching(@RequestParam Map map,Model model, Authentication auth) {
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		List<Map> list = dao.selectGameSchedule(map);
		for(int i=0; i<list.size();i++) {
			list.get(i).put("GAMEDATE", list.get(i).get("GAMEDATE").toString().substring(0,10));
			if(list.get(i).get("TIME").toString().length()==3) {
				list.get(i).put("TIME", list.get(i).get("TIME").toString().substring(0,1)+":"+list.get(i).get("TIME").toString().substring(1));
	         }
	         else if(list.get(i).get("TIME").toString().length()==4) {
	        	 list.get(i).put("TIME", list.get(i).get("TIME").toString().substring(0,2)+":"+list.get(i).get("TIME").toString().substring(2));
	         }
			
			for(Object key :list.get(i).keySet()) {
				System.out.print(key +":"+list.get(i).get(key)+" / ");
			}
			System.out.println();
		}
		model.addAttribute("list", list);
		
		//System.out.println("이새캬");
		return "member/GameSchedule.tiles";
	}///////
	//게임 종료 버튼 클릭시 gameStaus='inwaiting'
	@ResponseBody
	@RequestMapping("/Team/Matching/gameFinish.do")
	public String gameFinish(@RequestParam Map map,Authentication auth) {
		map.put("time", map.get("time").toString().split(":")[0]+map.get("time").toString().split(":")[1]);
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String id = userDetails.getUsername();
		map.put("id", id);
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		List<Map> managers = dao.isManager(map);
		String ids = "";
		//버튼을 누른 팀의 팀장 id를 ids에 저장
		for(int i=0;i<managers.size();i++) {
			ids+=managers.get(i).get("MANAGER_ID").toString();
		}
		//System.out.println(ids);
		if(ids.indexOf(id)==-1) {
			return "No";
		}
		int affected = dao.updateGameStatus(map);
		if(affected == 1) {
			dao.updateMileage(map);
		}
		return "Yes";
	}
	
}
