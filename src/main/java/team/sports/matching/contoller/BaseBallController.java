package team.sports.matching.contoller;


import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.sports.matching.service.BaseBall_HitterDAO;


@Controller
public class BaseBallController {
	
	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
	
	@RequestMapping("/Team/Matching/statostics.do")
	public String selectList(@RequestParam Map map, Model model, Authentication auth) {
		System.out.println("selectList 호출!!!!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		System.out.println("userDetails 잘 찍히나 확인 : "+userDetails.getUsername().toString());
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> records = hitterDAO.hitterSelectList(map);
		List<Map> teamName = hitterDAO.hitterDetailViewForTeamName(map);
		List<Map> teamName2 = hitterDAO.pitcherDetailViewForTeamName(map);
		List<Map> getProfile = hitterDAO.getProfile(map);
		
		for(int i=0;i<teamName.size();i++) {
			System.out.print(teamName.get(i).get("TEAMNAMEFORMODAL").toString());
		}
		System.out.println();
				
		for(int i=0; i<records.size();i++) {
			
			String[] tempDate = records.get(i).get("GAMEDATE").toString().split(" ");
			records.get(i).put("GAMEDATE",tempDate[0]);
			
			double avg= Math.ceil((Double.parseDouble(records.get(i).get("H").toString()))/(Double.parseDouble(records.get(i).get("AB").toString())) * 10000)/10000.0;
			records.get(i).put("AVG", avg);
			
			double sumavg= Math.ceil((Double.parseDouble(records.get(i).get("SUMH").toString()))/(Double.parseDouble(records.get(i).get("SUMAB").toString())) * 10000)/10000.0;
			records.get(i).put("SUMAVG", sumavg);
			
			System.out.println(records.get(i).get("TBF")==null ? records.get(i).get("RECORDNO").toString() +"번째 투수기록이 존재하지 않음"  : records.get(i).get("RECORDNO").toString() +"번째 투수기록이 존재함");
		}
		
		System.out.println(getProfile.size()!=0 ? "사진 가져와짐 : "+getProfile.get(0).toString() : "사진 소환 실패");
		model.addAttribute("records", records);
		model.addAttribute("TEAMNAMES", teamName);
		model.addAttribute("PTEAMNAMES", teamName2);
		model.addAttribute("profile", getProfile);
		
		return "member/statistics.tiles";

		}
	
	
	
	
	
	@RequestMapping(value="/Team/Matching/downstatostics.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> infiniteScrollDownPOST(@RequestParam Map map, Authentication auth) {
		System.out.println("inifiniteScrollDownPost 소환!!!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		System.out.println("userDetails 잘 찍히나 확인 : "+userDetails.getUsername().toString());
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> downRecords = hitterDAO.scrollDown(map);
		
		for(int i=0; i<downRecords.size();i++) {
			String[] tempDate = downRecords.get(i).get("GAMEDATE").toString().split(" ");
			downRecords.get(i).put("GAMEDATE",tempDate[0]);
			
			double avg= Math.ceil((Double.parseDouble(downRecords.get(i).get("H").toString()))/(Double.parseDouble(downRecords.get(i).get("AB").toString())) * 10000)/10000.0;
			downRecords.get(i).put("AVG", avg);
			
			double sumavg= Math.ceil((Double.parseDouble(downRecords.get(i).get("SUMH").toString()))/(Double.parseDouble(downRecords.get(i).get("SUMAB").toString())) * 10000)/10000.0;
			downRecords.get(i).put("SUMAVG", sumavg);
		}
		
		return downRecords;
	}
	
	
	
	
	@RequestMapping(value="/Team/Matching/hitterDetailView.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> hitterDetailView(@RequestParam Map map, Authentication auth) {
		System.out.println("hitterDetailView 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		System.out.println("userDetails 잘 찍히나 확인 : "+userDetails.getUsername().toString());
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.hitterDetailView(map);
		
		return details;
	}
	
	@RequestMapping(value="/Team/Matching/pitcherDetailView.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> pitcherDetailView(@RequestParam Map map, Authentication auth) {
		System.out.println("pitcherDetailView 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		System.out.println("userDetails 잘 찍히나 확인 : "+userDetails.getUsername().toString());
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.pitcherDetailView(map);
		
		return details;
	}
	
	
	@RequestMapping(value="/Team/Matching/hitterDetailViewEachTeam.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> hitterDetailViewEachTeam(@RequestParam Map map, Authentication auth ) {
		System.out.println("hitterDetailViewEachTeam 소환!!!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		
		System.out.println("USER_TEAMNAME 잘 나오니?? "+  map.get("USER_TEAMNAME").toString());
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.hitterDetailViewEachTeam(map);
		
		return details;
	}
	
	@RequestMapping(value="/Team/Matching/pitcherDetailViewEachTeam.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> pitcherDetailViewEachTeam(@RequestParam Map map, Authentication auth ) {
		System.out.println("pitcherDetailViewEachTeam 소환!!!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		
		System.out.println("USER_TEAMNAME 잘 나오니?? "+  map.get("USER_TEAMNAME").toString());
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.pitcherDetailViewEachTeam(map);
		
		return details;
	}
	
}

