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
			
		HitterDTO dto = new HitterDTO();

		// 크롤링할 주소
		String URL = "http://www.statiz.co.kr/boxscore.php?date=2018-10-12&stadium=%EC%9E%A0%EC%8B%A4&hour=18&opt=4";
		Document doc = Jsoup.connect(URL).get();

		Elements elem = doc.select("section.content div div:nth-child(2) div:nth-child(1) div div div.box-body.no-padding.table-responsive table tbody tr");
		Elements elem2 = doc.select("section.content div div:nth-child(2) div:nth-child(2) div div div.box-body.no-padding.table-responsive table tbody tr");
		
		
		
		Elements elemTest = doc.select("section.content > div > div:nth-child(2) > div:nth-child(1) > div > div > div:nth-child(3)");

		
		String[] test = elemTest.text().split(":");
		
		for(String s: test) {
			System.out.println(s);
		}
		
	
		
		      
		
		/*
		String[] listTest = elemTest.text().toString().split(",");
		
		for(String s: listTest) {
			System.out.println(s);
		}
		*/
		
		StringBuffer start = new StringBuffer();
		StringBuffer change = new StringBuffer();
		
		StringBuffer start2 = new StringBuffer();
		StringBuffer change2 = new StringBuffer();
		
		for(int i=1; i<elem.size() -1;i++) {
		 	
			if( !((elem.get(i).child(0).text().trim()).isEmpty() )) { 
				
				String name = elem.get(i).child(1).text();
				String position = elem.get(i).child(2).text();
				
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
    			
    			String startMember = String.format("홈팀 스타트멤버[타자] - %s : 타석%s 타수%s 안타%s %n", name,pa,ab,h);
    			start.append(startMember);
    			
            }
		
        	else {
        		
        		String name = elem.get(i).child(1).text();
        		String position = elem.get(i).child(2).text();
        		
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
    			
    			
    			String changeMember = String.format("홈팀 교체멤버[타자] - %s : 타석%s 타수%s 안타%s %n", name,pa,ab,r);
    			change.append(changeMember);
                
            }
        	
        }
		System.out.print(start);
		System.out.print(change);
		System.out.println();
		
		
		
		for(int i=1; i<elem2.size() -1;i++) {
		 	
			if( !((elem2.get(i).child(0).text().trim()).isEmpty() )) { 
				
				String name = elem2.get(i).child(1).text();
				String position = elem2.get(i).child(2).text();
				
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
    			
    			
    			String startMember2 = String.format("원정팀 스타트멤버[타자] - %s : 타석%s 타수%s 안타%s %n", name,pa,ab,h);
    			start2.append(startMember2);
    			
            }
		
        	else {
        		
        		String name = elem2.get(i).child(1).text();
        		String position = elem2.get(i).child(2).text();
        		
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
    			
    			String changeMember2 = String.format("원정팀 교체멤버[타자] - %s : 타석%s 타수%s 안타%s %n", name,pa,ab,r);
    			change2.append(changeMember2);
                
            }
			
        	
        }
		System.out.print(start2);
		System.out.print(change2);
		
		
	}
	
}
