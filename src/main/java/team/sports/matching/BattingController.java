package team.sports.matching;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BattingController {

	
	@RequestMapping("/Team/Matching/Betting.do")
	public String betting() {
		return "member/in-play.tiles";
	}
}