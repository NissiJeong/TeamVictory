package team.sports.matching.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Vector;

import org.apache.catalina.DistributedManager;
import org.apache.commons.math3.distribution.NormalDistribution;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

public class CommonUtils {

   public static double calcRating(double aRating, double bRating, int matchCount, int homescore, int awayscore) {

      int k = 64;
      double atemp;
      double btemp;

      // matchCount에 따라 k값 조절
      if (matchCount <= 5)
         k = 64;
      else if (matchCount <= 10)
         k = 48;
      else if (matchCount > 10)
         k = 32;

      // 예상 승률 구할 때 사용 , 기본점수 : 1500
      // double aPower = Math.pow(10, (aRating - 1500) / 400);
      // double bPower = Math.pow(10, (bRating - 1500) / 400);

      // 레이팅 400점 차이 시, 예상 승률이 10배가 되도록 세팅
      if (homescore > awayscore) {
         atemp = aRating + k * 1 / (1 + Math.pow(10, ((aRating - bRating) / 400)));
         btemp = bRating - k * 1 / (1 + Math.pow(10, ((aRating - bRating) / 400)));

      } else if (homescore == awayscore) {

         if (aRating > bRating) {
            atemp = aRating - k * 0.5 / (1 + Math.pow(10, ((bRating - aRating) / 400)));
            btemp = bRating + k * 0.5 / (1 + Math.pow(10, ((bRating - aRating) / 400)));
         } else {
            atemp = aRating + k * 0.5 / (1 + Math.pow(10, ((aRating - bRating) / 400)));
            btemp = bRating - k * 0.5 / (1 + Math.pow(10, ((aRating - bRating) / 400)));
         }
      }

      else {
         atemp = aRating - k * 1 / (1 + Math.pow(10, ((bRating - aRating) / 400)));
         btemp = bRating + k * 1 / (1 + Math.pow(10, ((bRating - aRating) / 400)));
      }

      aRating = Math.round(atemp * 10000) / 10000.0;
      bRating = Math.round(btemp * 10000) / 10000.0;

      return aRating;

   }

   public static void getStatizURLs(int month, int year) throws IOException {

      String parsingURL = "http://www.statiz.co.kr/schedule.php?opt=" + month + "&sy=" + year;
      Document doc = Jsoup.connect(parsingURL).get();
      Elements day = doc.select("div:nth-child(2) div div div div.box-body.no-padding table tbody tr");

      for (int k = 1; k < day.size() - 1; k++) {
         for (int j = 0; j < day.get(k).childNodeSize(); j++) {
            if (!day.get(k).child(j).hasText()) {
               continue;
            }
            for (int i = 0; i < day.get(k).child(j).child(2).childNodeSize(); i++) {
               if (day.get(k).child(j).child(2).child(i).toString().startsWith("<a")) {
                  System.out.println("http://www.statiz.co.kr/boxscore.php?opt=4&" + day.get(k).child(j).child(2).child(i).attr("href").substring(13));
               }
            }
            System.out.println();
         }
      }
   }

   public static String getStatizURL() throws IOException {

      int month = (int) (Math.random() * 7) + 4; // 4월에서 10월까지
      int year = (int) (Math.random() * 5) + 2014; // 2014년부터 2018년 까지

      String parsingURL = "http://www.statiz.co.kr/schedule.php?opt=" + month + "&sy=" + year;
      Document doc = Jsoup.connect(parsingURL).get();
      Elements day = doc.select("div:nth-child(2) div div div div.box-body.no-padding table tbody tr");
      List<String> list = new Vector<String>();

      for (int k = 1; k < day.size() - 1; k++) {
         for (int j = 0; j < day.get(k).childNodeSize(); j++) {
            // 타겟의 text가 비어 있을 때(경기 없는 날) continue 처리
            if (!day.get(k).child(j).hasText()) {
               continue;
            }
            for (int i = 0; i < day.get(k).child(j).child(2).childNodeSize(); i++) {
               if (day.get(k).child(j).child(2).child(i).toString().startsWith("<a")) {
                  // a태그인 레코드의 href 속성을 추출해서 list에 저장
                  list.add("http://www.statiz.co.kr/boxscore.php?opt=4&" + day.get(k).child(j).child(2).child(i).attr("href").substring(13));
               }
            }
         }
      }
      System.out.println("파싱 페이지 : " + parsingURL);
      // 저장한 list에서 임의 추출
      int index = (int) (Math.random() * list.size());
      String url = list.get(index);

      System.out.println("타겟 페이지 : " + url);
      return url;
   }

   public static String getRandomName() {

      List<String> 성 = Arrays.asList("김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안", "송", "류", "전", "홍", "고", "문", "양", "손", "배", "조", "백", "허", "유", "남", "심", "노", "정", "하", "곽", "성", "차", "주", "우",
            "구", "신", "임", "나", "전", "민", "유", "진", "지", "엄", "채", "원", "천", "방", "공", "강", "현", "함", "변", "염", "양", "변", "여", "추", "노", "도", "소", "신", "석", "선", "설", "마", "길", "주", "연", "방", "위", "표", "명", "기", "반", "왕", "금", "옥", "육",
            "인", "맹", "제", "모", "장", "남", "탁", "국", "여", "진", "어", "은", "편", "구", "용");
      List<String> 이름 = Arrays.asList("가", "강", "건", "경", "고", "관", "광", "구", "규", "근", "기", "길", "나", "남", "노", "누", "다", "단", "달", "담", "대", "덕", "도", "동", "두", "라", "래", "로", "루", "리", "마", "만", "명", "무", "문", "미", "민", "바", "박", "백",
            "범", "별", "병", "보", "빛", "사", "산", "상", "새", "서", "석", "선", "설", "섭", "성", "세", "소", "솔", "수", "숙", "순", "숭", "슬", "승", "시", "신", "아", "안", "애", "엄", "여", "연", "영", "예", "오", "옥", "완", "요", "용", "우", "원", "월", "위", "유", "윤",
            "율", "으", "은", "의", "이", "익", "인", "일", "잎", "자", "잔", "장", "재", "전", "정", "제", "조", "종", "주", "준", "중", "지", "진", "찬", "창", "채", "천", "철", "초", "춘", "충", "치", "탐", "태", "택", "판", "하", "한", "해", "혁", "현", "형", "혜", "호", "홍",
            "화", "환", "회", "효", "훈", "휘", "희", "운", "모", "배", "부", "림", "봉", "혼", "황", "량", "린", "을", "비", "솜", "공", "면", "탁", "온", "디", "항", "후", "려", "균", "묵", "송", "욱", "휴", "언", "령", "섬", "들", "견", "추", "걸", "삼", "열", "웅", "분", "변",
            "양", "출", "타", "흥", "겸", "곤", "번", "식", "란", "더", "손", "술", "훔", "반", "빈", "실", "직", "흠", "흔", "악", "람", "뜸", "권", "복", "심", "헌", "엽", "학", "개", "롱", "평", "늘", "늬", "랑", "얀", "향", "울", "련");
      Collections.shuffle(성);
      Collections.shuffle(이름);
      return 성.get(0) + 이름.get(0) + 이름.get(1);
   }

   public static void makeTeamMembers(String dummyID, String teamName) {

      String id = dummyID;

      for (int i = 11; i <= 40; i++) {
         System.out.println(String.format(
               "insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL," + "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES(" + "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');",
               id + i, getRandomName(), "MAN", "2000/01/01", "password", "010111100" + i, id + i + "@" + id + ".com", "가산동", Math.ceil(Math.random() * 10000) / 10000.0, Math.ceil(Math.random() * 10000) / 10000.0));
         System.out.println(String.format("insert into teammember(TEAMNAME,ID,NO,SELF,REGISTATUS,REGIDATE ) values (" + "'%s','%s',SEQ_teammember.NEXTVAL,'ㅎㅇㅎㅇ잘지내자','complete',SYSDATE );", teamName, id + i));
      }

   }
   
   public static String getRandomID() {
      
      StringBuffer temp = new StringBuffer();
      Random rnd = new Random();
      for (int i = 0; i < 6; i++) {
         int rIndex = rnd.nextInt(3);
         switch (rIndex) {
         case 0:
            // a-z
            temp.append((char) ((int) (rnd.nextInt(26)) + 97));
            break;
         case 1:
            // A-Z
            temp.append((char) ((int) (rnd.nextInt(26)) + 65));
            break;
         case 2:
            // 0-9
            temp.append((rnd.nextInt(10)));
            break;
         }
      }
      return temp.toString();
   }

   public static void makeTeamMembers(String teamName) {

      String id = getRandomID();

      for (int i = 11; i <= 40; i++) {
         System.out.println(String.format(
               "insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL," + "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES(" + "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');",
               id + i, getRandomName(), "MAN", "2000/01/01", "password", "010111100" + i, id + i + "@" + id + ".com", "가산동", Math.ceil(Math.random() * 10000) / 10000.0, Math.ceil(Math.random() * 10000) / 10000.0));
         System.out.println(String.format("insert into teammember(TEAMNAME,ID,NO,SELF,REGISTATUS,REGIDATE ) values (" + "'%s','%s',SEQ_teammember.NEXTVAL,'ㅎㅇㅎㅇ잘지내자','complete',SYSDATE );", teamName, id + i));
      }
   }

   public static void makeLeaderNMembers(String leaderID, String leaderName, String teamName, String dummyID) {

      System.out.println(String.format(
            "insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL," + "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES(" + "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');", leaderID,
            getRandomName(), "MAN", "2000/01/01", "123123123", (long) (Math.ceil(Math.random() * 10000000000l)), leaderID + "@" + leaderID + ".com", "주작동", Math.ceil(Math.random() * 10000) / 10000.0,
            Math.ceil(Math.random() * 10000) / 10000.0));

      System.out.println(String.format("insert into team(teamname,category,teamloc,teamrating,manager_id,teaminfo,regidate,teamlogo values(" + teamName + ",'baseball','gura',1500," + leaderName + ",'주작팀',SYSDATE,'team_default.jpg'"));

      String id = dummyID;

      for (int i = 11; i <= 40; i++) {
         System.out.println(String.format(
               "insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL," + "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES(" + "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');",
               id + i, getRandomName(), "MAN", "2000/01/01", "password", "010111100" + i, id + i + "@" + id + ".com", "가산동", Math.ceil(Math.random() * 10000) / 10000.0, Math.ceil(Math.random() * 10000) / 10000.0));
         System.out.println(String.format("insert into teammember(TEAMNAME,ID,NO,SELF,REGISTATUS,REGIDATE ) values (" + teamName + "," + id + i + ",SEQ_teammember.NEXTVAL,'ㅎㅇㅎㅇ잘지내자','complete',SYSDATE );"));
      }
   }
   public static void makeLeaderNMembers(String teamName) {

         String leaderID = getRandomID();
         String id = getRandomID();
         String leaderName = getRandomName();
         System.out.println(String.format(
               "insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL," + "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES(" + "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');", leaderID,
               getRandomName(), "MAN", "2000/01/01", "123123123", (long) (Math.ceil(Math.random() * 10000000000l)), leaderID + "@" + leaderID + ".com", "주작동", Math.ceil(Math.random() * 10000) / 10000.0,
               Math.ceil(Math.random() * 10000) / 10000.0));

         System.out.println(String.format("insert into team(teamname,category,teamloc,teamrating,manager_id,teaminfo,regidate,teamlogo) values('" + teamName + "','baseball','gura',1500,'" + leaderName + "','주작팀',SYSDATE,'team_default.jpg');"));

         for (int i = 11; i <= 40; i++) {
            System.out.println(String.format(
                  "insert into member(ID,NAME,GENDER,BIRTH,PWD,PHONE,EMAIL," + "REGIDATE,LOCATION,POINT,PROFILE,PITPOWER,HITPOWER) VALUES(" + "'%s','%s','%s','%s','%s','%s','%s',SYSDATE,'%s',5000,'member_default.jpg', '%s','%s');",
                  id + i, getRandomName(), "MAN", "2000/01/01", "password", "010111100" + i, id + i + "@" + id + ".com", "가산동", Math.ceil(Math.random() * 10000) / 10000.0, Math.ceil(Math.random() * 10000) / 10000.0));
            System.out.println(String.format("insert into teammember(TEAMNAME,ID,NO,SELF,REGISTATUS,REGIDATE ) values ('" + teamName + "','" + id + i + "',SEQ_teammember.NEXTVAL,'ㅎㅇㅎㅇ잘지내자','complete',SYSDATE );"));
         }
      }
   
   
   
   
   

   public static String getInningString(int ci, int co) {

      int o;
      int ip = ci + co / 3;
      double getCO = ((double) ci + (double) co / 3 - ip) * 3;

      if (getCO > 0.9 && getCO < 1.1) {
         o = 1;
      } else if (getCO > 1.9 && getCO < 2.1) {
         o = 2;
      } else {
         o = 0;
      }
      return ip + "." + o;
   }

   public static double getInningDouble(int ci, int co) {

      double o = ci + (double) co / 3;

      return o;
   }

   public static int scoreByNormDist(double myScore, double avgAll, double sigma) {

      NormalDistribution distribution = new NormalDistribution(0, 1);
      double z = (myScore - avgAll) / sigma;
      double rate = distribution.cumulativeProbability(z);

      int score;

      if (rate < distribution.cumulativeProbability(-1.6))
         score = 1; // 5.5%
      else if (rate < distribution.cumulativeProbability(-1.2))
         score = 2; // 11.5%
      else if (rate < distribution.cumulativeProbability(-0.8))
         score = 3; // 21.2%
      else if (rate < distribution.cumulativeProbability(-0.4))
         score = 4; // 34.5%
      else if (rate < distribution.cumulativeProbability(0))
         score = 5; // 50.0%
      else if (rate < distribution.cumulativeProbability(0.4))
         score = 6; // 65.5%
      else if (rate < distribution.cumulativeProbability(0.8))
         score = 7; // 78.8%
      else if (rate < distribution.cumulativeProbability(1.2))
         score = 8; // 88.5%
      else if (rate < distribution.cumulativeProbability(1.6))
         score = 9; // 94.5%
      else
         score = 10; // 100.0%
      return score;

   }

   public static boolean isStringDouble(String s) {
      try {
         Double.parseDouble(s);
         return true;
      } catch (NumberFormatException e) {
         return false;
      }
   }
   
   public static String getRandDay()  {
        int[] maxDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        
        int iMinMonth = 1;
        int iMaxMonth = 12;
        
        int iRandomMonth = (int)(Math.random() * iMaxMonth - iMinMonth + 1) + iMinMonth;
        int iRandomDay = (int)(Math.random() * (maxDays[iRandomMonth-1] -2) + 1);
        
        return "19/"+iRandomMonth+"/"+iRandomDay;
        
    }


   public static void makeGameSchedule(String homeTeam, String awayTeam) {

      String date = getRandDay();

      String time = Double.toString(Math.random() * 10 + 10).substring(0, 2) + "30";
      String[] stadiums = { "화정경기장", "까치산경기장", "구로경기장", "가산경기장", "당산경기장", "홍대경기장", "안국경기장", "논현경기장", "강남경기장", "여의도경기장", "용산경기장", "신촌경기장", "서초경기장", "합정경기장", "대화경기장", "뚝섬경기장", "방배경기장", "정발산경기장", "주엽경기장", "마두경기장", "백석경기장", "상봉경기장", "중랑경기장", "회기경기장", "이태원경기장", "명동경기장", "미추홀경기장", "도곡경기장", "판교경기장", "양재경기장", "성북경기장", "선릉경기장", "종로경기장", "태릉경기장",
            "공릉경기장", "이촌경기장", "이수경기장", "장승배기경기장", "보라매경기장", "독산경기장", "관악경기장", "석계경기장", "노원경기장", "중계경기장", "하계경기장", "청량리경기장", "영등포경기장", "모란경기장", "곤지암경기장", "정자경기장", "서현경기장", "오리경기장", "죽전경기장" };
      String stadium = stadiums[(int) (Math.random() * stadiums.length)];

      String str = "insert into gameschedule(no,gamedate,stadium,time,awayteam,gamestatus,teamname)" + "values(SEQ_GAMESCHEDULE.nextval,'" + date + "','" + stadium + "','" + time + "','" + awayTeam + "',default,'" + homeTeam + "');";

      System.out.println(str);
   }

   public static void manipulateMember(String id, int hitPower, int pitPower) {

      if (hitPower == 3 && pitPower == 3)
         System.out.println("update member set hitpower=0.99, pitpower=0.99 where id='" + id + "';");
      else if (hitPower == 3 && pitPower == 2)
         System.out.println("update member set hitpower=0.99, pitpower=0.85 where id='" + id + "';");
      else if (hitPower == 3 && pitPower == 1)
         System.out.println("update member set hitpower=0.99, pitpower=0.01 where id='" + id + "';");
      else if (hitPower == 2 && pitPower == 3)
         System.out.println("update member set hitpower=0.85, pitpower=0.99 where id='" + id + "';");
      else if (hitPower == 2 && pitPower == 2)
         System.out.println("update member set hitpower=0.85, pitpower=0.85 where id='" + id + "';");
      else if (hitPower == 2 && pitPower == 1)
         System.out.println("update member set hitpower=0.85, pitpower=0.001 where id='" + id + "';");
      else if (hitPower == 1 && pitPower == 3)
         System.out.println("update member set hitpower=0.001, pitpower=0.99 where id='" + id + "';");
      else if (hitPower == 1 && pitPower == 2)
         System.out.println("update member set hitpower=0.001, pitpower=0.85 where id='" + id + "';");
      else if (hitPower == 1 && pitPower == 1)
         System.out.println("update member set hitpower=0.001, pitpower=0.001 where id='" + id + "';");
      else
         System.out.println("hitPower / pitPower의 값 1~3 사이로");
   }

   
   
   
   
   public static void main(String[] args) {

      
      makeLeaderNMembers("한화이글스");
      makeLeaderNMembers("두산베어스");
      makeLeaderNMembers("바르셀로나");
      makeLeaderNMembers("레알마드리드");
      makeLeaderNMembers("맨체스터유나이티드");
      makeLeaderNMembers("아스톤빌라");
      
      /**
      makeLeaderNMembers("NC다이노스");
      makeLeaderNMembers("SK와이번스");
      makeLeaderNMembers("롯데자이언츠");
      makeLeaderNMembers("kt wiz");
      makeLeaderNMembers("엘지트윈스");
      makeLeaderNMembers("맨체스터시티");
      **/
      
      
      /**
      makeGameSchedule("HanWha Eagles", "한화이글스");
      makeGameSchedule("맨체스터시티", "HanWha Eagles");
      makeGameSchedule("엘지트윈스", "HanWha Eagles");
      makeGameSchedule("SK WYVERSE", "kt wiz");
      makeGameSchedule("HanWha Eagles", "NC다이노스");
      makeGameSchedule("HanWha Eagles", "롯데자이언츠");
      makeGameSchedule("두산베어스", "바르셀로나");
      makeGameSchedule("HanWha Eagles", "바르셀로나");
      makeGameSchedule("아스톤빌라", "HanWha Eagles");
      makeGameSchedule("맨체스터시티", "맨체스터유나이티드");
      makeGameSchedule("한화이글스", "HanWha Eagles");
      makeGameSchedule("HanWha Eagles", "엘지트윈스");
      makeGameSchedule("엘지트윈스", "두산베어스");
      makeGameSchedule("두산베어스", "SK WYVERSE");
      makeGameSchedule("SK WYVERSE", "한화이글스");
      makeGameSchedule("SK WYVERSE", "바르셀로나");
      makeGameSchedule("kt wiz", "SK WYVERSE");
      makeGameSchedule("HanWha Eagles", "롯데자이언츠");
      makeGameSchedule("레알마드리드", "HanWha Eagles");
      makeGameSchedule("SK WYVERSE", "레알마드리드");
      makeGameSchedule("롯데자이언츠", "엘지트윈스");
      makeGameSchedule("레알마드리드", "SK WYVERSE");
      makeGameSchedule("SK WYVERSE", "kt wiz");
      makeGameSchedule("SK WYVERSE", "kt wiz");
      **/
      
      
      
      
      

   }

}