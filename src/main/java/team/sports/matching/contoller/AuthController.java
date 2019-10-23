package team.sports.matching.contoller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import team.sports.matching.service.MemberDAO;

@SessionAttributes("id")
@Controller
public class AuthController {
	@Resource(name="member")
	private MemberDAO dao;
	
	//로그인 폼으로 이동
	@RequestMapping("/Team/Matching/Login.do")
	public String login() {
		return "member/login.tiles";
	}
	//로그인 처리
	@RequestMapping("/Team/Matching/IsMember.do")
	public String isMember(@RequestParam Map map,Model model) {
		boolean isLogin = dao.isLogin(map);
		if(isLogin) {
			model.addAllAttributes(map);
		}
		else {
			model.addAttribute("NotMember", "아이디와 비밀번호가 일치하지 않습니다");
		}
		return "member/index.tiles";
	}/////isMember
	//로그아웃 처리
	@RequestMapping("/Team/Matching/Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "member/login.tiles";
	}
	@RequestMapping("/sports/join.do")
	public String join(@RequestParam Map map,Model moel) {
		System.out.println("11111");
		System.out.println(map.get("year").toString());
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key).toString());
			
		}
		return "member/registration.tiles";
	}

	//회원가입
	@RequestMapping("/Team/Matching/Registration.do")

	public String registration(@RequestParam Map map, Model model) {

		
		String year = map.get("year").toString();
		String month = map.get("month").toString();
		String day = map.get("day").toString();
		String location = map.get("addr_road").toString();
		map.put("birth", year+month+day); //생년월일
		map.put("location", location); // 지역 
		  for(Object key : map.keySet()) {
		  
		  String value = map.get(key).toString();
		  
		  System.out.println(key+":"+value);
		  
		  }
		  
		int affected = dao.memberRegi(map);
		System.out.println("affected:" +affected);
		return "member/login.tiles";

		}
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/CheckId.do",produces = "text/html; charset=UTF-8")
	public String checkId(@RequestParam Map map) {
		System.out.println("asdf");
		int duple = dao.isDuplicate(map);
		String isdu = "중벅";
		if(duple==0) {
			isdu = "가능";
		}
		return isdu;
	}
	
	@ResponseBody
	@RequestMapping(value ="/Team/Matching/CheckMail.do", produces = "text/html; charset=UTF-8")
	public String checkMail(@RequestParam Map map) {
		System.out.println("들어왔음");
		int duplicated = dao.mIsDuplicate(map);
		String reject = "중복";
		if(duplicated == 0) {
			reject = "가능";
		}
		return reject;
	}

}
