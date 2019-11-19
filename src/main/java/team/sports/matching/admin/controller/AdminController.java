package team.sports.matching.admin.controller;

import java.util.List;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.sports.matching.admin.service.AdminDAO;

@Controller
public class AdminController{
	
	@Resource(name="admin")
	private AdminDAO dao;
	int count;
	List<Integer> countList = new Vector<Integer>();
	int newCount=0;
	
	//관리자 페이지로 이동
	@RequestMapping("/Team/admin/AdminIndex.do")
	public String moveAdminIndex() { 
		//System.out.println("12312312312");
		return "admin/index";
	}///////
	
	@ResponseBody
	@RequestMapping("/Team/admin/scheduleUpdate.do")
	public String scheduleUpdate() {
		//System.out.println("1231");
				
		count = dao.selectSchedule(null);
		countList.add(count);
		
		
		if(countList.size()>=2) {
			if(countList.get(countList.size()-1)>countList.get(countList.size()-2)) {
				newCount = countList.get(countList.size()-1)-countList.get(countList.size()-2);
			}
		}
		return String.valueOf(newCount);
	}
	
	@ResponseBody
	@RequestMapping("/Team/admin/scheduleCount.do")
	public String scheduleCount() {
		newCount = 0;
		return null;
	}
}
