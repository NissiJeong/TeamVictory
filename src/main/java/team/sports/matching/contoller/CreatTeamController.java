package team.sports.matching.contoller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;

import com.oreilly.servlet.MultipartRequest;

import team.sports.matching.service.MemberDAO;
import team.sports.matching.service.TeamBoardDAO;
import team.sports.matching.service.TeamBoardDTO;
import team.sports.matching.service.TeamDTO;
import team.sports.matching.service.impl.MatchDAO;


@Controller
public class CreatTeamController /*implements HandlerExceptionResolver*/ {
	@Resource(name="member")
	private MemberDAO dao;
	@Resource(name="teamboard")
	private TeamBoardDAO teamDao;
	
	
	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public String isNotMember(Model model) {
		model.addAttribute("MaxExceed", "파일 최대 용량 2MB");
		//로그인이 안된 경우 로그인 페이지로
		return "member/CreateTeam.tiles";
	}
	//팀 만들기 
	@RequestMapping(value="/Team/matching/teamJoin.do",method=RequestMethod.POST)
	public String createTeam(MultipartHttpServletRequest mhsr,Authentication auth,Model model) throws IllegalStateException,IOException {
		//System.out.println("에러날때 들어오나?");
		//1]서버의 물리적 경로 얻어오기
		String path = mhsr.getSession().getServletContext().getRealPath("/Upload");
		//System.out.println(path);
		MultipartFile upload = mhsr.getFile("upload");
		//파일객체 생성
		String newFileName = FileUpDownUtils.getNewFileName(path, upload.getOriginalFilename());
		File file = new File(path+File.separator+newFileName);
		//3]업로드 로직
		upload.transferTo(file);
		//System.out.println(mhsr.getParameter("teamName"));
		Map map = new HashMap();
		map.put("teamName", mhsr.getParameter("teamName"));
		map.put("teamLogo", newFileName);
		map.put("category", mhsr.getParameter("category"));
		map.put("teamLoc", mhsr.getParameter("teamLoc"));
		map.put("teamInfo", mhsr.getParameter("teamInfo"));
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		for(Object key:map.keySet()) {
			System.out.println(key+":"+map.get(key));
		}
		//System.out.println("id:"+userDetails.getUsername());
		int affected = dao.teamInsert(map);
		if(affected==1) {
			int confirm = dao.insertTeamMember(map);
			if(confirm==0) {
				dao.deleteTeam(map);
				affected = 0;
			}			
		}		
		model.addAttribute("SUCFAIL", affected);
		return "member/Message";
	}///
	/*
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> model = new HashMap<String, Object>();
        if (ex instanceof MaxUploadSizeExceededException)
        {
        	mav.addObject("maxError", "파일 최대 용량 2MB 초과");
    		
        } else
        {
        	mav.addObject("maxError", "파일 최대 용량 2MB 초과");
        }
        
        InternalResourceView view = new InternalResourceView();
		view.setUrl("/Team/Matching/createTeam.do");
		mav.setView(view);
        return mav;		
<<<<<<< HEAD
	}
	*/
=======
	}*/
>>>>>>> branch 'master' of https://github.com/NissiJeong/TeamVictory.git
}
