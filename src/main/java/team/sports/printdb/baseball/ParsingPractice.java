package team.sports.printdb.baseball;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ParsingPractice {

public static void main(String[] args) throws IOException {

		// 크롤링할 주소
		String URL = "http://www.statiz.co.kr/boxscore.php?opt=4&date=2015-07-01&stadium=%EB%A7%88%EC%82%B0&hour=18";
		Document doc = Jsoup.connect(URL).get();

		Elements elem = doc.select("section.content div div:nth-child(2) div:nth-child(1) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem2 = doc.select("section.content div div:nth-child(2) div:nth-child(2) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem3 = doc.select("section.content div div:nth-child(2) div:nth-child(3) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem4 = doc.select("section.content div div:nth-child(2) div:nth-child(4) div div div.box-body.no-padding.table-responsive table tbody tr");

		
		StringBuffer start = new StringBuffer();
		StringBuffer change = new StringBuffer();
		
		StringBuffer start2 = new StringBuffer();
		StringBuffer change2 = new StringBuffer();
		
		StringBuffer start3 = new StringBuffer();
		StringBuffer start4 = new StringBuffer();
		
		int horderHome = 1;
		int horderAway = 1;
		
		
		for(int i=1; i<elem.size() -1;i++) {
		 	
			if( !((elem.get(i).child(0).text().trim()).isEmpty() )) { 
				
				String gamedate = "gamedate1";
				String stadium = "stadium1";
				String time = "time1";
				String id = "주전1";
				String teamname="홈팀1";
				
				
				int pos;
        		String position = elem.get(i).child(2).text().substring(0,1);	
				if(position=="0"||position=="1"||position=="2"||position=="3"||position=="4"||position=="5"||position=="6"||position=="7"||position=="8"||position=="9") {
					pos = Integer.parseInt(elem.get(i).child(2).text().substring(0,1));
				}
				else pos = 10;
				
				
				
				int pa = Integer.parseInt(elem.get(i).child(3).text());
    			int ab = Integer.parseInt(elem.get(i).child(4).text());
    			int r = Integer.parseInt(elem.get(i).child(5).text());
    			int h = Integer.parseInt(elem.get(i).child(6).text());
    			int hr = Integer.parseInt(elem.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem.get(i).child(8).text());
    			int bb = Integer.parseInt(elem.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem.get(i).child(10).text());
    			int so = Integer.parseInt(elem.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem.get(i).child(15).text());
    			
    			int b2 = 0;
    			for(int k=0;k<h;k++) {
    				b2 +=(Math.random()<0.22?1:0);
    			}
    			int b3 = 0;
    			for(int k=0;k<(h-b2);k++) {
    				b3 +=(Math.random()<0.06?1:0);
    			}
    			int sb = 0;
    			for(int k=0;k<(h+bb-b3-hr);k++) {
    				sb +=(Math.random()<0.2?1:0);
    			}
    			int cs = 0;
    			for(int k=0;k<(h+bb-b3-hr-sb);k++) {
    				cs +=(Math.random()<0.2?1:0);
    			}
    			int e = 0;
    			for(int k=0;k<9;k++) {
    				e +=(Math.random()<0.3/24?1:0);
    			}
    			
    			String startMember = 
					String.format(
					"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
					+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);   %n", 
					gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horderHome);
    			start.append(startMember);
    			
    			horderHome +=1;
            }
		
        	else {
        		String gamedate = "gamedate1";
				String stadium = "stadium1";
				String time = "time1";
				String id = "교체1";
				String teamname="홈팀1";
        		
				int pa = Integer.parseInt(elem.get(i).child(3).text());
    			int ab = Integer.parseInt(elem.get(i).child(4).text());
    			int r = Integer.parseInt(elem.get(i).child(5).text());
    			int h = Integer.parseInt(elem.get(i).child(6).text());
    			int hr = Integer.parseInt(elem.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem.get(i).child(8).text());
    			int bb = Integer.parseInt(elem.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem.get(i).child(10).text());
    			int so = Integer.parseInt(elem.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem.get(i).child(15).text());
    			
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
    			
    			int pos = 10;
    			int horder = 10;
    			
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
		 	
			if( !((elem2.get(i).child(0).text().trim()).isEmpty() )) { 
				
				String gamedate = "gamedate1";
				String stadium = "stadium1";
				String time = "time1";
				String id = "주전1";
				String teamname="원정팀1";
				
				int pos;
        		String position = elem.get(i).child(2).text().substring(0,1);	
				if(position=="0"||position=="1"||position=="2"||position=="3"||position=="4"||position=="5"||position=="6"||position=="7"||position=="8"||position=="9") {
					pos = Integer.parseInt(elem.get(i).child(2).text().substring(0,1));
				}
				else pos = 10;
				
				int pa = Integer.parseInt(elem2.get(i).child(3).text());
    			int ab = Integer.parseInt(elem2.get(i).child(4).text());
    			int r = Integer.parseInt(elem2.get(i).child(5).text());
    			int h = Integer.parseInt(elem2.get(i).child(6).text());
    			int hr = Integer.parseInt(elem2.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem2.get(i).child(8).text());
    			int bb = Integer.parseInt(elem2.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem2.get(i).child(10).text());
    			int so = Integer.parseInt(elem2.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem2.get(i).child(15).text());
    			
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
    			
    			
    			
    			String startMember2 = 
    					String.format(
						"insert into hitter(gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horder) "
						+ "values('%s','%s','%s','%s','%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d);%n", 
						gamedate,stadium,time,id,teamname,pa,ab,h,b2,b3,hr,r,rbi,sb,cs,bb,hbp,so,gdp,e,pos,horderAway);
    			start2.append(startMember2);
    			horderAway ++;
            }
		
        	else {
        		String gamedate = "gamedate1";
				String stadium = "stadium1";
				String time = "time1";
				String id = "교체1";
				String teamname="원정팀1";
        	
				int pa = Integer.parseInt(elem.get(i).child(3).text());
    			int ab = Integer.parseInt(elem.get(i).child(4).text());
    			int r = Integer.parseInt(elem.get(i).child(5).text());
    			int h = Integer.parseInt(elem.get(i).child(6).text());
    			int hr = Integer.parseInt(elem.get(i).child(7).text());
    			int rbi = Integer.parseInt(elem.get(i).child(8).text());
    			int bb = Integer.parseInt(elem.get(i).child(9).text());
    			int hbp = Integer.parseInt(elem.get(i).child(10).text());
    			int so = Integer.parseInt(elem.get(i).child(11).text());
    			int gdp = Integer.parseInt(elem.get(i).child(15).text());
    			
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
    			
    			int pos = 10;
    			int horder = 10;
    			
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
		 	
			if( !((elem3.get(i).child(0).text().trim()).isEmpty() )) { 
				
				String gamedate = "gamedate1";
				String stadium = "stadium1";
				String time = "time1";
				String id = "투수1";
				String teamname="홈팀";
				
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
		 	
			if( !((elem4.get(i).child(0).text().trim()).isEmpty() )) { 
				
				String gamedate = "gamedate1";
				String stadium = "stadium1";
				String time = "time1";
				String id = "투수1";
				String teamname="원정팀";
				
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
		
		
		
		
		
		
		
		
		
	} // main


}
