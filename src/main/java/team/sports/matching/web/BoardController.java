package team.sports.matching.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import team.sports.matching.service.impl.BoardDAO;

//스프링 씨큐리티를 사용하지 않을때
//@SessionAttributes("id")
@Controller
public class BoardController {
	// 서비스 주입]
	@Resource(name = "boardServiceDAO")
	private BoardDAO boardService;

	@Value("${PAGE_SIZE}")
	private int pageSize;

	@Value("${BLOCK_PAGE}")
	private int blockPage;

	// 목록 처리]
	@RequestMapping("/Team/Matching/Board.do")
	public String list(
		@RequestParam Map map, Model model, HttpServletRequest req,
		@RequestParam(required = false, defaultValue = "1") int nowPage) {
		// 서비스 호출]
		// 페이징을 위한 로직 시작]
		// 전체 레코드수
		int totalRecordCount = boardService.getTotalRecord(map);
		// 전체 페이지수]
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		// 시작 및 끝 ROWNUM구하기]		
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		// 페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = boardService.selectList(map);
		// 데이타 저장]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/Team/Matching/Board.do?");
		// 데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);	
		model.addAttribute("pageSize", pageSize);
		System.out.println(map.get("searchWord"));
		// 뷰정보 반환]
		return "community/bbs/Board.tiles";
	}

	// 작성폼으로 이동]
	@RequestMapping(value = "/Team/Matching/Write.do"/* ,method=RequestMethod.GET */)
	public String write() {
		// 뷰정보 반환]
		return "community/bbs/Write.tiles";
	}

	// 작성처리]
	@RequestMapping(value = "/Team/Matching/Write.do", method = RequestMethod.POST)
	public String writeOk(@RequestParam Map map, Authentication auth // 스프링 씨큐리티 사용시
	) {
		// 서비스 호출]
		// 스프링 씨큐리티 사용시 아래코드 추가
		 UserDetails userDetails=(UserDetails)auth.getPrincipal();
		// 호출전 아이디 맵에 저장
		//map.put("id", id);// 씨큐리티 적용전
		 map.put("id",userDetails.getUsername());//씨큐리티 적용후

		boardService.insert(map);

		// Collection auths=userDetails.getAuthorities();
		// System.out.println("아이디:"+userDetails.getUsername());
		// System.out.println("principal:"+auth.getPrincipal().toString());

		// 뷰정보 반환:목록으로 이동
		return "forward:/Team/Matching/Board.do";
	}/////////////////////
	
	// 상세보기]
	@RequestMapping("/Team/Matching/View.do")
	public String view(@RequestParam Map map, Model model, HttpServletRequest req, HttpServletResponse res) {
		/*
		 * Cookie[] cookies = req.getCookies();
		 * 
		 * if(cookies!=null && cookies.length > 0){
		 * 
		 * for(int i =0;i< cookies.length;i++){
		 * 
		 * System.out.println("쿠키명: "+cookies[i].getName()+",쿠키 값:"+cookies[i].getValue(
		 * ));
		 * 
		 * }
		 * 
		 * }
		 */
		//조회수 올리는 코드
		boardService.getCountNo(map);
		/*
		 * // 서비스 호출] BoardDTO record = boardService.selectOne(map); 
		 * // 데이타 저장] 
		 * // 줄바꿈 처리 
		 * record.setContent(record.getContent().replace("\r\n", "<br/>"));
		 * model.addAttribute("record", record);
		 */
		// 뷰정보 반환:
		return "forward:/Team/Matching/Board.do";//community/bbs/View.tiles
	}//////////////
	
	// 수정폼으로 이동 및 수정처리]
	@RequestMapping("/Team/Matching/Edit.do")
	public String edit(HttpServletRequest req, HttpServletResponse res,@RequestParam Map map) {
		//쿠키 생성
		Cookie cookie = new Cookie("no","numCount");
		
		if (req.getMethod().equals("GET")) {// 수정폼으로 이동
			
			//쿠키 추가
			res.addCookie(cookie);
			// 서비스 호출]
			BoardDTO record = boardService.selectOne(map);
			// 데이타 저장]
			req.setAttribute("record", record);
			// 수정 폼으로 이동]
			return "community/bbs/Edit.tiles";
			
		}
		System.out.println("야발려차야발");
		// 수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
		int sucFail = boardService.update(map);
		req.setAttribute("WHERE", "EDT");
		req.setAttribute("SUCFAIL", sucFail);
		cookie=null;
		return "community/bbs/Message";
	}//////////////////
	
	// 삭제처리]
	@RequestMapping("/Team/Matching/Delete.do")
	public String delete(@RequestParam Map map, Model model) {
		// 서비스 호출]
		int sucFail = boardService.delete(map);
		// 데이타 저장]
		model.addAttribute("SUCFAIL", sucFail);
		// 뷰정보 반환]
		return "community/bbs/Message";
	}
}
