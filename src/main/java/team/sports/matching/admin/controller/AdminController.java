package team.sports.matching.admin.controller;

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
		return String.valueOf(count);
	}
}
