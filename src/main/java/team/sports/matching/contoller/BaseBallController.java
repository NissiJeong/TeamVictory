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




@Controller
public class BaseBallController {
	
	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
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
	
	
	/*
	 * @RequestMapping("/Team/Matching/statostics.do") public String
	 * selectOne(@RequestParam Map map, Model model) {
	 * 
	 * System.out.println("1234566778"); BaseBall_HitterDTO record =
	 * hitterDAO.hitterSelectOne(map); model.addAttribute("record", record);
	 * System.out.println("record:"+record);
	 * 
	 * 
	 * return "member/statistics.tiles";
	 * 
	 * }
	 */
	
	@RequestMapping("/Team/Matching/statostics.do")
	public String selectList(@RequestParam Map map, Model model) {
		List<Map> list = new Vector<Map>();
		//Map<String, List> record = new HashMap<String, List>();
		System.out.println("selectList 호출!!!!!!");
		
		
		List<Map> records = hitterDAO.hitterSelectList(map);
		List<Map> totalRecords = hitterDAO.hitterTotalSelectList(map);
		
		List listAB = new Vector();
		int intAB = 0;
		int sumAB = 0;
		
		List listH = new Vector();
		int intH = 0;
		int sumH = 0;
		
		List listRBI = new Vector();
		int intRBI = 0;
		int sumRBI = 0;
		
		List listHR = new Vector();
		int intHR = 0;
		int sumHR = 0;
		
		List listSB = new Vector();
		int intSB = 0;
		int sumSB = 0;
		
		double oneAVG = 0;
		double totalAVG = 0;
		
		List avg = new Vector();
		List listAVG = new Vector();
		
		for(int i=0;i<totalRecords.size();i++) {
			intAB = Integer.parseInt(totalRecords.get(i).get("AB").toString());
			sumAB += intAB;
			listAB.add(sumAB);
			
			intH = Integer.parseInt(totalRecords.get(i).get("H").toString());
			sumH += intH;
			listH.add(sumH);
			
			intRBI = Integer.parseInt(totalRecords.get(i).get("RBI").toString());
			sumRBI += intRBI;
			listRBI.add(sumRBI);
			
			intHR = Integer.parseInt(totalRecords.get(i).get("HR").toString());
			sumHR += intHR;
			listHR.add(sumHR);
			
			intSB = Integer.parseInt(totalRecords.get(i).get("SB").toString());
			sumSB += intSB;
			listSB.add(sumSB);
			
			oneAVG = (double) intH / intAB;
			oneAVG = Math.ceil(oneAVG * 10000)/10000.0;
			
			totalAVG = (double) sumH / sumAB ;
			totalAVG = Math.ceil(totalAVG * 10000)/10000.0;
			
			avg.add(oneAVG);
			listAVG.add(totalAVG);
		}
		
		for(int i=0; i<records.size();i++) {
			records.get(i).put("totalAB", listAB.get(listAB.size()-i-1));
			records.get(i).put("totalH", listH.get(listH.size()-i-1));
			records.get(i).put("totalRBI", listRBI.get(listRBI.size()-i-1));
			records.get(i).put("totalHR", listHR.get(listHR.size()-i-1));
			records.get(i).put("totalSB", listSB.get(listSB.size()-i-1));
			
			records.get(i).put("AVG", avg.get(avg.size()-i-1));
			records.get(i).put("totalAVG", listAVG.get(listAVG.size()-i-1));
		}
		
		//System.out.println("records:"+records);
		//System.out.println("totalRecords:"+totalRecords);
		
		
		
		model.addAttribute("records", records);
		
		
		
		//record.put("records", records);
		//record.put("totalRecords", totalRecords);
		//list.add(record);
		/*
		for(Map permap : list) {
			List  recordsList = ((List)permap.get("records"));
			for(int i=0; i <recordsList.size(); i++){
				for(Object 	fiveKey   :((Map)recordsList.get(i)).keySet() ) {
			   		System.out.println(String.format("key : %s , value : %s",fiveKey,((Map)recordsList.get(i)).get(fiveKey)));
				}
			}   // 2번for   
		} // 1번 for 
		*/
		//System.out.println(JSONArray.toJSONString(list));
		
		
		return "member/statistics.tiles";

		}
	
	
	@RequestMapping(value="/Team/Matching/downstatostics.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> infiniteScrollDownPOST(@RequestParam Map map) {
		System.out.println("inifiniteScrollDownPost 소환!!!");
		System.out.println("map()에 저장된 RECORDNO:"+map.get("RECORDNO"));
		
		List<Map> downRecords = hitterDAO.scrollDown(map);
		List<Map> downTotalRecords = hitterDAO.hitterDownTotalSelectList(map);
		
		
		List listAB = new Vector();
		int intAB = 0;
		int sumAB = 0;
		
		List listH = new Vector();
		int intH = 0;
		int sumH = 0;
		
		List listRBI = new Vector();
		int intRBI = 0;
		int sumRBI = 0;
		
		List listHR = new Vector();
		int intHR = 0;
		int sumHR = 0;
		
		List listSB = new Vector();
		int intSB = 0;
		int sumSB = 0;
		
		double oneAVG = 0;
		double totalAVG = 0;
		
		List avg = new Vector();
		List listAVG = new Vector();
		
		
		
		
		for(int i=0;i<Integer.parseInt(map.get("RECORDNO").toString()) -1;i++) {
			intAB = Integer.parseInt(downTotalRecords.get(i).get("AB").toString());
			sumAB += intAB;
			listAB.add(sumAB);
			
			intH = Integer.parseInt(downTotalRecords.get(i).get("H").toString());
			sumH += intH;
			listH.add(sumH);
			
			intRBI = Integer.parseInt(downTotalRecords.get(i).get("RBI").toString());
			sumRBI += intRBI;
			listRBI.add(sumRBI);
			
			intHR = Integer.parseInt(downTotalRecords.get(i).get("HR").toString());
			sumHR += intHR;
			listHR.add(sumHR);
			
			intSB = Integer.parseInt(downTotalRecords.get(i).get("SB").toString());
			sumSB += intSB;
			listSB.add(sumSB);
			
			oneAVG = (double) intH / intAB;
			oneAVG = Math.ceil(oneAVG * 10000)/10000.0;
			
			totalAVG = (double) sumH / sumAB ;
			totalAVG = Math.ceil(totalAVG * 10000)/10000.0;
			
			avg.add(oneAVG);
			listAVG.add(totalAVG);
		}
		
		for(int i=0; i<downRecords.size();i++) {
			downRecords.get(i).put("totalAB", listAB.get(listAB.size()-i-1));
			downRecords.get(i).put("totalH", listH.get(listH.size()-i-1));
			downRecords.get(i).put("totalRBI", listRBI.get(listRBI.size()-i-1));
			downRecords.get(i).put("totalHR", listHR.get(listHR.size()-i-1));
			downRecords.get(i).put("totalSB", listSB.get(listSB.size()-i-1));
			
			downRecords.get(i).put("AVG", avg.get(avg.size()-i-1));
			downRecords.get(i).put("totalAVG", listAVG.get(listAVG.size()-i-1));
		}
		
		
		
		
		
		System.out.println("출력할 json형 레코드 : "+JSONArray.toJSONString(downRecords));
		
		
		return downRecords;
	}
	
	
	@RequestMapping(value="/Team/Matching/upstatostics.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> infiniteScrollUpPOST(@RequestParam Map map) {
		System.out.println("inifiniteScrollUpPost 소환!!!");
		System.out.println("map()에 저장된 RECORDNO:"+map.get("RECORDNO"));
		
		List<Map> upRecords = hitterDAO.scrollUp(map);
		List<Map> upTotalRecords = hitterDAO.hitterUpTotalSelectList(map);
		
		
		
		
		
		List listAB = new Vector();
		int intAB = 0;
		int sumAB = 0;
		
		List listH = new Vector();
		int intH = 0;
		int sumH = 0;
		
		List listRBI = new Vector();
		int intRBI = 0;
		int sumRBI = 0;
		
		List listHR = new Vector();
		int intHR = 0;
		int sumHR = 0;
		
		List listSB = new Vector();
		int intSB = 0;
		int sumSB = 0;
		
		double oneAVG = 0;
		double totalAVG = 0;
		
		List avg = new Vector();
		List listAVG = new Vector();
		
		for(int i=0;i<Integer.parseInt(map.get("RECORDNO").toString())+5;i++) {
			intAB = Integer.parseInt(upTotalRecords.get(i).get("AB").toString());
			sumAB += intAB;
			listAB.add(sumAB);
			
			intH = Integer.parseInt(upTotalRecords.get(i).get("H").toString());
			sumH += intH;
			listH.add(sumH);
			
			intRBI = Integer.parseInt(upTotalRecords.get(i).get("RBI").toString());
			sumRBI += intRBI;
			listRBI.add(sumRBI);
			
			intHR = Integer.parseInt(upTotalRecords.get(i).get("HR").toString());
			sumHR += intHR;
			listHR.add(sumHR);
			
			intSB = Integer.parseInt(upTotalRecords.get(i).get("SB").toString());
			sumSB += intSB;
			listSB.add(sumSB);
			
			oneAVG = (double) intH / intAB;
			oneAVG = Math.ceil(oneAVG * 10000)/10000.0;
			
			totalAVG = (double) sumH / sumAB ;
			totalAVG = Math.ceil(totalAVG * 10000)/10000.0;
			
			avg.add(oneAVG);
			listAVG.add(totalAVG);
		}
		
		for(int i=0; i<upRecords.size();i++) {
			upRecords.get(i).put("totalAB", listAB.get(listAB.size()-i-1));
			upRecords.get(i).put("totalH", listH.get(listH.size()-i-1));
			upRecords.get(i).put("totalRBI", listRBI.get(listRBI.size()-i-1));
			upRecords.get(i).put("totalHR", listHR.get(listHR.size()-i-1));
			upRecords.get(i).put("totalSB", listSB.get(listSB.size()-i-1));
			
			upRecords.get(i).put("AVG", avg.get(avg.size()-i-1));
			upRecords.get(i).put("totalAVG", listAVG.get(listAVG.size()-i-1));
		}
		
		
		
		System.out.println("출력할 json형 레코드 : "+JSONArray.toJSONString(upRecords));
		
		
		
		return upRecords;
	}
	
	

}

