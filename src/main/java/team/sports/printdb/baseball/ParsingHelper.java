package team.sports.printdb.baseball;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ParsingHelper {
	
	public static void hitterNpitcherSQLMaker(String home, String away, String[] homeMembers, String[] awayMembers, String gamedate, String stadium, String time, String statizURL) throws IOException {
		
		// 크롤링할 주소
		//String URL = "http://www.statiz.co.kr/boxscore.php?date=2018-10-12&stadium=%EC%9E%A0%EC%8B%A4&hour=18&opt=4";
		
		String URL = statizURL;
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
		
		//insert into gameschedule(gamedate, stadium, time, awayteam, gamestatus, homescore, awayscore, teamname) values (  );

		String[] tempScore = elem5.get(0).text().toString().split(":");
		int homeScore = Integer.parseInt(tempScore[0].trim());
		int awayScore = Integer.parseInt(tempScore[1].trim());
		System.out.println(String.format(
					"update gameschedule set gamestatus='finish', homescore=%d ,awayscore=%d where gamedate='%s' and stadium='%s' and time='%s' and teamname='%s' and awayteam='%s';  ", 
					homeScore,awayScore,gamedate,stadium, time, home, away));
		System.out.println();
		for(int i=1; i<elem.size() -1;i++) {
		 	
			String id = homeMembers[i-1];
			String teamname= home;
			
			if( !((elem.get(i).child(0).text().trim()).isEmpty() )) { 
				
				int pa = Integer.parseInt(elem.get(i).child(3).text());
    			int ab = Integer.parseInt(elem.get(i).child(4).text());
    			int h = Integer.parseInt(elem.get(i).child(6).text());
    			int r = Integer.parseInt(elem.get(i).child(5).text());
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
    				e +=(Math.random()<0.1?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			
    			String startMember = 
					String.format(
					"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
					+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);   %n", 
					gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
    			start.append(startMember);
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
    				e +=(Math.random()<0.1?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			
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
		
		
		
		for(int i=1; i<elem2.size() -1;i++) {
		 	
			String id = awayMembers[i-1];
			String teamname= away;
			
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
    				e +=(Math.random()<0.1?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			
    			String startMember2 = 
    					String.format(
						"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
						+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);%n", 
						gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
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
    				e +=(Math.random()<0.1?1:0);
    			}
    			
    			int pos = 1;
    			int horder = 1;
    			
    			String changeMember2 = 
					String.format(
							"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
							+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);%n", 
							gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder);
    			change2.append(changeMember2);
            }
        	
        }
		System.out.print(start2);
		System.out.println();
		System.out.print(change2);
		System.out.println();
		
		/** 투수 파싱 시작!!!!  **/
		
		for(int i=1; i<elem3.size() -1;i++) {
		 	
			String id = homeMembers[i-1];
			String teamname= home;
			
			if( !((elem3.get(i).child(0).text().trim()).isEmpty() )) { 
				
				
				
				int w=0;
				int l=0;
				
				
				String tempName = elem3.get(i).child(0).text();
				//System.out.println(tempName);
				if(tempName.length()>7) {
					String[] tempWL = tempName.split(",");
					if(tempWL[0].contains("승")) w=1;
					else l = 1;
				}
				//System.out.println("w"+w+",l"+l);
				String temptemp = elem3.get(i).child(1).child(0).text();
				int ci = Integer.parseInt(temptemp.substring(0, temptemp.indexOf(".")));
				int co = Integer.parseInt(temptemp.substring(temptemp.length()-1));
				
				
				int tbf = Integer.parseInt(elem3.get(i).child(2).text());
				//System.out.println(tbf);
    			int h = Integer.parseInt(elem3.get(i).child(3).text());
    			int r = Integer.parseInt(elem3.get(i).child(4).text());
    			int er = Integer.parseInt(elem3.get(i).child(5).text());
    			int bb = Integer.parseInt(elem3.get(i).child(6).text());
    			int hbp = Integer.parseInt(elem3.get(i).child(7).text());
    			int so = Integer.parseInt(elem3.get(i).child(8).text());
    			int hr = Integer.parseInt(elem3.get(i).child(9).text());
    			//System.out.println(hr);
    			
    			String[] tempPitch=elem3.get(i).child(12).text().split("-");
    			int pitch = Integer.parseInt(tempPitch[0]);
    			
    			int b2 = 0; for(int k=0;k<h;k++) {b2 +=(Math.random()<0.25?1:0);}
    			int b3 = 0; for(int k=0;k<(h-b2);k++) {b3 +=(Math.random()<0.1?1:0);}
    			int hol = 0;
    			int blsv = 0;
    			int sv = 0;
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
		 	
			String id = awayMembers[i-1];
			String teamname= away;
			
			if( !((elem4.get(i).child(0).text().trim()).isEmpty() )) { 
				
				int w=0;
				int l=0;
				
				String tempName = elem4.get(i).child(0).text();
				//System.out.println(tempName);
				if(tempName.length()>7) {
					String[] tempWL = tempName.split(",");
					if(tempWL[0].contains("승")) w=1;
					else l = 1;
				}
				//System.out.println("w"+w+",l"+l);
				String temptemp = elem4.get(i).child(1).child(0).text();
				int ci = Integer.parseInt(temptemp.substring(0, temptemp.indexOf(".")));
				int co = Integer.parseInt(temptemp.substring(temptemp.length()-1));
				
				
				int tbf = Integer.parseInt(elem4.get(i).child(2).text());
				//System.out.println(tbf);
    			int h = Integer.parseInt(elem4.get(i).child(3).text());
    			int r = Integer.parseInt(elem4.get(i).child(4).text());
    			int er = Integer.parseInt(elem4.get(i).child(5).text());
    			int bb = Integer.parseInt(elem4.get(i).child(6).text());
    			int hbp = Integer.parseInt(elem4.get(i).child(7).text());
    			int so = Integer.parseInt(elem4.get(i).child(8).text());
    			int hr = Integer.parseInt(elem4.get(i).child(9).text());
    			//System.out.println(hr);
    			
    			String[] tempPitch=elem4.get(i).child(12).text().split("-");
    			int pitch = Integer.parseInt(tempPitch[0]);
    			
    			int b2 = 0; for(int k=0;k<h;k++) {b2 +=(Math.random()<0.25?1:0);}
    			int b3 = 0; for(int k=0;k<(h-b2);k++) {b3 +=(Math.random()<0.1?1:0);}
    			int hol = 0;
    			int blsv = 0;
    			int sv = 0;
    			String startMember4 = 
					String.format(
					"insert into pitcher(gamedate,stadium,time,id,teamname,W,L,SV,HOL,BLSV,CI,CO,TBF,PITCH,PR,PER,PH,PB2,PB3,PHR,PBB,PHBP,PSO) "
					+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);   %n", 
					gamedate,stadium,time,id,teamname,w,l,sv,hol,blsv,ci,co,tbf,pitch,r,er,h,b2,b3,hr,bb,hbp,so);
    			start4.append(startMember4);
            }
        	
        }
		System.out.print(start4);
		System.out.println();
		
		
		
		
		
		
		
		
	
		
	}
	
	public static void main(String[] args) throws IOException {
		
		
		String home = "한화";
		String away = "SK";
		String[] homeMembers = {"김아무개1","김아무개2","김아무개3","김아무개4","김아무개5","김아무개6","김아무개7","김아무개8","김아무개9","김아무개10","김아무개11","김아무개12","김아무개13","김아무개14","김아무개15","김아무개16"};
		String[] awayMembers = {"이아무개1","이아무개2","이아무개3","이아무개4","이아무개5","이아무개6","이아무개7","이아무개8","이아무개9","이아무개10","이아무개11","이아무개12","이아무개13","이아무개14","이아무개15","이아무개16"};
		
		
		
		String gamedate = "19/01/01";
		String stadium = "잠실";
		String time = "1830";
		String statizURL = "http://www.statiz.co.kr/boxscore.php?date=2018-10-12&stadium=%EC%9E%A0%EC%8B%A4&hour=18&opt=4";
		
		
		
		
		ParsingHelper.hitterNpitcherSQLMaker(home, away, homeMembers, awayMembers, gamedate, stadium, time, statizURL);
		
		
		
	}
	
	
	
}
