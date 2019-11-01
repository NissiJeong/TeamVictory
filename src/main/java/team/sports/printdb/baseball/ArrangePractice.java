package team.sports.printdb.baseball;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class ArrangePractice {

	 public static void main(String[] args) {
	        List<Integer> list = new ArrayList();

	        list.add(1);
	        list.add(2);
	        list.add(2);
	        list.add(3);
	        list.add(4);
	        list.add(5);
	        list.add(5);
	        list.add(6);
	        list.add(7);
	        list.add(7);
	        list.add(7);
	        list.add(8);
	        list.add(8);
	        list.add(9);

	        List<Integer> newList = new ArrayList(); 
	        List<Integer> duplicates = new ArrayList(); 
	        Set<Integer> set = new HashSet<>(); 
	        /*
	        for (int i : list) {
	            if(set.add(i)) { 
	                newList.add(i);
	            } else { 
	                duplicates.add(i);
	            }
	        }
	        */
	        
	        for(int i=0; i<list.size();i++) {
	       
	        	if(set.add(list.get(i))) { 
	                newList.add(list.get(i));
	            }
	        	else { 
	                duplicates.add(list.get(i));
	            }
	        }
	        
	        
	        

	        newList.addAll(duplicates); 

	        System.out.println(newList); 
	    }

}
