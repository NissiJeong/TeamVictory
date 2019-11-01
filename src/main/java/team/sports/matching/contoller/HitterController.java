package team.sports.matching.contoller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import jdk.nashorn.internal.runtime.JSONListAdapter;
import team.sports.matching.service.BaseBall_HitterDAO;
import team.sports.printdb.baseball.BaseBall_HitterDTO;
import team.sports.printdb.baseball.HitterDAO;



/**
@Controller
public class HitterController {
	
	@Resource(name="Hitter")
	private HitterDAO hitterDAO;
	
	@RequestMapping("/Team/Matching/InsertHitter.do")
	public String insertHitter(@RequestParam Map map, Model model) {
		
		//상대팀 날짜 구장 시간
		//2019-10-17 / 키움-SK / 고척  / 1830
		//#{baseball_awayteam},#{baseball_gamedate},#{baseball_stadium},#{baseball_time}
		String key = map.get("baseball_key").toString().trim();
		String[] arr = key.split("/");
		
		String baseball_gamedate = arr[0];
		String versus = arr[1];
		String[] arr1 =  versus.split("-");
		String baseball_awayteam = arr1[1].trim();
		String baseball_stadium = arr[2];
		String baseball_time = arr[3];
		
		map.put("baseball_gamedate", baseball_gamedate.trim());
		map.put("baseball_awayteam", baseball_awayteam.trim());
		map.put("baseball_stadium", baseball_stadium.trim());
		map.put("baseball_time", baseball_time.trim());
		
		for(Object key2 : map.keySet()) {
			System.out.println(String.format("key : %s  |  value : %s", key2,map.get(key2).toString()));
		}
		
		int affected = hitterDAO.insert(map);
		
		System.out.println("affected:" +affected);
		
		return "forward:/Team/Matching/statostics.do";

		}
	
	
	
	
	
	@RequestMapping("/Team/Matching/statostics.do")
	public String selectList(@RequestParam Map map, Model model) {
		List<Map> list = new Vector<Map>();
		//Map<String, List> record = new HashMap<String, List>();
		System.out.println("selectList 호출!!!!!!");
		
		
		List<Map> records = hitterDAO.hitterSelectList(map);
		
		
		model.addAttribute("records", records);
		
		
		return "member/statistics.tiles";

		}
	
	
	@RequestMapping(value="/Team/Matching/downstatostics.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> infiniteScrollDownPOST(@RequestParam Map map) {
		System.out.println("inifiniteScrollDownPost 소환!!!");
		
		List<Map> downRecords = hitterDAO.scrollDown(map);
		
		System.out.println("출력할 json형 레코드 : "+JSONArray.toJSONString(downRecords));
		
		return downRecords;
	}
	
	
}

**/

