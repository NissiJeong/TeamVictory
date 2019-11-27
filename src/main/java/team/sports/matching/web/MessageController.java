package team.sports.matching.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.sports.matching.service.MessageDTO;
import team.sports.matching.service.PagingUtil;
import team.sports.matching.service.impl.MessageDAO;

@Controller
public class MessageController{
	
	@Resource(name="messageDAO")
	private MessageDAO messageDao;
	
	@Value("${PAGE_SIZE}")
	private int pageSize;

	@Value("${BLOCK_PAGE}")
	private int blockPage;

	// 목록 처리]
	@RequestMapping("/Team/admin/qa.do")
	public String list(
		@RequestParam Map map, Model model, HttpServletRequest req,
		@RequestParam(required = false, defaultValue = "1") int nowPage) {
		// 서비스 호출]	
		// 전체 레코드수
		int totalRecordCount = messageDao.getTotalRecord(map);
		// 전체 페이지수]
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		// 시작 및 끝 ROWNUM구하기]		
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		// 페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		List<MessageDTO> list = messageDao.selectList(map);
		// 데이타 저장]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/Team/admin/qa.do?");
		// 데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);	
		model.addAttribute("pageSize", pageSize);		
		// 뷰정보 반환]
		return "/admin/qa.tiles";
	}

	
	// 작성처리]
		@RequestMapping("Team/Matching/contactWrite.do")
		public String insert(@RequestParam Map map, Authentication auth // 스프링 씨큐리티 사용시
		) {
			// 서비스 호출]
			// 스프링 씨큐리티 사용시 아래코드 추가
			 UserDetails userDetails=(UserDetails)auth.getPrincipal();
			// 호출전 아이디 맵에 저장
			//map.put("id", id);// 씨큐리티 적용전
			 map.put("id",userDetails.getUsername());//씨큐리티 적용후
			messageDao.insert(map);
			
			// 뷰정보 반환:목록으로 이동
			return "/member/contact.tiles";
		}/////////////////////
		
		// 상세보기]
		@RequestMapping("/Team/admin/Qview.do")
		public String view(@RequestParam Map map, Model model, HttpServletRequest req, HttpServletResponse res) {
		
			// 뷰정보 반환:
			return "/admin/Qview.tiles";
		}//////////////
		
		// 삭제처리]
		@RequestMapping("/Team/admin/QDelete.do")
		public String delete(@RequestParam Map map, Model model) {
			// 서비스 호출]
			int sucFail = messageDao.delete(map);
			// 데이타 저장]
			model.addAttribute("SUCFAIL", sucFail);
			// 뷰정보 반환]
			return "admin/QMessage";
		}
}