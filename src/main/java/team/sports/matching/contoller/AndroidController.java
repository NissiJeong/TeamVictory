package team.sports.matching.contoller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import team.sports.matching.service.AndBettingDTO;
import team.sports.matching.service.AndroidDAO;
import team.sports.matching.service.CommonUtils;
import team.sports.matching.service.FinishGameDTO;
import team.sports.matching.service.GameDTO;
import team.sports.matching.service.MatchDTO;
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
			System.out.println(key+":"+map.get(key));
		}
		if(map.get("matchTime").toString().substring(0,3).trim().equals("AM")) {
			map.put("matchTime", map.get("matchTime").toString().substring(3,map.get("matchTime").toString().indexOf("시")).trim()+map.get("matchTime").toString().substring(6,map.get("matchTime").toString().indexOf("분")).trim());
		}
		else {
			map.put("matchTime", Integer.parseInt(map.get("matchTime").toString().substring(3,map.get("matchTime").toString().indexOf("시")).trim())+12+map.get("matchTime").toString().substring(6,map.get("matchTime").toString().indexOf("분")).trim());
		}
		map.put("matchDate", map.get("matchDate").toString().split("/")[0].trim()+"-"+map.get("matchDate").toString().split("/")[1].trim()+"-"+map.get("matchDate").toString().split("/")[2].trim());
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key)+"  /  ");
		}
		int match = dao.insertmatch(map);
		return match==1?"yes":"no";
	}
	///////
	@CrossOrigin
	@RequestMapping(value="/ANDROID/saveToken.do",produces="text/plain; charset=UTF-8")
	public String saveTokec(@RequestParam Map map) {
		System.out.println("토큰 전달:"+map.get("token"));
		int tokenInsert = dao.inserToken(map);
		return tokenInsert==1?"yes":"no";
	}
	//나한테 들어온 매칭 list
	@CrossOrigin
	@RequestMapping(value="/ANDROID/MatchList.do",produces="application/json; charset=UTF-8")
	public List<MatchDTO> matchList(@RequestParam Map map){
		System.out.println("들어오았다!");
		for(Object key : map.keySet()) {
			//System.out.println(key+":"+map.get(key));
		}
		List<MatchDTO> matchList = dao.selectMatchList(map);
		for(int i=0;i<matchList.size();i++) {
			//System.out.println(matchList.get(i).getReqdate());
			matchList.get(i).setReqdate(matchList.get(i).getReqdate().substring(0,11).trim());
		}
		return matchList;
	}
	//매칭 결정 
	@CrossOrigin
	@RequestMapping(value="/ANDROID/MatchResult.do",produces="text/plain; charset=UTF-8")
	public String matchResult(@RequestParam Map map) {
		for(Object key: map.keySet()) {
			//System.out.println(key+":"+map.get(key)+" / ");
		}
		if(map.get("result").toString().equals("o")) {
			int updateMatch = dao.updateMatchStatus22(map);
			if(updateMatch==1) {
				Map gameMap = dao.selectGame2222(map);
				gameMap.put("TIME", gameMap.get("TIME")+"00");
				int insertGame = dao.insertGameSchedule222(gameMap);
			}
			return "경기 일정이 잡혔습니다";
		}
		else {
			int updateMatch = dao.updateMatchStatus33(map);
			return "매칭 신청을 거절하였습니다";
		}
	}
	//gameList가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/GameList22.do",produces="application/json; charset=UTF-8")
	public List<GameDTO> gameList22(@RequestParam Map map){
		for(Object key:map.keySet()) {
			//System.out.println(key+":"+map.get(key)+" / ");
		}
		List<GameDTO> gameList = dao.selectGameList233(map);
		for(int i=0;i<gameList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			gameList.get(i).setGamedate(gameList.get(i).getGamedate().substring(0,11).trim());
		}
		return gameList;
	}
	//배팅 리스트 - 예정인 경기(내가 속한팀의 경기 빼고)
	@CrossOrigin
	@RequestMapping(value="/ANDROID/BettingList.do",produces="application/json; charset=UTF-8")
	public List<AndBettingDTO> bettingList22(@RequestParam Map map){
		for(Object key:map.keySet()) {
			//System.out.println("123123"+key+":"+map.get(key)+" / ");
		}
		List<AndBettingDTO> bettingList = dao.selectBetting22(map);
		for(int i=0;i<bettingList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			bettingList.get(i).setGamedate(bettingList.get(i).getGamedate().substring(0,11).trim());
		}
		return bettingList;
	}
	//finish게임 리스트
	@CrossOrigin
	@RequestMapping(value="/ANDROID/finishGameList.do",produces="application/json; charset=UTF-8")
	public List<FinishGameDTO> finishList22(@RequestParam Map map){
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		List<FinishGameDTO> finishList = dao.selectFinish222(map);
		for(int i=0;i<finishList.size();i++) {
			//System.out.println(gameList.get(i).getGamedate());
			finishList.get(i).setGamedate(finishList.get(i).getGamedate().substring(0,11).trim());
		}
		return finishList;
	}
	//배팅하기 전 내 마일리지와 홈팀, 어웨이 팀 정보 가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/getTeamAndMyInfo.do",produces="text/plain; charset=UTF-8")
	public String getTeamAndMyInfo(@RequestParam Map map){
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		//내 마일리지
		int mileage = dao.selectMyMileage(map);
		//홈팀 rating
		int homeRating = dao.selectHomeRating(map);
		//어웨이팀 rating
		int awayRating = dao.selectAwayRating(map);
		//홈팀 5경기 정보
		List<Map> homeList = dao.selectHomeList(map);
		String homeRecord="No Record";
		int homewin = 0;
		int homedraw = 0;
		int homelose = 0;
		for(int i=0;i<homeList.size();i++) {
			for(Object key : homeList.get(i).keySet()) {
				//System.out.print(key+":"+homeList.get(i).get(key)+" / ");
			}
			if(Integer.parseInt(homeList.get(i).get("HOMESCORE").toString())>Integer.parseInt(homeList.get(i).get("AWAYSCORE").toString())) {
				homewin++;
			}
			else if(Integer.parseInt(homeList.get(i).get("HOMESCORE").toString())<Integer.parseInt(homeList.get(i).get("AWAYSCORE").toString())) {
				homelose++;
			}
			else {
				homedraw ++;
			}
			//System.out.println();
		}
		if(homewin!=0 || homedraw!=0 || homelose !=0) {
			homeRecord = (homewin+homedraw+homelose)+"G "+homewin+"W "+homedraw+"D "+homelose+"L";
		}
		//System.out.println("//////////////////////////////");
		//어웨이 5경기 정보
		String aRecord="No Record";
		int awin = 0;
		int adraw = 0;
		int alose = 0;
		List<Map> awayList = dao.selectAwayList(map);
		for(int i=0;i<awayList.size();i++) {
			for(Object key : awayList.get(i).keySet()) {
				//System.out.print(key+":"+awayList.get(i).get(key)+" / ");
			}if(Integer.parseInt(awayList.get(i).get("HOMESCORE").toString())>Integer.parseInt(awayList.get(i).get("AWAYSCORE").toString())) {
				awin++;
			}
			else if(Integer.parseInt(awayList.get(i).get("HOMESCORE").toString())<Integer.parseInt(awayList.get(i).get("AWAYSCORE").toString())) {
				alose++;
			}
			else {
				adraw ++;
			}
			//System.out.println();
		}
		if(awin!=0 || adraw!=0 || alose !=0) {
			aRecord = (awin+adraw+alose)+"G "+awin+"W "+adraw+"D "+alose+"L";
		}
		String totalInfo="";
		Map myList = dao.selectBettingMyId(map);
		String myselectTeam="";
		String myBettingmileage="";
		if(myList != null ) {
			for(Object key : myList.keySet()){
				System.out.println(key+":"+myList.get(key));
			}
			myselectTeam = myList.get("SELECTTEAM").toString();
			myBettingmileage = myList.get("MILEAGE").toString();
			totalInfo = "homerating:"+homeRating+"/homerecord:"+homeRecord+"-awayrating:"+awayRating+"/awayrecord:"+aRecord+"-mileage:"+mileage+"-prevMileage:"+myBettingmileage+"/prevSelectTeam:"+myselectTeam+"-isbetting:"+1;
			return totalInfo;
		}
		//System.out.println("homerating:"+homeRating+" awayrating:"+awayRating+" mileage:"+mileage+" homerecord:"+homeRecord+" awayrecord:"+aRecord);
		totalInfo = "homerating:"+homeRating+"/homerecord:"+homeRecord+"-awayrating:"+awayRating+"/awayrecord:"+aRecord+"-mileage:"+mileage;
		return totalInfo;
	}
	//배팅버튼 클릭시
	@CrossOrigin
	@RequestMapping(value="/ANDROID/gettingToGame.do", produces = "text/plain; charset=UTF-8")
	public String bettingToGame(@RequestParam Map map) {
		String betting="no";
		int betmileage = Integer.parseInt(map.get("bettingmileage").toString());
		int mymileage = dao.selectMyMileage(map);
		if(betmileage>mymileage) {
			return "betno";
		}
		for(Object key : map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		int insert = dao.insertBetting(map);
		if(insert==2) {
			betting="yes";
		}
		return betting;
	}
	//사진 업로드시
	@CrossOrigin
	@RequestMapping(value="/ANDROID/upload.do",method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String uploadProfile(MultipartHttpServletRequest mhsr,@RequestParam Map map) throws IllegalStateException,IOException {
		//System.out.println(mhsr.getFileNames());
		String path = mhsr.getSession().getServletContext().getRealPath("/Upload");
		String id = map.get("id").toString();
		System.out.println("id: "+id);
		System.out.println(path);
		
		MultipartFile upload = mhsr.getFile("files");
		//System.out.println(upload.getOriginalFilename());
		String newFilename = FileUpDownUtils.getNewFileName(path, upload.getOriginalFilename());
		File file = new File(path+File.separator+newFilename);
		upload.transferTo(file);
		map.put("profile",newFilename);
		int affected = dao.profileupdate(map);
		return null;
	}
	//내 사진 가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/getMyProfile.do", produces = "text/plain; charset=UTF-8")
	public String getMyProfile(@RequestParam Map map) {
		String profile = dao.selectProfile(map);
		String result = "no";
		if(profile!=null) {
			if(profile.indexOf("png")!=-1) {
				return profile;
			}
		}
		return result;
	}
	//개인페이지 정보 가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/getMyInfo22.do", produces ="text/plain; charset=UTF-8" )
	public String getMyInfo22(@RequestParam Map map) {
		System.out.println("id:"+map.get("id"));
		String personInfo = dao.selectMyInfo222(map);
		String totalRecord = dao.selectRecord222(map);
		String personRecord = dao.select1Record222(map);
		System.out.println(personInfo+"/"+totalRecord+"/"+personRecord);
		return personInfo+"="+totalRecord+"="+personRecord;
	}
	//팀정보, 마일리지 정보 가져오기
	@CrossOrigin
	@RequestMapping(value="/ANDROID/getGamePredicInfo22.do", produces ="text/plain; charset=UTF-8" )
	public String getTeamPridecInfo22(@RequestParam Map map) {
		String realResult = "";
		List<Map> homeList = dao.selectMyTeamGameList(map);
		String homeRecord="No Record";
		int homewin = 0;
		int homedraw = 0;
		int homelose = 0;
		for(int i=0;i<homeList.size();i++) {
			for(Object key : homeList.get(i).keySet()) {
				//System.out.print(key+":"+homeList.get(i).get(key)+" / ");
			}
			if(Integer.parseInt(homeList.get(i).get("HOMESCORE").toString())>Integer.parseInt(homeList.get(i).get("AWAYSCORE").toString())) {
				homewin++;
			}
			else if(Integer.parseInt(homeList.get(i).get("HOMESCORE").toString())<Integer.parseInt(homeList.get(i).get("AWAYSCORE").toString())) {
				homelose++;
			}
			else {
				homedraw ++;
			}
			//System.out.println();
		}
		if(homewin!=0 || homedraw!=0 || homelose !=0) {
			homeRecord = (homewin+homedraw+homelose)+"G "+homewin+"W "+homedraw+"D "+homelose+"L";
		}
		Map myTeamInfo = dao.selectMyTeamInfo(map);
		for(Object key : myTeamInfo.keySet())
			System.out.println(key+":"+myTeamInfo.get(key));
		String name = myTeamInfo.get("TEAMNAME").toString();
		String info = myTeamInfo.get("TEAMINFO").toString();
		String loc = myTeamInfo.get("TEAMLOC").toString();
		String logo = myTeamInfo.get("TEAMLOGO").toString();
		String rating = myTeamInfo.get("TEAMRATING").toString();
		String regidate = myTeamInfo.get("REGIDATE").toString().substring(0, 11).trim();
		String member = dao.selectMember(map);
		System.out.println("member: "+member);
		realResult = name+":"+logo+":"+regidate+":"+loc+":"+rating+":"+homeRecord+":"+member+":"+info+"=";
		System.out.println("==============================================");
		System.out.println("logo: "+logo);
		Map lastPredic = dao.selectLastPredic(map);
		if(lastPredic!=null) {
			for(Object key:lastPredic.keySet())
				System.out.println(key+":"+lastPredic.get(key));
			String hometeam = lastPredic.get("TEAMNAME").toString();
			String awayteam = lastPredic.get("AWAYTEAM").toString();
			String game = lastPredic.get("GAMEDATE").toString().substring(0, 11).trim()+" "+lastPredic.get("TIME").toString().substring(0,2).trim()+"시 경기장 "+lastPredic.get("STADIUM")+" "+lastPredic.get("TEAMNAME").toString()+" vs "+lastPredic.get("AWAYTEAM").toString();
			String mileage = lastPredic.get("MILEAGE").toString()+" point";
			int homescore = Integer.parseInt(lastPredic.get("HOMESCORE").toString());
			int awayscore = Integer.parseInt(lastPredic.get("AWAYSCORE").toString());
			
			realResult+=game+":"+mileage+":";
			
			List<Map> bettingPersons = dao.selectBettings222(lastPredic);
			double totalMileage = 0;
			double homeMileage = 0;
			double drawMileage = 0;
			double awayMileage = 0;		
			for(int i=0; i<bettingPersons.size();i++) {
				totalMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				if(hometeam.equals(lastPredic.get("SELECTTEAM").toString())) {
					homeMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}
				else if("DRAW".equals(lastPredic.get("SELECTTEAM").toString())) {
					drawMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}
				else {
					awayMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}				
				for(Object key : bettingPersons.get(i).keySet()) {
					//System.out.print(key+":"+bettingPersons.get(i).get(key)+"/");
				}
				System.out.println();
			}
			double myMileage = 0;
			for(int i=0; i<bettingPersons.size();i++) {
				if(homescore>awayscore) {
					if(hometeam.equals(lastPredic.get("SELECTTEAM").toString())) {
						myMileage =  totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/homeMileage);
						System.out.println("홈팀이 이겼을 때 내가 딴 돈:"+myMileage);
					}
					else {
						myMileage = 0;
					}					
				}
				else if(homescore==awayscore) {
					if("DRAW".equals(lastPredic.get("SELECTTEAM").toString())) {
						myMileage = totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/drawMileage);
						System.out.println("draw했을 떄 내가 딴 돈:"+myMileage);
					}
					else {
						myMileage = 0;
					}
				}
				else {
					if(awayteam.equals(lastPredic.get("SELECTTEAM").toString())) {
						myMileage =  totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/awayMileage);
						System.out.println("away팀이 이겼을 때 내가 딴 돈:"+myMileage);
					}
					else {
						myMileage = 0;
					}
				}
			}
			
			realResult+=(int)myMileage+" point";
			System.out.println("내가 딴 돈: "+myMileage);
			System.out.println(realResult);
			return realResult;
		}
		return realResult+0+" point";
	}
	@CrossOrigin
	@RequestMapping(value="/ANDROID/WaitingList.do",produces="application/json; charset=UTF-8")
	public List<FinishGameDTO> getWaitingList(@RequestParam Map map){
		System.out.println("/////////id+:"+map.get("id"));
		List<FinishGameDTO> watingList = dao.selectWaitingList(map);
		for(int i=0;i<watingList.size();i++)
			watingList.get(i).setGamedate(watingList.get(i).getGamedate().substring(0,11).trim());
		return watingList;
	}
	@CrossOrigin
	@RequestMapping(value="/ANDROID/updateInwating.do", produces ="text/plain; charset=UTF-8")
	public String updateInwaiting(@RequestParam Map map) {
		for(Object key : map.keySet())
			System.out.println(key+":"+map.get(key));
		int update = dao.updateInwating222(map);
		//내 팀의 마일리지 올리기
		int teamMemberMileageUpdate = dao.updateTeamMemberMileage(map);
		return "yes";
	}
	@CrossOrigin
	@RequestMapping(value="/ANDROID/inWaitingList.do",produces="application/json; charset=UTF-8")
	public List<FinishGameDTO> getInWaitingList(@RequestParam Map map){
		List<FinishGameDTO> inWaitingList = dao.selectInWaitingList(map);
		for(int i=0;i<inWaitingList.size();i++)
			inWaitingList.get(i).setGamedate(inWaitingList.get(i).getGamedate().substring(0,11).trim());
		return inWaitingList;
	}
	//마지막 종료 눌렀을 때
	@CrossOrigin
	@RequestMapping(value="/ANDROID/updateFinish.do", produces ="text/plain; charset=UTF-8")
	public String updateFinish(@RequestParam Map map) {
		int update = dao.updateFinish222(map);
		if(update==1) {
			//팀원들 마일리지 올리기
			dao.updateTeamMemberMileage(map);
			Map recentGame = dao.selectGameSchedule222222(map);
			//레이팅 처리 위한 코드
			List<Map> HomeGameList = dao.selectHomeGameShcedule(recentGame);
			List<Map> AwayGameList = dao.selectAwayGameShcedule(recentGame);
			String hometeam = HomeGameList.get(0).get("TEAMNAME").toString();
			double homeRating = Double.parseDouble(HomeGameList.get(HomeGameList.size()-1).get("TEAMRATING").toString());
			int home_homescore = Integer.parseInt(HomeGameList.get(0).get("HOMESCORE").toString());
			int home_awayscore = Integer.parseInt(HomeGameList.get(0).get("AWAYSCORE").toString());
			int homeMatchCount = HomeGameList.size();
			String awayteam = AwayGameList.get(0).get("AWAYTEAM").toString();
			double awayRating = Double.parseDouble(AwayGameList.get(AwayGameList.size()-1).get("TEAMRATING").toString());
			int awayMatchCount = AwayGameList.size();
			int away_awayscore = Integer.parseInt(AwayGameList.get(0).get("HOMESCORE").toString());
			int away_homescore = Integer.parseInt(AwayGameList.get(0).get("AWAYSCORE").toString());
			double homeNewRating = CommonUtils.calcRating(homeRating, awayRating, homeMatchCount, home_homescore, home_awayscore);
			double awayNewRating = CommonUtils.calcRating(awayRating, homeRating, awayMatchCount, away_homescore, away_awayscore);
			System.out.println("home Rating:"+hometeam+":"+homeNewRating+"away Rating:"+awayteam+":"+awayNewRating);
			recentGame.put("homeNewRating", homeNewRating);
			recentGame.put("awayNewRating", awayNewRating);
			int isHomeUpdate = dao.updateHomeRating(recentGame);
			int isAwayUpdate = dao.updateAwayRating(recentGame);
			//마일리지 변경 코드
			List<Map> bettingPersons = dao.selectBettings3333(recentGame);
			double totalMileage = 0;
			double homeMileage = 0;
			double drawMileage = 0;
			double awayMileage = 0;
			for(int i=0; i<bettingPersons.size();i++) {
				totalMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				if(hometeam.equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
					homeMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}
				else if("DRAW".equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
					drawMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}
				else {
					awayMileage += Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString());
				}				
				for(Object key : bettingPersons.get(i).keySet()) {
					System.out.print(key+":"+bettingPersons.get(i).get(key)+"/");
				}
				System.out.println();
			}
			Map resultMap = new HashMap(); 
			for(int i=0; i<bettingPersons.size();i++) {
				resultMap.put("id", bettingPersons.get(i).get("ID").toString());
				if(home_homescore>home_awayscore) {
					if(hometeam.equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
						double myMileage =  totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/homeMileage);
						System.out.println("홈팀이 이겼을 때 내가 딴 돈:"+myMileage);
						resultMap.put("myMileage", myMileage);
						int update22 = dao.updatePoint22(resultMap);
					}
					else {
						double myMileage = 0;
						resultMap.put("myMileage", myMileage);
						int update22 = dao.updatePoint22(resultMap);
					}					
				}
				else if(home_homescore==home_awayscore) {
					if("DRAW".equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
						double myMileage = totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/drawMileage);
						System.out.println("draw했을 떄 내가 딴 돈:"+myMileage);
						resultMap.put("myMileage", myMileage);
						int update22 = dao.updatePoint22(resultMap);
					}
					else {
						double myMileage = 0;
						resultMap.put("myMileage", myMileage);
						int update22 = dao.updatePoint22(resultMap);
					}
				}
				else {
					if(awayteam.equals(bettingPersons.get(i).get("SELECTTEAM").toString())) {
						double myMileage =  totalMileage * (Double.parseDouble(bettingPersons.get(i).get("MILEAGE").toString())/awayMileage);
						System.out.println("away팀이 이겼을 때 내가 딴 돈:"+myMileage);
						resultMap.put("myMileage", myMileage);
						int update22 = dao.updatePoint22(resultMap);
					}
					else {
						double myMileage = 0;
						resultMap.put("myMileage", myMileage);
						int update22 = dao.updatePoint22(resultMap);
					}
				}
			}			
			return "yes";
		}
		return "no";
	}
}
