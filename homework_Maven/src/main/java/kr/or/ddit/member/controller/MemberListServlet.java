package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberSerivce;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
@WebServlet("/member/memberList.do")
public class MemberListServlet extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*1. 요청과의 매핑설정
		2. 요청 분석(주소, 파리미터,메소드 ,헤더들)/...
		3.bll와의 의존관게형성
		4.로직선택
		5.컨텐츠(모델) 확보
		6.v.l선택
		7. scope를 통해 모델 공유
		8. 이동 방식 결정 . 이동~
		*/
	
		IMemberSerivce serivce=MemberServiceImpl.getInstance();
		List<MemberVO> memberList= serivce.retrieveMemberList();
		String view="/WEB-INF/views/member/memberList.jsp";
		if(memberList.size()>0) {
			req.setAttribute("memberList", memberList );
			RequestDispatcher rd= req.getRequestDispatcher(view);
			rd.forward(req, resp);
		}else {
			resp.sendError(404);
		}
		
		
	
	
	
	}
}
