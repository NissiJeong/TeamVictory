package team.sports.matching.contoller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		return "member/login.tiles";
	}/////isMember
	//로그아웃 처리
	@RequestMapping("/Team/Matching/Louout.do")
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
}
