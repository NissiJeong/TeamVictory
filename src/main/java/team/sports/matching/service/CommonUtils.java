package team.sports.matching.service;

public class CommonUtils {
	//public static final int WIN = 1;
	//public static final int DRAW = 0;
	//public static final int LOSE = -1;
	
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

}
