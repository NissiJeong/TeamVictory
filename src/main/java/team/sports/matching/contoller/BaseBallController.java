
package team.sports.matching.contoller;


import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
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
import team.sports.printdb.baseball.HitterDTO;


@Controller
public class BaseBallController {
	
	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
	
	
	@RequestMapping("/Team/Matching/InsertHitterByPARSING") 
	public String insertHitterByPARSING(@RequestParam Map map, Model model) throws IOException {
	
		
		// 크롤링할 주소
		String URL = "http://www.statiz.co.kr/boxscore.php?date=2018-10-12&stadium=%EC%9E%A0%EC%8B%A4&hour=18&opt=4";
		Document doc = Jsoup.connect(URL).get();

		Elements elem = doc.select("section.content div div:nth-child(2) div:nth-child(1) div div div.box-body.no-padding.table-responsive table tbody tr");
		
		for(int i=1; i<elem.size() -1;i++) {
		 	
			if( !((elem.get(i).child(0).text().trim()).isEmpty() )) { 
				
				int pa = Integer.parseInt(elem.get(i).child(3).text());
    			int ab = Integer.parseInt(elem.get(i).child(4).text());
    			int r = Integer.parseInt(elem.get(i).child(5).text());
    			int h = Integer.parseInt(elem.get(i).child(6).text());
    			int hr = Integer.parseInt(elem.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem.get(i).child(8).text());
    			int bb = Integer.parseInt(elem.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem.get(i).child(10).text());
    			int so = Integer.parseInt(elem.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem.get(i).child(12).text());
    			
    			//#{GETPARSINGQUERY }
    			//#{ID},#{PA},#{AB},#{R},#{H},#{HR},#{RBI},#{BB},#{HBP},#{SO},#{GDP}
    			
    			String id;
    			id = "KIM10"+i;
    			
    			map.put("ID", id);
    			map.put("PA", pa);
    			map.put("AB", ab);
    			map.put("R", r);
    			map.put("H", h);
    			map.put("HR", hr);
    			map.put("RBI", rbi);
    			map.put("BB", bb);
    			map.put("HBP", hbp);
    			map.put("SO", so);
    			map.put("GDP", gdp);
    			
    			hitterDAO.insertByPars(map);
    			
            }
		
        	else {
        		
        		int pa = Integer.parseInt(elem.get(i).child(3).text());
    			int ab = Integer.parseInt(elem.get(i).child(4).text());
    			int r = Integer.parseInt(elem.get(i).child(5).text());
    			int h = Integer.parseInt(elem.get(i).child(6).text());
    			int hr = Integer.parseInt(elem.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem.get(i).child(8).text());
    			int bb = Integer.parseInt(elem.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem.get(i).child(10).text());
    			int so = Integer.parseInt(elem.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem.get(i).child(12).text());
    			
    			String id;
    			id = "KIM10"+i;
    			
    			map.put("ID", id);
    			map.put("PA", pa);
    			map.put("AB", ab);
    			map.put("R", r);
    			map.put("H", h);
    			map.put("HR", hr);
    			map.put("RBI", rbi);
    			map.put("BB", bb);
    			map.put("HBP", hbp);
    			map.put("SO", so);
    			map.put("GDP", gdp);
    			
    			hitterDAO.insertByPars(map);
    	
            }
        }
		
		System.out.println("파싱 완료");
		return "member/statistics.tiles";

	}
	
	
	
	
	
	@RequestMapping("/Team/Matching/InsertHitter.do")
	public String insertHitter(@RequestParam Map map, Model model) {
		
		System.out.println(map.get("hitterInsert")!=null ? "있다" : "없다");
		
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
		
		return downRecords;
	}
	
	
	@RequestMapping(value="/Team/Matching/upstatostics.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> infiniteScrollUpPOST(@RequestParam Map map) {
		System.out.println("inifiniteScrollUpPost 소환!!!");
		
		List<Map> upRecords = hitterDAO.scrollUp(map);
	
		return upRecords;
	}
	
	

}

