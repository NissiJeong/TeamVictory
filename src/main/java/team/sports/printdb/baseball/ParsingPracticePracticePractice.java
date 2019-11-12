package team.sports.printdb.baseball;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.Test;


public class ParsingPracticePracticePractice {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<>();

		list.add(1);list.add(2);list.add(2);list.add(3);list.add(4);list.add(5);list.add(5);list.add(6);list.add(7);list.add(7);list.add(7);list.add(8);list.add(8);list.add(9);

		List<Integer> newList = new ArrayList<>();
		List<Integer> duplicates = new ArrayList<>();
		Set<Integer> set = new HashSet<>();

		for (int i : list) {
			if (set.add(i)) {
				newList.add(i);
			} else {
				duplicates.add(i);
			}
		}
		newList.addAll(duplicates);

		System.out.println(newList);
		
		
		List counter = new ArrayList();
		
		Set<String> testSet = new HashSet<String>();
		
		
		List<String> testList = new ArrayList<String>();
		testList.add("이");testList.add("박");testList.add("박");testList.add("박");testList.add("박");testList.add("이");testList.add("김");testList.add("김");testList.add("김");testList.add("이");testList.add("이");testList.add("박");testList.add("김");testList.add("박");testList.add("최");testList.add("최");testList.add("김");testList.add("최");testList.add("김");testList.add("박");testList.add("최");testList.add("김");testList.add("최");testList.add("김");testList.add("이");testList.add("이");testList.add("최");testList.add("박");testList.add("최");testList.add("박");	testList.add("박");
		StringBuffer buf = new StringBuffer();
		
		for(int i=0;i<testList.size();i++) {
			testSet.add(testList.get(i));
		}
		
		
		
		
		
		
		System.out.println(testSet.toString());
		
		
		
		
		for(String test : testList) {
			if(buf.toString().indexOf(test)==-1) {
				buf.append(test);
				
			}
		}
		Collections.sort(testList, new CompareTest());
		
		System.out.println(testList);
		
	}
	
	
	static class CompareTest implements Comparator<String>{

		@Override
		public int compare(String o1, String o2) {
			
			return 0;
		}        
    }
	
	
	
}
