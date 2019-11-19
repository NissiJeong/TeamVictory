package team.sports.matching.contoller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import team.sports.matching.UserSha256;
import team.sports.matching.mail.MailUtils;
import team.sports.matching.mail.TempKey;
import team.sports.matching.service.MemberDAO;

@SessionAttributes("id")
@Controller
public class AuthController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="member")
	private MemberDAO dao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인 폼으로 이동
	@RequestMapping("/Team/Matching/Login.do")
	public String login() { 
		return "member/login.tiles";
	}
	

	//로그인 처리
	/*@RequestMapping("/Team/Matching/IsMember.do")
	public String isMember(@RequestParam Map map,Model model) {
		
		String path;
		String dataPass = dao.selectPass(map);
		if(passwordEncoder.matches(map.get("pass").toString(), dataPass )){
			System.out.println("계정정보 일치");
			path = "member/index.tiles";
		}else{
			System.out.println("계정정보 불일치");
			path="member/login.tiles";
		}
		/*boolean isLogin = dao.isLogin(map);
		System.out.println("12312");
		if(isLogin) {
			model.addAllAttributes(map);
			path = "member/index.tiles";
		}
		else {
			model.addAttribute("NotMember", "아이디와 비밀번호가 일치하지 않습니다");
			path="member/login.tiles";
		}*/
		/*System.out.println("여기를 거치는거냐!!!!!!");
		return path;
	}/////isMember*/
	/*
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
	}*/

	//회원가입
	@RequestMapping("/Team/Matching/Registration.do")
	public String registration(@RequestParam Map map, Model model) throws Exception{
		
		String year = map.get("year").toString();
		String month = map.get("month").toString();
		String day = map.get("day").toString();
		String location = map.get("addr_road").toString();
		map.put("birth", year+month+day); //생년월일
		map.put("location", location); // 지역 
		
		//System.out.println("사용자가 적은 암호: "+map.get("pass").toString());
		//String encryPass = UserSha256.encrypt(map.get("pass").toString());
		//map.put("pass", encryPass);
		//System.out.println("암호화된 암호: "+map.get("pass").toString());
		String encryPass = passwordEncoder.encode(map.get("pass").toString());
		map.put("pass", encryPass);
		  for(Object key : map.keySet()) {
		  
		  String value = map.get(key).toString();
		  
		  //System.out.println(key+":"+value);
		  
		  }
		int comple= 0;
		int affected = dao.memberRegi(map);
		if(affected==1) {
			comple = dao.regiAuth(map);
			//System.out.println("가입됐다");
			//System.out.println(comple);
		}
		if(comple == 0 ) {
			//System.out.println("???");
			dao.deleteMember(map);
		}
		
		/////email
        String mailkey = new TempKey().getKey(50, false);
        map.put("mailkey", mailkey);
        dao.updateMailkey(map);
        
        MailUtils sendMail = new MailUtils(mailSender);
        
        sendMail.setSubject("[ ★SPORTING★ World Wide Sports Betting Clubs] 회원가입 이메일 인증");
        sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
        									.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
							                .append("<a href='http://localhost:8080/matching/Team/Matching/Login.do")
							                .append("' target='_blenk'>이메일 인증 확인</a>")
							                .toString());
        sendMail.setFrom("songsig22@gmail.com", "admin");
        sendMail.setTo(map.get("email").toString());
        sendMail.send();
        
		/*
		 * .append(map.get("id")) .append("&email=") .append(map.get("email"))
		 * .append("&mailkey=") .append(mailkey)
		 */
		
		System.out.println("affected:" +affected);
		return "member/login.tiles";

	}////////
	
	@ResponseBody
	@RequestMapping(value="/Team/Matching/CheckId.do",produces = "text/html; charset=UTF-8")
	public String checkId(@RequestParam Map map) {
		
		//System.out.println("checkId");
		//System.out.println("asdf");
		for(Object key : map.keySet()) {
			//System.out.println(key+":"+map.get(key));
		}
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
		//System.out.println("들어왔음");
		int duplicated = dao.mIsDuplicate(map);
		String reject = "중복";
		if(duplicated == 0) {
			reject = "가능";
		}
		return reject;
	}

	

}
