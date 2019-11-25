package team.sports.matching.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.sports.matching.admin.service.AdminDAO;
import team.sports.matching.service.CommonUtils;

@Controller
public class AdminController{
	
	@Resource(name="admin")
	private AdminDAO dao;
	int count;
	List<Integer> countList = new Vector<Integer>();
	int newCount=0;
	
	//관리자 페이지로 이동
	@RequestMapping("/Team/admin/AdminIndex.do")
	public String moveAdminIndex() { 
		return "admin/index";
	}///////
	
	@ResponseBody
	@RequestMapping("/Team/admin/scheduleUpdate.do")
	public String scheduleUpdate() {
				
		count = dao.selectSchedule(null);
		countList.add(count);
		
		if(countList.size()>=2) {
			if(countList.get(countList.size()-1)>countList.get(countList.size()-2)) {
				newCount = countList.get(countList.size()-1)-countList.get(countList.size()-2);
			}
		}
		return String.valueOf(newCount);
	}
	
	@ResponseBody
	@RequestMapping("/Team/admin/scheduleCount.do")
	public String scheduleCount() {
		newCount = 0;
		return null;
	}
	
	
	@RequestMapping("/Team/admin/insertData.do")
	public String moveInsertData(@RequestParam Map map, Model model) { 
		
		List<Map> records = dao.openInsertData(map);
		for(int i=0;i<records.size();i++) {
			records.get(i).put("DATE", records.get(i).get("GAMEDATE").toString().substring(2,10).trim());
			records.get(i).put("TIME2", records.get(i).get("TIME").toString().substring(0,2).trim()+"시");
		}
		model.addAttribute("records", records);
		return "admin/insertData";
	
	}///////
	
	
	@RequestMapping(value="/Team/admin/insertParsingData.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> insertParsingData(@RequestParam Map map, Authentication auth) throws IOException {
		System.out.println("insertParsingData 소환!!!");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername().toString());
		
		String gamedate = map.get("GAMEDATE").toString().substring(0, 10).trim();
		System.out.println(map.get("GAMEDATE").toString());
		String stadium = map.get("STADIUM").toString();
		String time = map.get("TIME").toString();
		String teamname = map.get("TEAMNAME").toString();
		String awayteam = map.get("AWAYTEAM").toString();
		
		String URL = CommonUtils.getStatizURL();
		
		Document doc = Jsoup.connect(URL).get();

		Elements elem = doc.select("section.content div div:nth-child(2) div:nth-child(1) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem2 = doc.select("section.content div div:nth-child(2) div:nth-child(2) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem3 = doc.select("section.content div div:nth-child(2) div:nth-child(3) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem4 = doc.select("section.content div div:nth-child(2) div:nth-child(4) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem5 = doc.select("section.content div div:nth-child(1) div div.col-xs-12.col-sm-12.col-md-12.col-lg-4 div div:nth-child(2) span");

		StringBuffer start = new StringBuffer();
		StringBuffer change = new StringBuffer();
		StringBuffer start2 = new StringBuffer();
		StringBuffer change2 = new StringBuffer();
		StringBuffer start3 = new StringBuffer();
		StringBuffer start4 = new StringBuffer();
		
		String[] tempScore = elem5.get(0).text().toString().split(":");
		int homeScore = Integer.parseInt(tempScore[0].trim());
		int awayScore = Integer.parseInt(tempScore[1].trim());
		
		Map updateGameSchedule = new HashMap();
		updateGameSchedule.put("FINISH", "FINISH");
		updateGameSchedule.put("HOMESCORE", homeScore);
		updateGameSchedule.put("AWAYSCORE", awayScore);
		updateGameSchedule.put("GAMEDATE", gamedate);
		updateGameSchedule.put("STADIUM", stadium);
		updateGameSchedule.put("TIME", time);
		updateGameSchedule.put("TEAMNAME", teamname);
		updateGameSchedule.put("AWAYTEAM", awayteam);
		// 게임스케쥴 업데이트
		dao.updateGameSchedule(updateGameSchedule);
		
		System.out.println(String.format(
					"update gameschedule set gamestatus='finish', homescore=%d ,awayscore=%d where gamedate='%s' and stadium='%s' and time='%s' and teamname='%s' and awayteam='%s';  ", 
					homeScore,awayScore,gamedate,stadium, time, teamname, awayteam));
		System.out.println();
		
		Map insertHitter = new HashMap();
		Map insertPitcher = new HashMap();
		
		Map gethomehitters = new HashMap();
		gethomehitters.put("TEAMNAME", teamname);
		List<Map> homehitterList = dao.getMembersWithParsing(gethomehitters);
		List<String> homehitters = new Vector<String>();
		for(int v=0;v<homehitterList.size();v++) {
			homehitters.add((homehitterList.get(v).get("ID").toString()));
			
		}
		
		Map getawayhitters = new HashMap();
		getawayhitters.put("TEAMNAME", awayteam);
		List<Map> awayhitterList = dao.getMembersWithParsing(getawayhitters);
		List<String> awayhitters = new Vector<String>();
		for(int v=0;v<awayhitterList.size();v++) {
			awayhitters.add((awayhitterList.get(v).get("ID").toString()));
		}
		
		Map gethomepitchers = new HashMap();
		gethomepitchers.put("TEAMNAME", teamname);
		List<Map> homepitcherList = dao.getMembersWithParsingPITCHER(gethomepitchers);
		List<String> homepitchers = new Vector<String>();
		for(int v=0;v<homepitcherList.size();v++) {
			homepitchers.add((homepitcherList.get(v).get("ID").toString()));
		}
		
		Map getawaypitchers = new HashMap();
		getawaypitchers.put("TEAMNAME", awayteam);
		List<Map> awaypitcherList = dao.getMembersWithParsingPITCHER(getawaypitchers);
		List<String> awaypitchers = new Vector<String>();
		for(int v=0;v<awaypitcherList.size();v++) {
			awaypitchers.add((awaypitcherList.get(v).get("ID").toString()));
		}
		
		
		for(int i=1; i<elem.size() -1;i++) {
		
			String id = homehitters.get(i-1);
			
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
    			
    			int b2 = 0;
    			for(int k=0;k<h;k++) {
    				b2 +=(Math.random()<0.25?1:0);
    			}
    			int b3 = 0;
    			for(int k=0;k<(h-b2);k++) {
    				b3 +=(Math.random()<0.1?1:0);
    			}
    			int sb = 0;
    			for(int k=0;k<(h+bb);k++) {
    				sb +=(Math.random()<0.2?1:0);
    			}
    			int cs = 0;
    			for(int k=0;k<(h-sb);k++) {
    				cs +=(Math.random()<0.2?1:0);
    			}
    			int e = 0;
    			for(int k=0;k<9;k++) {
    				e +=(Math.random()<0.3?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			
    			//홈팀 주전 타자 주입
    			insertHitter.put("GAMEDATE", gamedate);
    			insertHitter.put("STADIUM", stadium);
    			insertHitter.put("TIME", time);
    			insertHitter.put("ID", id);
    			insertHitter.put("TEAMNAME", teamname);
    			insertHitter.put("PA", pa);
    			insertHitter.put("AB", ab);
    			insertHitter.put("H", h);
    			insertHitter.put("B2", b2);
    			insertHitter.put("B3", b3);
    			insertHitter.put("HR", hr);
    			insertHitter.put("R", r);
    			insertHitter.put("RBI", rbi);
    			insertHitter.put("SB", sb);
    			insertHitter.put("CS", cs);
    			insertHitter.put("BB", bb);
    			insertHitter.put("HBP", hbp);
    			insertHitter.put("SO", so);
    			insertHitter.put("GDP", gdp);
    			insertHitter.put("E", e);
    			insertHitter.put("POS", pos);
    			insertHitter.put("HORDER", horder);
    			dao.insertHitter(insertHitter);
    			
    			insertHitter.clear();
    			horder=i;
    			String startMember = 
					String.format(
					"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
					+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);   %n", 
					gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
    			start.append(startMember);
            }
		
			
			//홈팀 교체타자
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
    			
    			int b2 = 0;
    			for(int k=0;k<h;k++) {
    				b2 +=(Math.random()<0.25?1:0);
    			}
    			int b3 = 0;
    			for(int k=0;k<(h-b2);k++) {
    				b3 +=(Math.random()<0.1?1:0);
    			}
    			int sb = 0;
    			for(int k=0;k<(h+bb);k++) {
    				sb +=(Math.random()<0.2?1:0);
    			}
    			int cs = 0;
    			for(int k=0;k<(h-sb);k++) {
    				cs +=(Math.random()<0.2?1:0);
    			}
    			int e = 0;
    			for(int k=0;k<9;k++) {
    				e +=(Math.random()<0.3?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    		
    			//홈팀 교체 타자 주입
    			insertHitter.put("GAMEDATE", gamedate);
    			insertHitter.put("STADIUM", stadium);
    			insertHitter.put("TIME", time);
    			insertHitter.put("ID", id);
    			insertHitter.put("TEAMNAME", teamname);
    			insertHitter.put("PA", pa);
    			insertHitter.put("AB", ab);
    			insertHitter.put("H", h);
    			insertHitter.put("B2", b2);
    			insertHitter.put("B3", b3);
    			insertHitter.put("HR", hr);
    			insertHitter.put("R", r);
    			insertHitter.put("RBI", rbi);
    			insertHitter.put("SB", sb);
    			insertHitter.put("CS", cs);
    			insertHitter.put("BB", bb);
    			insertHitter.put("HBP", hbp);
    			insertHitter.put("SO", so);
    			insertHitter.put("GDP", gdp);
    			insertHitter.put("E", e);
    			insertHitter.put("POS", pos);
    			insertHitter.put("HORDER", horder);
    			dao.insertHitter(insertHitter);
    			
    			insertHitter.clear();
    			horder=0;
    			String changeMember = 
					String.format(
							"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
							+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);%n", 
							gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
    			change.append(changeMember);
            }
        	
        }
		System.out.print(start);
		System.out.println();
		System.out.print(change);
		System.out.println();
		
		//원정팀 시작
		for(int i=1; i<elem2.size() -1;i++) {
			
			
			String id = awayhitters.get(i-1);
			
			if( !((elem2.get(i).child(0).text().trim()).isEmpty() )) { 
				
				int pa = Integer.parseInt(elem2.get(i).child(3).text());
    			int ab = Integer.parseInt(elem2.get(i).child(4).text());
    			int r = Integer.parseInt(elem2.get(i).child(5).text());
    			int h = Integer.parseInt(elem2.get(i).child(6).text());
    			int hr = Integer.parseInt(elem2.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem2.get(i).child(8).text());
    			int bb = Integer.parseInt(elem2.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem2.get(i).child(10).text());
    			int so = Integer.parseInt(elem2.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem2.get(i).child(12).text());
    			
    			int b2 = 0;
    			for(int k=0;k<h;k++) {
    				b2 +=(Math.random()<0.25?1:0);
    			}
    			int b3 = 0;
    			for(int k=0;k<(h-b2);k++) {
    				b3 +=(Math.random()<0.1?1:0);
    			}
    			int sb = 0;
    			for(int k=0;k<(h+bb);k++) {
    				sb +=(Math.random()<0.2?1:0);
    			}
    			int cs = 0;
    			for(int k=0;k<(h-sb);k++) {
    				cs +=(Math.random()<0.2?1:0);
    			}
    			int e = 0;
    			for(int k=0;k<9;k++) {
    				e +=(Math.random()<0.3?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			
    			//원정팀 주전타자 주입
    			insertHitter.put("GAMEDATE", gamedate);
    			insertHitter.put("STADIUM", stadium);
    			insertHitter.put("TIME", time);
    			insertHitter.put("ID", id);
    			insertHitter.put("TEAMNAME", awayteam);
    			insertHitter.put("PA", pa);
    			insertHitter.put("AB", ab);
    			insertHitter.put("H", h);
    			insertHitter.put("B2", b2);
    			insertHitter.put("B3", b3);
    			insertHitter.put("HR", hr);
    			insertHitter.put("R", r);
    			insertHitter.put("RBI", rbi);
    			insertHitter.put("SB", sb);
    			insertHitter.put("CS", cs);
    			insertHitter.put("BB", bb);
    			insertHitter.put("HBP", hbp);
    			insertHitter.put("SO", so);
    			insertHitter.put("GDP", gdp);
    			insertHitter.put("E", e);
    			insertHitter.put("POS", pos);
    			insertHitter.put("HORDER", horder);
    			dao.insertHitter(insertHitter);
    			
    			insertHitter.clear();
    			horder=i;
    			String startMember2 = 
    					String.format(
						"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
						+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);%n", 
						gamedate,stadium,time,id,awayteam,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
    			start2.append(startMember2);
            }
		
        	else {
        		int pa = Integer.parseInt(elem2.get(i).child(3).text());
    			int ab = Integer.parseInt(elem2.get(i).child(4).text());
    			int r = Integer.parseInt(elem2.get(i).child(5).text());
    			int h = Integer.parseInt(elem2.get(i).child(6).text());
    			int hr = Integer.parseInt(elem2.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem2.get(i).child(8).text());
    			int bb = Integer.parseInt(elem2.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem2.get(i).child(10).text());
    			int so = Integer.parseInt(elem2.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem2.get(i).child(12).text());
    			
    			int b2 = 0;
    			for(int k=0;k<h;k++) {
    				b2 +=(Math.random()<0.25?1:0);
    			}
    			int b3 = 0;
    			for(int k=0;k<(h-b2);k++) {
    				b3 +=(Math.random()<0.1?1:0);
    			}
    			int sb = 0;
    			for(int k=0;k<(h+bb);k++) {
    				sb +=(Math.random()<0.2?1:0);
    			}
    			int cs = 0;
    			for(int k=0;k<(h-sb);k++) {
    				cs +=(Math.random()<0.2?1:0);
    			}
    			int e = 0;
    			for(int k=0;k<9;k++) {
    				e +=(Math.random()<0.3?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			//원정팀 교체 타자 주입
    			insertHitter.put("GAMEDATE", gamedate);
    			insertHitter.put("STADIUM", stadium);
    			insertHitter.put("TIME", time);
    			insertHitter.put("ID", id);
    			insertHitter.put("TEAMNAME", awayteam);
    			insertHitter.put("PA", pa);
    			insertHitter.put("AB", ab);
    			insertHitter.put("H", h);
    			insertHitter.put("B2", b2);
    			insertHitter.put("B3", b3);
    			insertHitter.put("HR", hr);
    			insertHitter.put("R", r);
    			insertHitter.put("RBI", rbi);
    			insertHitter.put("SB", sb);
    			insertHitter.put("CS", cs);
    			insertHitter.put("BB", bb);
    			insertHitter.put("HBP", hbp);
    			insertHitter.put("SO", so);
    			insertHitter.put("GDP", gdp);
    			insertHitter.put("E", e);
    			insertHitter.put("POS", pos);
    			insertHitter.put("HORDER", horder);
    			dao.insertHitter(insertHitter);
    			
    			insertHitter.clear();
    			horder=0;
    			String changeMember2 = 
					String.format(
							"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
							+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);%n", 
							gamedate,stadium,time,id,awayteam,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
    			change2.append(changeMember2);
            }
        	
        }
		System.out.print(start2);
		System.out.println();
		System.out.print(change2);
		System.out.println();
		
		/** 투수 파싱 시작!!!!  **/
		
		for(int i=1; i<elem3.size() -1;i++) {
		
			String id = homepitchers.get(i-1);
			
			if( !((elem3.get(i).child(0).text().trim()).isEmpty())) { 
				
				int w=0;
				int l=0;
				
				String tempName = elem3.get(i).child(0).text();
				//System.out.println(tempName);
				if(tempName.length()>7) {
					String[] tempWL = tempName.split(",");
					if(tempWL[0].contains("승")) w=1;
					else l = 1;
				}
				String temptemp = elem3.get(i).child(1).child(0).text();
				int ci = Integer.parseInt(temptemp.substring(0, temptemp.indexOf(".")));
				int co = Integer.parseInt(temptemp.substring(temptemp.length()-1));
				
				int tbf = Integer.parseInt(elem3.get(i).child(2).text());
    			int h = Integer.parseInt(elem3.get(i).child(3).text());
    			int r = Integer.parseInt(elem3.get(i).child(4).text());
    			int er = Integer.parseInt(elem3.get(i).child(5).text());
    			int bb = Integer.parseInt(elem3.get(i).child(6).text());
    			int hbp = Integer.parseInt(elem3.get(i).child(7).text());
    			int so = Integer.parseInt(elem3.get(i).child(8).text());
    			int hr = Integer.parseInt(elem3.get(i).child(9).text());
    			
    			String[] tempPitch=elem3.get(i).child(12).text().split("-");
    			int pitch = Integer.parseInt(tempPitch[0]);
    			
    			int b2 = 0; for(int k=0;k<h;k++) {b2 +=(Math.random()<0.25?1:0);}
    			int b3 = 0; for(int k=0;k<(h-b2);k++) {b3 +=(Math.random()<0.1?1:0);}
    			int hol = 0;
    			int blsv = 0;
    			int sv = 0;
    			
    			//홈팀 투수 주입
    			insertPitcher.put("GAMEDATE", gamedate);
    			insertPitcher.put("STADIUM", stadium);
    			insertPitcher.put("TIME", time);
    			insertPitcher.put("ID", id);
    			insertPitcher.put("TEAMNAME", teamname);
    			insertPitcher.put("W", w);
    			insertPitcher.put("L", l);
    			insertPitcher.put("SV", sv);
    			insertPitcher.put("HOL", hol);
    			insertPitcher.put("BLSV", blsv);
    			insertPitcher.put("CI", ci);
    			insertPitcher.put("CO", co);
    			insertPitcher.put("TBF", tbf);
    			insertPitcher.put("PITCH", pitch);
    			insertPitcher.put("PR", r);
    			insertPitcher.put("PER", er);
    			insertPitcher.put("PH", h);
    			insertPitcher.put("PB2", b2);
    			insertPitcher.put("PB3", b3);
    			insertPitcher.put("PHR", hr);
    			insertPitcher.put("PBB", bb);
    			insertPitcher.put("PHBP", hbp);
    			insertPitcher.put("PSO", so);
    			dao.insertPitcher(insertPitcher);
    			
    			insertPitcher.clear();
    			
    			String startMember3 = 
					String.format(
					"insert into pitcher(gamedate,stadium,time,id,teamname,W,L,SV,HOL,BLSV,CI,CO,TBF,PITCH,PR,PER,PH,PB2,PB3,PHR,PBB,PHBP,PSO) "
					+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);   %n", 
					gamedate,stadium,time,id,teamname,w,l,sv,hol,blsv,ci,co,tbf,pitch,r,er,h,b2,b3,hr,bb,hbp,so);
    			start3.append(startMember3);
            }
        }
		System.out.print(start3);
		System.out.println();
		
		for(int i=1; i<elem4.size() -1;i++) {
		 
			String id = awaypitchers.get(i-1);
			
			if( !((elem4.get(i).child(0).text().trim()).isEmpty() )) { 
				
				int w=0;
				int l=0;
				
				String tempName = elem4.get(i).child(0).text();
				if(tempName.length()>7) {
					String[] tempWL = tempName.split(",");
					if(tempWL[0].contains("승")) w=1;
					else l = 1;
				}
				String temptemp = elem4.get(i).child(1).child(0).text();
				int ci = Integer.parseInt(temptemp.substring(0, temptemp.indexOf(".")));
				int co = Integer.parseInt(temptemp.substring(temptemp.length()-1));
				
				int tbf = Integer.parseInt(elem4.get(i).child(2).text());
    			int h = Integer.parseInt(elem4.get(i).child(3).text());
    			int r = Integer.parseInt(elem4.get(i).child(4).text());
    			int er = Integer.parseInt(elem4.get(i).child(5).text());
    			int bb = Integer.parseInt(elem4.get(i).child(6).text());
    			int hbp = Integer.parseInt(elem4.get(i).child(7).text());
    			int so = Integer.parseInt(elem4.get(i).child(8).text());
    			int hr = Integer.parseInt(elem4.get(i).child(9).text());
    			
    			String[] tempPitch=elem4.get(i).child(12).text().split("-");
    			int pitch = Integer.parseInt(tempPitch[0]);
    			
    			int b2 = 0; for(int k=0;k<h;k++) {b2 +=(Math.random()<0.25?1:0);}
    			int b3 = 0; for(int k=0;k<(h-b2);k++) {b3 +=(Math.random()<0.1?1:0);}
    			int hol = 0;
    			int blsv = 0;
    			int sv = 0;
    			
    			//원정팀 투수 주입
    			insertPitcher.put("GAMEDATE", gamedate);
    			insertPitcher.put("STADIUM", stadium);
    			insertPitcher.put("TIME", time);
    			insertPitcher.put("ID", id);
    			insertPitcher.put("TEAMNAME", awayteam);
    			insertPitcher.put("W", w);
    			insertPitcher.put("L", l);
    			insertPitcher.put("SV", sv);
    			insertPitcher.put("HOL", hol);
    			insertPitcher.put("BLSV", blsv);
    			insertPitcher.put("CI", ci);
    			insertPitcher.put("CO", co);
    			insertPitcher.put("TBF", tbf);
    			insertPitcher.put("PITCH", pitch);
    			insertPitcher.put("PR", r);
    			insertPitcher.put("PER", er);
    			insertPitcher.put("PH", h);
    			insertPitcher.put("PB2", b2);
    			insertPitcher.put("PB3", b3);
    			insertPitcher.put("PHR", hr);
    			insertPitcher.put("PBB", bb);
    			insertPitcher.put("PHBP", hbp);
    			insertPitcher.put("PSO", so);
    			dao.insertPitcher(insertPitcher);
    			
    			insertPitcher.clear();
    			String startMember4 = 
					String.format(
					"insert into pitcher(gamedate,stadium,time,id,teamname,W,L,SV,HOL,BLSV,CI,CO,TBF,PITCH,PR,PER,PH,PB2,PB3,PHR,PBB,PHBP,PSO) "
					+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);   %n", 
					gamedate,stadium,time,id,awayteam,w,l,sv,hol,blsv,ci,co,tbf,pitch,r,er,h,b2,b3,hr,bb,hbp,so);
    			start4.append(startMember4);
            }
        }
		System.out.print(start4);
		System.out.println();
		
		List<Map> success = new ArrayList();
		Map testmap = new HashMap();
		testmap.put("GOOD", "베리 굿");
		success.add(testmap);
		return success;
	}
	
	
	//DetailView 출력을 위한 매핑
	@RequestMapping(value="/Team/admin/showDetailLogo.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> showDetailLogo(@RequestParam Map map, Authentication auth) {
		System.out.println("showDetailView 소환!!!");
		map.put("GAMEDATE", map.get("GAMEDATE").toString().substring(0,10).trim());
		List<Map> details = dao.getScoreLogo(map);
		return details;
	}
	
	
	@RequestMapping(value="/Team/admin/showChart.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> showChart(@RequestParam Map map, Authentication auth) {
		System.out.println("showChart 소환!!!");
		map.put("GAMEDATE", map.get("GAMEDATE").toString().substring(0,10).trim());
		List<Map> details = dao.getSummary(map);
		return details;
	}
	
	@RequestMapping(value="/Team/admin/getEachResult.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> getResult(@RequestParam Map map, Authentication auth) {
		System.out.println("getEachResult 소환!!!");
		
		map.put("GAMEDATE", map.get("GAMEDATE").toString().substring(0,10).trim());
		List<Map> details = dao.getEachResult(map);
		
		String wSTR = "";
		String b2STR = "";
		String b3STR = "";
		String hrSTR = "";
		
		for(int i=0;i<details.size();i++) {

			if(details.get(i).get("W")!=null) {
				if("1".equals(details.get(i).get("W").toString())) {
					wSTR = details.get(i).get("NAME").toString() +" ("+details.get(i).get("TEAMNAME").toString()+")";
				}
			}

			if(details.get(i).get("B2")!=null) {
				if(!"0".equals(details.get(i).get("B2").toString())) {
					b2STR += details.get(i).get("NAME").toString()
							+ " ("+details.get(i).get("TEAMNAME").toString().substring(0,2)+") " 
							+ details.get(i).get("B2").toString() + "개, ";
				}
			}
			
			if(details.get(i).get("B3")!=null) {
				if(!"0".equals(details.get(i).get("B3").toString())) {
					b3STR += details.get(i).get("NAME").toString()
							+ " ("+details.get(i).get("TEAMNAME").toString().substring(0,2)+") " 
							+ details.get(i).get("B3").toString() + "개, ";
				}
			}
			
			if(details.get(i).get("HR")!=null) {
				if(!"0".equals(details.get(i).get("HR").toString())) {
					hrSTR += details.get(i).get("NAME").toString()
							+ " ("+details.get(i).get("TEAMNAME").toString().substring(0,2)+") " 
							+ details.get(i).get("HR").toString() + "개, ";
				}
			}
		}
		if(b2STR.length()!=0) {
			b2STR = b2STR.substring(0, b2STR.length()-2);
		}
		if(b3STR.length()!=0) {
			b3STR = b3STR.substring(0, b3STR.length()-2);
		}
		if(hrSTR.length()!=0) {
			hrSTR = hrSTR.substring(0, hrSTR.length()-2);
		}
		
		List<Map> newList = new Vector<Map>();
		Map newMap = new HashMap();
		newMap.put("wSTR", wSTR);
		newMap.put("b2STR", b2STR);
		newMap.put("b3STR", b3STR);
		newMap.put("hrSTR", hrSTR);
		newList.add(newMap);
		
		return newList;
	}
	
}
