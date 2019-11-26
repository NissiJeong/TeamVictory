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
import team.sports.matching.service.CommonUtils;

@Controller
public class BaseBallController {
	
	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
	@RequestMapping("/Team/Matching/statostics.do")
	public String selectList(@RequestParam Map map, Model model, Authentication auth) {
		System.out.println("selectList 호출!!!!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		
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
			
			records.get(i).put("GAMEDATE",records.get(i).get("GAMEDATE").toString().substring(0,10).trim());
			
			if(records.get(i).get("TBF")!=null) {
				int ci = Integer.parseInt(records.get(i).get("CI").toString());
				int co = Integer.parseInt(records.get(i).get("CO").toString());
				int per = Integer.parseInt(records.get(i).get("PER").toString());
				int sumci = Integer.parseInt(records.get(i).get("SUMCI").toString());
				int sumco = Integer.parseInt(records.get(i).get("SUMCO").toString());
				int sumper = Integer.parseInt(records.get(i).get("SUMPER").toString());
				
				String ip = CommonUtils.getInningString(ci, co);
				records.get(i).put("IP",CommonUtils.getInningString(ci, co));
				
				String sumip = CommonUtils.getInningString(ci, co);
				records.get(i).put("SUMIP",CommonUtils.getInningString(sumci, sumco));
				
				double era = per*9/CommonUtils.getInningDouble(ci, co);
				records.get(i).put("ERA", String.format("%.2f", era));
				
				double sumera = sumper*9/CommonUtils.getInningDouble(sumci, sumco);
				records.get(i).put("SUMERA", String.format("%.2f", sumera));
				
			}
			
			
			int h = Integer.parseInt(records.get(i).get("H").toString()); 
			int ab = Integer.parseInt(records.get(i).get("AB").toString());
			int sumh = Integer.parseInt(records.get(i).get("SUMH").toString()); 
			int sumab = Integer.parseInt(records.get(i).get("SUMAB").toString());
			
			////String.format("%.2f", );
			double avg = (double)h/ab;
			records.get(i).put("AVG", String.format("%.3f", avg));
			double sumavg = (double)sumh/sumab;
			records.get(i).put("SUMAVG", String.format("%.3f", sumavg));
			
			
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
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> downRecords = hitterDAO.scrollDown(map);
		
		for(int i=0; i<downRecords.size();i++) {
			
			downRecords.get(i).put("GAMEDATE",downRecords.get(i).get("GAMEDATE").toString().substring(0,10).trim());
			
			if(downRecords.get(i).get("TBF")!=null) {
				int ci = Integer.parseInt(downRecords.get(i).get("CI").toString());
				int co = Integer.parseInt(downRecords.get(i).get("CO").toString());
				int per = Integer.parseInt(downRecords.get(i).get("PER").toString());
				int sumci = Integer.parseInt(downRecords.get(i).get("SUMCI").toString());
				int sumco = Integer.parseInt(downRecords.get(i).get("SUMCO").toString());
				int sumper = Integer.parseInt(downRecords.get(i).get("SUMPER").toString());
				
				String ip = CommonUtils.getInningString(ci, co);
				downRecords.get(i).put("IP",CommonUtils.getInningString(ci, co));
				
				String sumip = CommonUtils.getInningString(ci, co);
				downRecords.get(i).put("SUMIP",CommonUtils.getInningString(sumci, sumco));
				
				double era = per*9/CommonUtils.getInningDouble(ci, co);
				downRecords.get(i).put("ERA", String.format("%.2f", era));
				
				double sumera = sumper*9/CommonUtils.getInningDouble(sumci, sumco);
				downRecords.get(i).put("SUMERA", String.format("%.2f", sumera));
				
				System.out.println(downRecords.get(i).get("TBF")==null ? downRecords.get(i).get("RECORDNO").toString() +"번째 투수기록이 존재하지 않음"  : downRecords.get(i).get("RECORDNO").toString() +"번째 투수기록이 존재함");
			}
			
			int h = Integer.parseInt(downRecords.get(i).get("H").toString()); 
			int ab = Integer.parseInt(downRecords.get(i).get("AB").toString());
			int sumh = Integer.parseInt(downRecords.get(i).get("SUMH").toString()); 
			int sumab = Integer.parseInt(downRecords.get(i).get("SUMAB").toString());
			
			////String.format("%.2f", );
			double avg = (double)h/ab;
			downRecords.get(i).put("AVG", String.format("%.3f", avg));
			double sumavg = (double)sumh/sumab;
			downRecords.get(i).put("SUMAVG", String.format("%.3f", sumavg));
			
			
		}
		
		return downRecords;
	}
	
	
	@RequestMapping(value="/Team/Matching/hitterDetailView.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> hitterDetailView(@RequestParam Map map, Authentication auth) {
		System.out.println("hitterDetailView 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.hitterDetailView(map);
		
		details.get(0).put("COUNT", hitterDAO.hitterCount(map).get(0).get("COUNT").toString());

		for(int i=0;i<details.size();i++) {
			
			int pa = Integer.parseInt(details.get(i).get("SUMPA").toString());
			int ab = Integer.parseInt(details.get(i).get("SUMAB").toString());
			int h = Integer.parseInt(details.get(i).get("SUMH").toString());
			int b2 = Integer.parseInt(details.get(i).get("SUMB2").toString());
			int b3 = Integer.parseInt(details.get(i).get("SUMB3").toString());
			int hr = Integer.parseInt(details.get(i).get("SUMHR").toString());
			int k = Integer.parseInt(details.get(i).get("SUMSO").toString());
			int bb = Integer.parseInt(details.get(i).get("SUMBB").toString());
			int hbp = Integer.parseInt(details.get(i).get("SUMHBP").toString());
			
			details.get(i).put("RUTA", (h-b2-b3-hr)*1+b2*2+b3*3+hr*4);
			//String.format("%.2f", xxx)
			
			double kper = (double)k/pa * 100;
			details.get(i).put("KPER", String.format("%.2f", kper) + " %");
			double bbkper = (double)bb/k;
			details.get(i).put("BBKPER", String.format("%.3f", bbkper));
			double ta = (double)h/ab;
			details.get(i).put("TA", String.format("%.3f", ta));
			double chul = ((double)h+bb+hbp)/pa;
			details.get(i).put("CHUL", String.format("%.3f", chul));
			double jang = (((double)h-b2-b3-hr)*1 + b2*2 + b3*3 + hr*4 )/ab ;
			details.get(i).put("JANG", String.format("%.3f", jang));
			double ops = chul+jang;
			details.get(i).put("OPS", String.format("%.3f", ops));
			//wOBA = (0.72*NIBB + 0.75*HBP + 0.90*1B + 0.92*RBOE + 1.24*2B + 1.56*3B + 1.95*HR) / (PA - IBB)
			double woba = (0.72*(double)bb +0.75*hbp+0.90*(h-b2-b3-hr)+1.24*b2+1.56*b3+1.95*hr) / pa;
			details.get(i).put("WOBA", String.format("%.3f", woba));
			
		}
		
		return details;
	}
	
	
	@RequestMapping(value="/Team/Matching/pitcherDetailView.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> pitcherDetailView(@RequestParam Map map, Authentication auth) {
		System.out.println("pitcherDetailView 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		List<Map> details = hitterDAO.pitcherDetailView(map);
		
		details.get(0).put("COUNT", hitterDAO.pitcherCount(map).get(0).get("COUNT").toString());
		
		for(int i=0;i<details.size();i++) {
			int w = Integer.parseInt(details.get(i).get("SUMW").toString());
			int l = Integer.parseInt(details.get(i).get("SUML").toString());
			int ci = Integer.parseInt(details.get(i).get("SUMCI").toString());
			int co = Integer.parseInt(details.get(i).get("SUMCO").toString());
			int h = Integer.parseInt(details.get(i).get("SUMPH").toString());
			int hr = Integer.parseInt(details.get(i).get("SUMPHR").toString());
			
			int k = Integer.parseInt(details.get(i).get("SUMPSO").toString());
			int bb = Integer.parseInt(details.get(i).get("SUMPBB").toString());
			int hbp = Integer.parseInt(details.get(i).get("SUMPHBP").toString());
			int per = Integer.parseInt(details.get(i).get("SUMPER").toString());
			//String.format("%.2f", );
			details.get(i).put("IP", CommonUtils.getInningString(ci, co));
			
			double era = (double)per*9/CommonUtils.getInningDouble(ci, co);
			details.get(i).put("ERA", String.format("%.2f", era));
			
			double winRate = (double)w/(w+l) * 100;
			details.get(i).put("WINRATE", String.format("%.1f", winRate) + " %");
			double k9 = k*9/CommonUtils.getInningDouble(ci, co);
			details.get(i).put("K9", String.format("%.2f", k9));
			double bb9 = (double)bb*9/CommonUtils.getInningDouble(ci, co);
			details.get(i).put("BB9", String.format("%.2f", bb9));
			
			double kbb = (double)k/bb;
			details.get(i).put("KBB", String.format("%.2f", kbb));
			
			double whip = ((double)h+bb+hbp)/CommonUtils.getInningDouble(ci, co);
			details.get(i).put("WHIP", String.format("%.2f", whip));
			
			double fip = ((-2*(double)k+3*(bb+hbp)+13*hr)/CommonUtils.getInningDouble(ci, co))+3.0;
			details.get(i).put("FIP", String.format("%.2f", fip));

		
		}
		
		return details;
	}
	
	
	@RequestMapping(value="/Team/Matching/hitterDetailViewEachTeam.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> hitterDetailViewEachTeam(@RequestParam Map map, Authentication auth ) {
		System.out.println("hitterDetailViewEachTeam 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		List<Map> details = hitterDAO.hitterDetailViewEachTeam(map);
		
		if(details.get(0)!=null) {
		
			for(int i=0;i<details.size();i++) {
				
				details.get(0).put("COUNT", hitterDAO.hitterCountTeam(map).get(0).get("COUNT").toString());

				int pa = Integer.parseInt(details.get(i).get("SUMPA").toString());
				int ab = Integer.parseInt(details.get(i).get("SUMAB").toString());
				int h = Integer.parseInt(details.get(i).get("SUMH").toString());
				int b2 = Integer.parseInt(details.get(i).get("SUMB2").toString());
				int b3 = Integer.parseInt(details.get(i).get("SUMB3").toString());
				int hr = Integer.parseInt(details.get(i).get("SUMHR").toString());
				int k = Integer.parseInt(details.get(i).get("SUMSO").toString());
				int bb = Integer.parseInt(details.get(i).get("SUMBB").toString());
				int hbp = Integer.parseInt(details.get(i).get("SUMHBP").toString());
				
				details.get(i).put("RUTA", (h-b2-b3-hr)*1+b2*2+b3*3+hr*4);
				
				
				double kper = (double)k/pa * 100;
				details.get(i).put("KPER", String.format("%.2f", kper) + " %");
				double bbkper = (double)bb/k * 100;
				details.get(i).put("BBKPER", String.format("%.2f", bbkper) + " %");
				double ta = (double)h/ab;
				details.get(i).put("TA", String.format("%.3f", ta));
				double chul = ((double)h+bb+hbp)/pa;
				details.get(i).put("CHUL", String.format("%.3f", chul));
				double jang = (((double)h-b2-b3-hr)*1 +b2*2 +b3*3 + hr*4 )/ab ;				
				details.get(i).put("JANG", String.format("%.3f", jang));
				double ops = chul+jang;
				details.get(i).put("OPS", String.format("%.2f", ops));
				//wOBA = (0.72*NIBB + 0.75*HBP + 0.90*1B + 0.92*RBOE + 1.24*2B + 1.56*3B + 1.95*HR) / (PA - IBB)
				double woba = (0.72*(double)bb +0.75*hbp+0.90*(h-b2-b3-hr)+1.24*b2+1.56*b3+1.95*hr) / pa;
				details.get(i).put("WOBA", String.format("%.3f", woba));
			
			
			}
		}
		else {
			details.clear();
		}
		
		return details;
	}
	
	@RequestMapping(value="/Team/Matching/pitcherDetailViewEachTeam.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> pitcherDetailViewEachTeam(@RequestParam Map map, Authentication auth ) {
		System.out.println("pitcherDetailViewEachTeam 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.pitcherDetailViewEachTeam(map);
		
		if(details.get(0)!=null) {
			
			details.get(0).put("COUNT", hitterDAO.pitcherCountTeam(map).get(0).get("COUNT").toString());

			
			for(int i=0;i<details.size();i++) {
				int w = Integer.parseInt(details.get(i).get("SUMW").toString());
				int l = Integer.parseInt(details.get(i).get("SUML").toString());
				int ci = Integer.parseInt(details.get(i).get("SUMCI").toString());
				int co = Integer.parseInt(details.get(i).get("SUMCO").toString());
				int h = Integer.parseInt(details.get(i).get("SUMPH").toString());
				int hr = Integer.parseInt(details.get(i).get("SUMPHR").toString());
				int k = Integer.parseInt(details.get(i).get("SUMPSO").toString());
				int bb = Integer.parseInt(details.get(i).get("SUMPBB").toString());
				int hbp = Integer.parseInt(details.get(i).get("SUMPHBP").toString());
				int per = Integer.parseInt(details.get(i).get("SUMPER").toString());
				//String.format("%.2f", );
				details.get(i).put("IP", CommonUtils.getInningString(ci, co));
				
				double era = per*9/CommonUtils.getInningDouble(ci, co);
				details.get(i).put("ERA", String.format("%.2f", era));
				
				double winRate = w/(w+l);
				details.get(i).put("WINRATE", String.format("%.2f", winRate));
				double k9 = (double)k*9/CommonUtils.getInningDouble(ci, co);
				details.get(i).put("K9", String.format("%.2f", k9));
				double bb9 = (double)bb*9/CommonUtils.getInningDouble(ci, co);
				details.get(i).put("BB9", String.format("%.2f", bb9));
				double kbb = (double)k/bb;
				details.get(i).put("KBB", String.format("%.2f", kbb));
				
				double whip = (h+bb)/CommonUtils.getInningDouble(ci, co);
				details.get(i).put("WHIP", String.format("%.2f", whip));
				
				double fip = ((-2*(double)k+3*(bb+hbp)+13*hr)/CommonUtils.getInningDouble(ci, co))+3.0;
				details.get(i).put("FIP", String.format("%.2f", fip));

			}
		}
		else {
			details.clear();
		}
		
		return details;
	}
	
	
	
}

