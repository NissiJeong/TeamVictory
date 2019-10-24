package team.sports.matching.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.sports.matching.service.BoardDTO;
import team.sports.matching.service.BoardService;
import team.sports.matching.service.PagingUtil;



//스프링 씨큐리티를 사용하지 않을때
@SessionAttributes("id")
@Controller
public class BoardController {
	//서비스 주입]
	@Resource(name="boardService")
	private BoardService boardService;
	
	
	 @Value("${PAGE_SIZE}") 
	 private int pageSize;
	 
	 @Value("${BLOCK_PAGE}") 
	 private int blockPage;
	
	
	//목록 처리]
	@RequestMapping("/bbs/Board.bbs")
	public String list(
			@ModelAttribute("id") String id,//스프링 씨큐리티를 사용하지 않을때
			@RequestParam Map map,
			Model model,
			HttpServletRequest req,
			@RequestParam(required = false,defaultValue = "1") int nowPage
			) {
		//서비스 호출]
		//페이징을 위한 로직 시작]
	 	//전체 레코드수		
	 	int totalRecordCount=boardService.getTotalRecord(map);	 	
	 	//전체 페이지수]
	 	int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);	 	
	 	//시작 및 끝 ROWNUM구하기]
	 	System.out.println("1:"+pageSize+" 2:"+blockPage);
	 	int start = (nowPage-1)*pageSize+1;
	 	int end   = nowPage*pageSize;
	 	//페이징을 위한 로직 끝]	
	 	map.put("start", start);
	 	map.put("end", end);		
		List<BoardDTO> list=boardService.selectList(map);	
		//데이타 저장]
		
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize, blockPage, nowPage,req.getContextPath()+"/bbs/Board.bbs?");
		//데이타 저장]
		for(BoardDTO dto:list) {
			System.out.println(dto.getTitle());
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		//뷰정보 반환]
		return "bbs/Board.tiles";
	}
	//작성폼으로 이동]
	@ExceptionHandler({HttpSessionRequiredException.class})
	public String notAllowed(Model model) {
		//에러 메시지 저장]
		model.addAttribute("NotMember", "로그인 후 이용하세요");
		//무조건 록인 페이지로 이동]
		return "member/login.tiles";
	}	
	@RequestMapping(value = "/bbs/Write.bbs"/* ,method=RequestMethod.GET */)
	public String write(
			@ModelAttribute("id") String id//스프링 씨큐리티를 사용하지 않을때
			) {
		//뷰정보 반환]
		return "bbs/Write.tiles";
	}
	//작성처리]
	@RequestMapping(value="/bbs/Write.bbs",method=RequestMethod.POST)
	public String writeOk(
			@ModelAttribute("id") String id,//스프링 씨큐리티를 사용하지 않을때
			@RequestParam Map map,
			Authentication auth //스프링 씨큐리티 사용시
			) {
		//서비스 호출]
		//스프링 씨큐리티 사용시 아래코드 추가
		//UserDetails userDetails=(UserDetails)auth.getPrincipal();
		//호출전 아이디 맵에 저장
		map.put("id", id);//씨큐리티 적용전
		//map.put("id",userDetails.getUsername());//씨큐리티 적용후
		
		boardService.insert(map);	
		
		
		//Collection auths=userDetails.getAuthorities();
		//System.out.println("아이디:"+userDetails.getUsername());
		//System.out.println("principal:"+auth.getPrincipal().toString());
		
		
		
		//뷰정보 반환:목록으로 이동
		return "forward:/bbs/Board.bbs";
	}/////////////////////
	//상세보기]
	@RequestMapping("/bbs/View.bbs")
	public String view(@RequestParam Map map,Model model) {
		//서비스 호출]
		BoardDTO record=boardService.selectOne(map);
		//데이타 저장]
		//줄바꿈 처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));
		model.addAttribute("record", record);
		//뷰정보 반환:
		return "bbs/View.tiles";
	}//////////////
	//수정폼으로 이동 및 수정처리]
	@RequestMapping("/bbs/Edit.bbs")
	public String edit(HttpServletRequest req,@RequestParam Map map) {
		if(req.getMethod().equals("GET")) {//수정폼으로 이동
			//서비스 호출]
			BoardDTO record=boardService.selectOne(map);
			//데이타 저장]
			req.setAttribute("record", record);
			//수정 폼으로 이동]
			return "bbs/Edit.tiles";
		}
		//수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
		int sucFail=boardService.update(map);
		req.setAttribute("WHERE", "EDT");
		req.setAttribute("SUCFAIL", sucFail);
		return "bbs/Message";
	}//////////////////
	//삭제처리]
	@RequestMapping("/bbs/Delete.bbs")
	public String delete(@RequestParam Map map,Model model) {
		//서비스 호출]
		int sucFail=boardService.delete(map);
		//데이타 저장]
		model.addAttribute("SUCFAIL", sucFail);
		//뷰정보 반환]
		return "bbs/Message";
	}
}
