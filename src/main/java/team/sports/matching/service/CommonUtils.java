package team.sports.matching.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


public class CommonUtils {
	
	public static double calcRating(double aRating, double bRating, int matchCount,int homescore, int awayscore) {   
      //matchCount - 지금까지 치룬 경기수, isWin - HomeTeam 기준으로 현재 경기가 이겼으면 1, 비겼으면 0, 졌으면 -1
	  int k=64;
	  double atemp;
	  double btemp;
	  
	  if(matchCount<=5) k=64;
	  else if(matchCount<=10) k=48;
	  else if(matchCount>10) k=32;
	  
	  double aPower = Math.pow(10, (aRating-1500)/400);
	  double bPower = Math.pow(10, (bRating-1500)/400);
	  
	  
	  if(homescore>awayscore) {
	     atemp = aRating + k* 1/(1+Math.pow(10,((aRating-bRating)/400)));
	     btemp = bRating - k* 1/(1+Math.pow(10,((aRating-bRating)/400)));
	     
	  }
	  else if(homescore==awayscore) {
	     
	     if(aRating>bRating) {
	        atemp = aRating - k* 0.5/(1+Math.pow(10,((bRating-aRating)/400)));
	        btemp = bRating + k* 0.5/(1+Math.pow(10,((bRating-aRating)/400)));
	     }
	     else {
	        atemp = aRating + k* 0.5/(1+Math.pow(10,((aRating-bRating)/400)));
	        btemp = bRating - k* 0.5/(1+Math.pow(10,((aRating-bRating)/400)));
	     }
	  }
	  
	  else {
	     atemp = aRating - k* 1/(1+Math.pow(10,((bRating-aRating)/400)));
	     btemp = bRating + k* 1/(1+Math.pow(10,((bRating-aRating)/400)));
	     System.out.println("B 승리");
	      }
	      
	      aRating = Math.ceil(atemp * 10000)/10000.0;
	      bRating = Math.ceil(btemp * 10000)/10000.0;
	      
	      return aRating;
	      
	}
	
	public static void getStatizURLs(int month, int year) throws IOException {
		
		String parsingURL = "http://www.statiz.co.kr/schedule.php?opt="+month+"&sy="+year;
		Document doc = Jsoup.connect(parsingURL).get();
		Elements day = doc.select("div:nth-child(2) div div div div.box-body.no-padding table tbody tr");
	
		for(int k=1;k<day.size()-1;k++) {
			for(int j=0;j<day.get(k).childNodeSize();j++) {
				if(!day.get(k).child(j).hasText()) {
					continue;
				}	
				for(int i=0;i<day.get(k).child(j).child(2).childNodeSize();i++) {
					if(day.get(k).child(j).child(2).child(i).toString().startsWith("<a")) {
						System.out.println("http://www.statiz.co.kr/boxscore.php?opt=4&"+day.get(k).child(j).child(2).child(i).attr("href").substring(13));
					}
				}
				System.out.println();
			}
		}
	}
	
	public static String getStatizURL() throws IOException {
		
		int month = (int)(Math.random()*7)+4 ;
		int year = (int)(Math.random()*7)+2012 ;
		
		String parsingURL = "http://www.statiz.co.kr/schedule.php?opt="+month+"&sy="+year;
		Document doc = Jsoup.connect(parsingURL).get();
		Elements day = doc.select("div:nth-child(2) div div div div.box-body.no-padding table tbody tr");
		List<String> list = new Vector<String>();
		
		for(int k=1;k<day.size()-1;k++) {
			for(int j=0;j<day.get(k).childNodeSize();j++) {
				if(!day.get(k).child(j).hasText()) {
					continue;
				}	
				for(int i=0;i<day.get(k).child(j).child(2).childNodeSize();i++) {
					if(day.get(k).child(j).child(2).child(i).toString().startsWith("<a")) {
						list.add("http://www.statiz.co.kr/boxscore.php?opt=4&"+day.get(k).child(j).child(2).child(i).attr("href").substring(13));
					}
				}
			}
		}
		int index = (int)(Math.random()*list.size()) ;
		String url = list.get(index);
		System.out.println("파싱 페이지 : "+url);
		return url;
	}
	
	
	
	public static String makeRandomName() {
		
		List<String> 성 = Arrays.asList("김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안",
	        "송", "류", "전", "홍", "고", "문", "양", "손", "배", "조", "백", "허", "유", "남", "심", "노", "정", "하", "곽", "성", "차", "주",
	        "우", "구", "신", "임", "나", "전", "민", "유", "진", "지", "엄", "채", "원", "천", "방", "공", "강", "현", "함", "변", "염", "양",
	        "변", "여", "추", "노", "도", "소", "신", "석", "선", "설", "마", "길", "주", "연", "방", "위", "표", "명", "기", "반", "왕", "금",
	        "옥", "육", "인", "맹", "제", "모", "장", "남", "탁", "국", "여", "진", "어", "은", "편", "구", "용");
	    List<String> 이름 = Arrays.asList("가", "강", "건", "경", "고", "관", "광", "구", "규", "근", "기", "길", "나", "남", "노", "누", "다",
	        "단", "달", "담", "대", "덕", "도", "동", "두", "라", "래", "로", "루", "리", "마", "만", "명", "무", "문", "미", "민", "바", "박",
	        "백", "범", "별", "병", "보", "빛", "사", "산", "상", "새", "서", "석", "선", "설", "섭", "성", "세", "소", "솔", "수", "숙", "순",
	        "숭", "슬", "승", "시", "신", "아", "안", "애", "엄", "여", "연", "영", "예", "오", "옥", "완", "요", "용", "우", "원", "월", "위",
	        "유", "윤", "율", "으", "은", "의", "이", "익", "인", "일", "잎", "자", "잔", "장", "재", "전", "정", "제", "조", "종", "주", "준",
	        "중", "지", "진", "찬", "창", "채", "천", "철", "초", "춘", "충", "치", "탐", "태", "택", "판", "하", "한", "해", "혁", "현", "형",
	        "혜", "호", "홍", "화", "환", "회", "효", "훈", "휘", "희", "운", "모", "배", "부", "림", "봉", "혼", "황", "량", "린", "을", "비",
	        "솜", "공", "면", "탁", "온", "디", "항", "후", "려", "균", "묵", "송", "욱", "휴", "언", "령", "섬", "들", "견", "추", "걸", "삼",
	        "열", "웅", "분", "변", "양", "출", "타", "흥", "겸", "곤", "번", "식", "란", "더", "손", "술", "훔", "반", "빈", "실", "직", "흠",
	        "흔", "악", "람", "뜸", "권", "복", "심", "헌", "엽", "학", "개", "롱", "평", "늘", "늬", "랑", "얀", "향", "울", "련");
	    Collections.shuffle(성);
	    Collections.shuffle(이름);
	    return 성.get(0) + 이름.get(0) + 이름.get(1);
	}
	
	public static void makeTeamMembers(String dummyID, String teamName) {
		
		String id = dummyID;
		
		for(int i=11;i<=40;i++) {
			System.out.println(String.format("insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL,"
				+ "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES("
				+ "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');", 
				id+i,makeRandomName(),"MAN","2000/01/01","password",
				"010111100"+i,id+i+"@"+id+".com","가산동", 
				Math.ceil(Math.random() * 10000)/10000.0, 
				Math.ceil(Math.random() * 10000)/10000.0));
			System.out.println(String.format("insert into teammember(TEAMNAME,ID,NO,SELF,REGISTATUS,REGIDATE ) values ("
					+"'%s','%s',SEQ_teammember.NEXTVAL,'ㅎㅇㅎㅇ잘지내자','complete',SYSDATE );", 
					teamName,id+i));
		}
		
	}
	
	public static void makeLeaderNMembers(String leaderID, String leaderName, String teamName, String dummyID) {
		
		
		
		System.out.println(String.format("insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL,"
				+ "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES("
				+ "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');", 
				leaderID,makeRandomName(),"MAN","2000/01/01",
				"123123123",
				(long)(Math.ceil(Math.random() * 10000000000l)),leaderID+"@"+leaderID+".com","주작동", 
				Math.ceil(Math.random() * 10000)/10000.0, 
				Math.ceil(Math.random() * 10000)/10000.0));
		
		System.out.println(String.format("insert into team(teamname,category,teamloc,teamrating,manager_id,teaminfo,regidate,teamlogo values("
				+ teamName+",'baseball','gura',1500,"+leaderName+",'주작팀',SYSDATE,'team_default.jpg'"));
		
		
		String id = dummyID;
		
		for(int i=11;i<=40;i++) {
			System.out.println(String.format("insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL,"
				+ "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES("
				+ "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');", 
				id+i,makeRandomName(),"MAN","2000/01/01","password",
				"010111100"+i,id+i+"@"+id+".com","가산동", 
				Math.ceil(Math.random() * 10000)/10000.0, 
				Math.ceil(Math.random() * 10000)/10000.0));
			System.out.println(String.format("insert into teammember(TEAMNAME,ID,NO,SELF,REGISTATUS,REGIDATE ) values ("
					+teamName+","+id+i+",SEQ_teammember.NEXTVAL,'ㅎㅇㅎㅇ잘지내자','complete',SYSDATE );"));
		}
		
	}
	
	
	
	
	
	public static void main(String[] args) {
		
		makeLeaderNMembers("kimchiman", "김치맨", "불닭볶음면", "dogs");
		
	}
	
	
	

}
