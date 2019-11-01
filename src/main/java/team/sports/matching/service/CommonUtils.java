package team.sports.matching.service;

public class CommonUtils {
	
	  private static double calcRating(double aRating, double bRating, int matchCount, int isWin) {   
	      
	      int k=64;
	      double atemp;
	      double btemp;
	      
	      if(matchCount<=5) k=64;
	      else if(matchCount<=10) k=48;
	      else if(matchCount>10) k=32;
	      
	      double aPower = Math.pow(10, (aRating-1500)/400);
	      double bPower = Math.pow(10, (bRating-1500)/400);
	      
	      
	      if(isWin==1) {
	         atemp = aRating + k* 1/(1+Math.pow(10,((aRating-bRating)/400)));
	         btemp = bRating - k* 1/(1+Math.pow(10,((aRating-bRating)/400)));
	         
	      }
	      else if(isWin==0) {
	         
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
