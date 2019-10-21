package team.sports.matching.contoller;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.sports.matching.service.BaseBall_HitterDAO;




@Controller
public class BaseBallController {
	
	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
	@RequestMapping("/Team/Matching/InsertHitter.do")
	public String insertHitter(@RequestParam Map map, Model model) {
		
		System.out.println(map.get("hitterInsert")!=null ? "있다" : "없다");
		
		//상대팀 날짜 구장 시간
		//2019-10-17 / 키움-SK / 고척  / 18:30
		//#{baseball_awayteam},#{baseball_gamedate},#{baseball_stadium},#{baseball_time}
		String key = map.get("baseball_key").toString().trim();
		String[] arr = key.split("/");
		
		String baseball_gamedate = arr[0];
		String versus = arr[1];
		String[] arr1 =  versus.split("-");
		String baseball_awayteam = arr1[1].trim();
		String baseball_stadium = arr[2];
		String baseball_time = arr[3];
		
		System.out.println("여기는 ");
		map.put("baseball_gamedate", baseball_gamedate.trim());
		map.put("baseball_awayteam", baseball_awayteam.trim());
		map.put("baseball_stadium", baseball_stadium.trim());
		map.put("baseball_time", baseball_time.trim());
		
		for(Object key2 : map.keySet()) {
			System.out.println(String.format("key : %s  |  value : %s", key2,map.get(key2).toString()));
		}
		
		int affected = hitterDAO.insert(map);
		
		System.out.println("affected:" +affected);
		
		return "member/statistics.tiles";

		}

}

