package team.sports.matching.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.sports.matching.service.BaseBall_HitterDAO;
import team.sports.matching.service.CommonUtils;

@Controller
public class ChartController {

	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
	@RequestMapping(value="/Team/Matching/getHitterChart.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> makeHitterChart(@RequestParam Map map, Authentication auth) {
		System.out.println("makeHitterChart 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = new Vector<Map>();
		Map listMap = new HashMap();
		
		List<Map> getMyHit = hitterDAO.getMyHit(map);
		List<Map> getAllHit = hitterDAO.getAllHit(map);
		List<Map> getSigma = hitterDAO.getHitSigma(map);
		
		double myTa = Double.parseDouble(getMyHit.get(0).get("MYTA").toString());
		double myCHUL = Double.parseDouble(getMyHit.get(0).get("MYCHUL").toString());
		double myJANG = Double.parseDouble(getMyHit.get(0).get("MYJANG").toString());
		double myHomeRun = Double.parseDouble(getMyHit.get(0).get("MYHOMERUN").toString());
		double mySpeed = Double.parseDouble(getMyHit.get(0).get("MYSPEED").toString());
		double myHitting = Double.parseDouble(getMyHit.get(0).get("MYHITTING").toString());
		
		double allTa = Double.parseDouble(getAllHit.get(0).get("ALLTA").toString());
		double allCHUL = Double.parseDouble(getAllHit.get(0).get("ALLCHUL").toString());
		double allJANG = Double.parseDouble(getAllHit.get(0).get("ALLJANG").toString());
		double allHomeRun = Double.parseDouble(getAllHit.get(0).get("ALLHOMERUN").toString());
		double allSpeed = Double.parseDouble(getAllHit.get(0).get("ALLSPEED").toString());
		double allHitting = Double.parseDouble(getAllHit.get(0).get("ALLHITTING").toString());
		
		double taSigma = Double.parseDouble(getSigma.get(0).get("TASIGMA").toString());
		double chulSigma = Double.parseDouble(getSigma.get(0).get("CHULSIGMA").toString());
		double jangSigma = Double.parseDouble(getSigma.get(0).get("JANGSIGMA").toString());
		double homeRunSigma = Double.parseDouble(getSigma.get(0).get("HOMERUNSIGMA").toString());
		double speedSigma = Double.parseDouble(getSigma.get(0).get("SPEEDSIGMA").toString());
		double hittingSigma = Double.parseDouble(getSigma.get(0).get("HITTINGSIGMA").toString());
		
		int taRate = CommonUtils.scoreByNormDist(myTa, allTa, taSigma);
		int chulRate = CommonUtils.scoreByNormDist(myCHUL, allCHUL, chulSigma);
		int jangRate = CommonUtils.scoreByNormDist(myJANG, allJANG, jangSigma);
		int homeRunRate = CommonUtils.scoreByNormDist(myHomeRun, allHomeRun, homeRunSigma);
		int speedRate = CommonUtils.scoreByNormDist(mySpeed, allSpeed, speedSigma);
		int hittingRate = CommonUtils.scoreByNormDist(myHitting, allHitting, hittingSigma);
		
		listMap.put("TARATE", taRate);
		listMap.put("CHULRATE", chulRate);
		listMap.put("JANGRATE", jangRate);
		listMap.put("HOMERUNRATE", homeRunRate);
		listMap.put("SPEEDRATE", speedRate);
		listMap.put("HITTINGRATE", hittingRate);
		
		details.add(listMap);
		
		return details;
	}
	
	
	@RequestMapping(value="/Team/Matching/getHitterChartTeam.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> makeHitterChartTeam(@RequestParam Map map, Authentication auth) {
		System.out.println("makeHitterChartTeam 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = new Vector<Map>();
		Map listMap = new HashMap();
		
		List<Map> getMyHitForTeam = hitterDAO.getMyHitForTeam(map);
		List<Map> getAllHit = hitterDAO.getAllHit(map);
		List<Map> getSigma = hitterDAO.getHitSigma(map);
		
		if(getMyHitForTeam.get(0)!=null && getAllHit.get(0)!=null && getSigma.get(0)!=null) {
		
			double myTa = Double.parseDouble(getMyHitForTeam.get(0).get("MYTA").toString());
			double myCHUL = Double.parseDouble(getMyHitForTeam.get(0).get("MYCHUL").toString());
			double myJANG = Double.parseDouble(getMyHitForTeam.get(0).get("MYJANG").toString());
			double myHomeRun = Double.parseDouble(getMyHitForTeam.get(0).get("MYHOMERUN").toString());
			double mySpeed = Double.parseDouble(getMyHitForTeam.get(0).get("MYSPEED").toString());
			double myHitting = Double.parseDouble(getMyHitForTeam.get(0).get("MYHITTING").toString());
			
			double allTa = Double.parseDouble(getAllHit.get(0).get("ALLTA").toString());
			double allCHUL = Double.parseDouble(getAllHit.get(0).get("ALLCHUL").toString());
			double allJANG = Double.parseDouble(getAllHit.get(0).get("ALLJANG").toString());
			double allHomeRun = Double.parseDouble(getAllHit.get(0).get("ALLHOMERUN").toString());
			double allSpeed = Double.parseDouble(getAllHit.get(0).get("ALLSPEED").toString());
			double allHitting = Double.parseDouble(getAllHit.get(0).get("ALLHITTING").toString());
			
			double taSigma = Double.parseDouble(getSigma.get(0).get("TASIGMA").toString());
			double chulSigma = Double.parseDouble(getSigma.get(0).get("CHULSIGMA").toString());
			double jangSigma = Double.parseDouble(getSigma.get(0).get("JANGSIGMA").toString());
			double homeRunSigma = Double.parseDouble(getSigma.get(0).get("HOMERUNSIGMA").toString());
			double speedSigma = Double.parseDouble(getSigma.get(0).get("SPEEDSIGMA").toString());
			double hittingSigma = Double.parseDouble(getSigma.get(0).get("HITTINGSIGMA").toString());
			
			int taRate = CommonUtils.scoreByNormDist(myTa, allTa, taSigma);
			int chulRate = CommonUtils.scoreByNormDist(myCHUL, allCHUL, chulSigma);
			int jangRate = CommonUtils.scoreByNormDist(myJANG, allJANG, jangSigma);
			int homeRunRate = CommonUtils.scoreByNormDist(myHomeRun, allHomeRun, homeRunSigma);
			int speedRate = CommonUtils.scoreByNormDist(mySpeed, allSpeed, speedSigma);
			int hittingRate = CommonUtils.scoreByNormDist(myHitting, allHitting, hittingSigma);
			
			
			listMap.put("TARATE", taRate);
			listMap.put("CHULRATE", chulRate);
			listMap.put("JANGRATE", jangRate);
			listMap.put("HOMERUNRATE", homeRunRate);
			listMap.put("SPEEDRATE", speedRate);
			listMap.put("HITTINGRATE", hittingRate);
		
			details.add(listMap);
		}
		
		return details;
	}
	
	@RequestMapping(value="/Team/Matching/getPitterChart.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> makePitcherChart(@RequestParam Map map, Authentication auth) {
		System.out.println("makeHitterChart 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = new Vector<Map>();
		Map listMap = new HashMap();
		
		List<Map> getMyPit = hitterDAO.getMyPit(map);
		List<Map> getAllPit = hitterDAO.getAllPit(map);
		List<Map> getSigma = hitterDAO.getPitSigma(map);
		
		double myInning = Double.parseDouble(getMyPit.get(0).get("MYINNING").toString());
		double myKBB = Double.parseDouble(getMyPit.get(0).get("MYKBB").toString());
		double myWHIP = Double.parseDouble(getMyPit.get(0).get("MYWHIP").toString());
		double myERA = Double.parseDouble(getMyPit.get(0).get("MYERA").toString());
		double myHOMERUN = Double.parseDouble(getMyPit.get(0).get("MYHOMERUN").toString());
		double myPitting = Double.parseDouble(getMyPit.get(0).get("MYPITCHING").toString());
		
		double allInning = Double.parseDouble(getAllPit.get(0).get("ALLINNING").toString());
		double allKBB = Double.parseDouble(getAllPit.get(0).get("ALLKBB").toString());
		double allWHIP = Double.parseDouble(getAllPit.get(0).get("ALLWHIP").toString());
		double allERA = Double.parseDouble(getAllPit.get(0).get("ALLERA").toString());
		double allHOMERUN = Double.parseDouble(getAllPit.get(0).get("ALLHOMERUN").toString());
		double allPitting = Double.parseDouble(getAllPit.get(0).get("ALLPITCHING").toString());
		
		double inningSigma = Double.parseDouble(getSigma.get(0).get("INNINGSIGMA").toString());
		double kbbSigma = Double.parseDouble(getSigma.get(0).get("KBBSIGMA").toString());
		double wHIPSigma = Double.parseDouble(getSigma.get(0).get("WHIPSIGMA").toString());
		double eRASigma = Double.parseDouble(getSigma.get(0).get("ERASIGMA").toString());
		double homeRunSigma = Double.parseDouble(getSigma.get(0).get("HOMERUNSIGMA").toString());
		double pittingSigma = Double.parseDouble(getSigma.get(0).get("PITCHINGSIGMA").toString());
		
		int inningRate = CommonUtils.scoreByNormDist(myInning, allInning, inningSigma);
		int kbbRate = CommonUtils.scoreByNormDist(myKBB, allKBB, kbbSigma);
		int wHIPRate = CommonUtils.scoreByNormDist(myWHIP, allWHIP, wHIPSigma);
		int eRARate = CommonUtils.scoreByNormDist(myERA, allERA, eRASigma);
		int homeRunRate = CommonUtils.scoreByNormDist(myHOMERUN, allHOMERUN, homeRunSigma);
		int pittingRate = CommonUtils.scoreByNormDist(myPitting, allPitting, pittingSigma);
		
		listMap.put("INNINGRATE", inningRate);
		listMap.put("KBBRATE", kbbRate);
		listMap.put("WHIPRATE", wHIPRate);
		listMap.put("ERARATE", eRARate);
		listMap.put("HOMERUNRATE", homeRunRate);
		listMap.put("PITCHINGRATE", pittingRate);
		
		details.add(listMap);
		
		return details;
	}
	
	
	@RequestMapping(value="/Team/Matching/getPitterChartTeam.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> makePitcherChartTeam(@RequestParam Map map, Authentication auth) {
		System.out.println("makeHitterChartTeam 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = new Vector<Map>();
		Map listMap = new HashMap();
		
		List<Map> getMyPit = hitterDAO.getMyPitForTeam(map);
		List<Map> getAllPit = hitterDAO.getAllPit(map);
		List<Map> getSigma = hitterDAO.getPitSigma(map);
		
		if(getMyPit.get(0)!=null && getAllPit.get(0)!=null && getSigma.get(0)!=null) {
			double myInning = Double.parseDouble(getMyPit.get(0).get("MYINNING").toString());
			double myKBB = Double.parseDouble(getMyPit.get(0).get("MYKBB").toString());
			double myWHIP = Double.parseDouble(getMyPit.get(0).get("MYWHIP").toString());
			double myERA = Double.parseDouble(getMyPit.get(0).get("MYERA").toString());
			double myHOMERUN = Double.parseDouble(getMyPit.get(0).get("MYHOMERUN").toString());
			double myPitching = Double.parseDouble(getMyPit.get(0).get("MYPITCHING").toString());
			
			double allInning = Double.parseDouble(getAllPit.get(0).get("ALLINNING").toString());
			double allKBB = Double.parseDouble(getAllPit.get(0).get("ALLKBB").toString());
			double allWHIP = Double.parseDouble(getAllPit.get(0).get("ALLWHIP").toString());
			double allERA = Double.parseDouble(getAllPit.get(0).get("ALLERA").toString());
			double allHOMERUN = Double.parseDouble(getAllPit.get(0).get("ALLHOMERUN").toString());
			double allPitching = Double.parseDouble(getAllPit.get(0).get("ALLPITCHING").toString());
			
			double inningSigma = Double.parseDouble(getSigma.get(0).get("INNINGSIGMA").toString());
			double kbbSigma = Double.parseDouble(getSigma.get(0).get("KBBSIGMA").toString());
			double wHIPSigma = Double.parseDouble(getSigma.get(0).get("WHIPSIGMA").toString());
			double eRASigma = Double.parseDouble(getSigma.get(0).get("ERASIGMA").toString());
			double homeRunSigma = Double.parseDouble(getSigma.get(0).get("HOMERUNSIGMA").toString());
			double pitchingSigma = Double.parseDouble(getSigma.get(0).get("PITCHINGSIGMA").toString());
			
			int inningRate = CommonUtils.scoreByNormDist(myInning, allInning, inningSigma);
			int kbbRate = CommonUtils.scoreByNormDist(myKBB, allKBB, kbbSigma);
			int wHIPRate = CommonUtils.scoreByNormDist(myWHIP, allWHIP, wHIPSigma);
			int eRARate = CommonUtils.scoreByNormDist(myERA, allERA, eRASigma);
			int homeRunRate = CommonUtils.scoreByNormDist(myHOMERUN, allHOMERUN, homeRunSigma);
			int pitchingRate = CommonUtils.scoreByNormDist(myPitching, allPitching, pitchingSigma);
			
			listMap.put("INNINGRATE", inningRate);
			listMap.put("KBBRATE", kbbRate);
			listMap.put("WHIPRATE", wHIPRate);
			listMap.put("ERARATE", eRARate);
			listMap.put("HOMERUNRATE", homeRunRate);
			listMap.put("PITCHINGRATE", pitchingRate);
			
			details.add(listMap);
		}
		
		return details;
	}
	
	
}
