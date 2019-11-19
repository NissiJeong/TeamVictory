package team.sports.matching.contoller;

import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BaketballController {
	
	@RequestMapping("/Team/Matching/BasketMatching.do")
	public String matching(@RequestParam Map map,Model model, Authentication auth) {
		System.out.println("들오오냐?");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		map.put("id", userDetails.getUsername());
		System.out.println(map.get("id"));
		
		return "member/basketballMatching.tiles";
		
	}

}
