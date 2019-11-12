package team.sports.printdb.baseball;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ParsingPracticePractice {

	public static void main(String[] args) throws IOException {
		
		List<Integer> list = new ArrayList();
			
		List<Integer> newList = new ArrayList();
		List<Integer> duplicates = new ArrayList();
		Set<Integer> set = new HashSet();

		HitterDTO dto = new HitterDTO();

		// 크롤링할 주소
		String URL = "https://www.koreabaseball.com/Schedule/GameCenter/Main.aspx?gameDate=20191007&gameId=20191007LGWO0&section=REVIEW";
		Document doc = Jsoup.connect(URL).get();

		Elements elem = doc.select("#tblAwayHitter1 tbody");
		//#tblAwayHitter1 > tbody > tr:nth-child(1) > th:nth-child(1)
		
		//#tblAwayHitter1 > tbody > tr:nth-child(2) > th:nth-child(1)
		
		Elements elem2 = doc.select("#tblHomeHitter1 > tbody");
		
		//#tblHomeHitter1 > tbody > tr:nth-child(1) > th:nth-child(1)
		
		Elements elemTest = doc.select("section.content > div > div:nth-child(2) > div:nth-child(1) > div > div > div:nth-child(3)");
		String[] test = elemTest.text().split(":");
		for(String s: test) {
			System.out.println(s);
		}
		
	
		int pa = 0;
		int ab = 0;
		int h = 0;
		int b2 = 0;
		int b3 = 0;
		int hr = 0;
		int r = 0;
		int rbi = 0;
		int bb = 0;
		int hbp = 0;
		int so = 0;
		int gdp = 0;
		int e = 0;
		      
		
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
		 	   
			if(set.add(Integer.parseInt(elem.get(i).child(0).text().trim()))) { 
				
				for(int j=1; j<=9; j++) {
					String str = elem.get(i).child(j).toString().trim();
					
					if(str.contains("안")) {
						h+=1;
					}
					else if(str.contains("좌2")||str.contains("중2")||str.contains("우2")) {
						b2+=1;
					}
					else if(str.contains("좌3")||str.contains("중3")||str.contains("우3")) {
						b3+=1;
					}
					else if(str.contains("삼진")) {
						so+=1;
					}
					else if(str.contains("4구")) {
						bb+=1;
					}
					else if(str.contains("사구")) {
						hbp+=1;
					}
					else if(str.contains("홈")) {
						hr+=1;
					}
					
					
				Collections.sort(list);
				}
				
				
				
				
				
				
				
				String name = elem.get(i).child(1).text();
				String position = elem.get(i).child(2).text();
				
				
				
    			
    			String startMember = String.format("홈팀 스타트멤버[타자] - %s : 타석%s 타수%s 안타%s %n", name,pa,ab,h);
    			start.append(startMember);
    			
            }
		
        	else {
        		
        		String name = elem.get(i).child(1).text();
        		String position = elem.get(i).child(2).text();
        	
        		
        		for(int j=1; j<=9; j++) {
					String str = elem.get(i).child(j).toString().trim();
					
					if(str.contains("안")) {
						h+=1;
					}
					else if(str.contains("좌2")||str.contains("중2")||str.contains("우2")) {
						b2+=1;
					}
					else if(str.contains("좌3")||str.contains("중3")||str.contains("우3")) {
						b3+=1;
					}
					else if(str.contains("삼진")) {
						so+=1;
					}
					else if(str.contains("4구")) {
						bb+=1;
					}
					else if(str.contains("사구")) {
						hbp+=1;
					}
					else if(str.contains("홈")) {
						hr+=1;
					}
					
				}
    			
    			String changeMember = String.format("홈팀 교체멤버[타자] - %s : 타석%s 타수%s 안타%s %n", name,pa,ab,r);
    			change.append(changeMember);
                
            }
        	
        }
		System.out.print(start);
		System.out.print(change);
		System.out.println();
		
		
		
		
		
	}
	
	



	
	
}
