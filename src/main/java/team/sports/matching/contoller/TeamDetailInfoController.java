
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
public class TeamDetailInfoController {
	
	@Resource(name="teamboard")
	private TeamBoardDAO teamDao;
	
	@RequestMapping(value="/Team/Matching/managementChange.do",method=RequestMethod.POST) 
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
			List<Map> tempList = teamDao.getTeamManagement(tempMap);
			newFileName = tempList.get(0).get("TEAMLOGO").toString();
		}
		
		Map map = new HashMap();
		map.put("USER_ID", userDetails.getUsername());
		map.put("TEAMLOGOFILE", newFileName);
		map.put("TEAMNAMECHANGE", mhsr.getParameter("infoTeamname"));
		map.put("TEAMINFOCHANGE", mhsr.getParameter("infoInfo"));

		int affected = teamDao.TeamManagementChange(map);
		model.addAttribute("SUCFAIL", affected);
		
		System.out.println(affected==1 ? "사진 업로드성공" :  "사진 업로드실패");
		
		return "forward:/Team/Matching/Team.do";
		
		}
		catch(Exception e) {e.printStackTrace();}
		return null;
	}
}