
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
import team.sports.printdb.baseball.BaseBall_HitterDTO;
import team.sports.printdb.baseball.HitterDTO;

@Controller
public class MemberDetailInfoController {
	
	@Resource(name="BaseBall_Hitter")
	private BaseBall_HitterDAO hitterDAO;
	
	@RequestMapping(value="/Team/Matching/profileChange.do",method=RequestMethod.POST) 
	public String profileChange(MultipartHttpServletRequest mhsr,Authentication auth,Model model) {
		try {
		//1]서버의 물리적 경로 얻어오기
		String path = mhsr.getSession().getServletContext().getRealPath("/Upload");
		System.out.println(path);
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		MultipartFile upload = mhsr.getFile("upload");
		
		//파일객체 생성
		String newFileName = "";
		System.out.println(upload.getOriginalFilename());
		if(upload.getOriginalFilename()!="") {
			newFileName = FileUpDownUtils.getNewFileName(path, upload.getOriginalFilename());
			File file = new File(path+File.separator+newFileName);
			upload.transferTo(file);
		}
		else {
			Map tempMap = new HashMap();
			tempMap.put("USER_ID", userDetails.getUsername());
			List<Map> tempList = hitterDAO.getProfile(tempMap);
			newFileName = tempList.get(0).get("PROFILE").toString();
		}
		
		Map map = new HashMap();
		map.put("USER_ID", userDetails.getUsername());
		
		map.put("MEMBERPROFILE", newFileName);
		map.put("LOCATION_2", mhsr.getParameter("infoDetailAddress").trim());
		map.put("LOCATION", mhsr.getParameter("sample4_roadAddress"));
		map.put("BIRTH", mhsr.getParameter("infoBirth").replaceAll("[^0-9]", "").trim());
		map.put("PHONE", mhsr.getParameter("infoCall").replaceAll("[^0-9]", "").trim());
		

		int affected = hitterDAO.profileChange(map);
		model.addAttribute("SUCFAIL", affected);		
		
		System.out.println(affected==1 ? "사진 업로드성공" :  "사진 업로드실패");
		
		return "forward:/Team/Matching/statostics.do";
		
		}
		catch(Exception e) {e.printStackTrace();}
		return null;
	}
	
	@RequestMapping(value="/Team/Matching/playerChange.do", method=RequestMethod.POST) 
	public String playerChange(HttpServletRequest req,Authentication auth,Model model) {
		try {
		Map map = new HashMap();
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("USER_ID", userDetails.getUsername());
		
		map.put("SCHOOL", req.getParameter("infoSchool").trim());
		map.put("WEIGHT", req.getParameter("infoWeight").replaceAll("[^0-9]", "").trim());
		map.put("HEIGHT", req.getParameter("infoHeight").replaceAll("[^0-9]", "").trim());
		
		int affected = hitterDAO.playerChange(map);
		model.addAttribute("SUCFAIL", affected);		
		
		System.out.println(affected==1 ? "업데이트 성공" :  "업데이트 실패");
		
		return "forward:/Team/Matching/statostics.do";
		
		}
		catch(Exception e) {e.printStackTrace();}
		return null;
	}
	
	
	
	
	
	@RequestMapping(value="/Team/Matching/memberInfo.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> memberInfo(@RequestParam Map map, Authentication auth ) {
		System.out.println("memberInfo 소환!!!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.memberInfo(map);
		
		String phone = details.get(0).get("PHONE").toString();
		if(phone.length()==11) {
			phone = phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7);
			details.get(0).put("PHONE", phone.trim());
		}
		
		String birth = details.get(0).get("BIRTH").toString();
		
		if(birth.length()==8) {
			birth = birth.substring(0, 4)+"년 "+birth.substring(4, 6)+"월 "+birth.substring(6, 8)+"일";
		}
		else if(birth.length()==7) {
			birth = birth.substring(0, 4)+"년 "+birth.substring(4, 5)+"월 "+birth.substring(5, 7)+"일";
		}
		
		details.get(0).put("BIRTH", birth.trim());
		
		return details;
	}
	
	@RequestMapping(value="/Team/Matching/playerInfo.do", method = RequestMethod.POST) 
	public @ResponseBody List<Map> playerInfo(@RequestParam Map map, Authentication auth ) {
		System.out.println("playerInfo 소환!!!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		
		map.put("USER_ID", userDetails.getUsername().toString());
		
		List<Map> details = hitterDAO.playerInfo(map);
		
		return details;
	}
	
	
	
}

