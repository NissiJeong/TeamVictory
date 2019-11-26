package team.sports.matching.contoller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jdk.nashorn.internal.runtime.JSONListAdapter;
import team.sports.matching.service.BaseBall_HitterDAO;
import team.sports.matching.service.TeamBoardDAO;
import team.sports.printdb.baseball.BaseBall_HitterDTO;
import team.sports.printdb.baseball.HitterDTO;

@Controller
public class SearchTeamController {
	
	@Resource(name="teamboard")
	private TeamBoardDAO teamDao;
	
	//가입신청
	@RequestMapping(value="/Team/Matching/TeamMemberInsert.do",method=RequestMethod.POST) 
	public String profileChange(MultipartHttpServletRequest mhsr,Authentication auth,Model model) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		//System.out.println("에러날때 들어오나?");
		//1]서버의 물리적 경로 얻어오기
		String path = mhsr.getSession().getServletContext().getRealPath("/Upload");
		//System.out.println(mhsr.getParameter("teamName"));
		Map map = new HashMap();
		map.put("USER_ID", userDetails.getUsername());
		map.put("SIGNTEAMNAME", mhsr.getParameter("SIGNTEAMNAME")); 
		map.put("SIGNUPNAME", mhsr.getParameter("SIGNUP-NAME"));
		map.put("SIGNUPSELF", mhsr.getParameter("SIGNUP-SELF"));
		
		System.out.println("================서치님 정보넘어오나");
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		//System.out.println("id:"+userDetails.getUsername());
		int affected = teamDao.insertTeamMember(map);
		
		model.addAttribute("SUCFAIL", affected);
		return "member/TeamMessage";
	}
}