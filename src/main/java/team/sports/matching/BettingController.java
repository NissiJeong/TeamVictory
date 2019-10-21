package team.sports.matching;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import team.sports.matching.service.BettingDAO;
import team.sports.matching.service.BettingDTO;

@Controller
public class BettingController {
	
	@Resource(name="Betting")
	private BettingDAO bettingDao;

	
	// Top 메뉴 클릭시 
	@RequestMapping("/Team/Matching/Betting.do")
	public String betting(Model model) {
		
		 List<BettingDTO> list = bettingDao.selectList(new HashMap());
		  
		 for (BettingDTO dto :  list) {
			 System.out.print("["+(list.indexOf(dto)+1)+"] ");
			 System.out.println(String.format(
					 "홈팀 : %s 경기일자  : %s 경기장 : %s 경기시간 : %s 팀번호 : %s 어웨이 : %s  게임상태 : %s  홈스코어 : %s  어웨이스코어 : %s" , 
				dto.getHomeTeam(),dto.getGameDate(),dto.getStadium(),dto.getTime(),dto.getBaseTeamNo(),dto.getAwayTeam(),dto.getGameStatus(),dto.getHomeScore(),dto.getAwayScore()   
					 
					 ));
		 }
		 
		 model.addAttribute("list",list);
		
		
		return "member/in-play.tiles";
	}
	
	@RequestMapping("/Team/Matching/BettingView.do")
	public String bettingView() {
		
		return "member/BettingView.tiles";
		
	}
	
	
}
