package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.CommonException;
import kr.or.ddit.member.service.IMemberSerivce;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/member/memberView.do")
public class MemberViewServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mem_id=req.getParameter("who");
		if(StringUtils.isBlank(mem_id)) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		IMemberSerivce serivce= MemberServiceImpl.getInstance();
		String view="/WEB-INF/views/member/memberView.jsp";
		System.out.println(mem_id);
		int status=0;
		MemberVO member=null;
		RequestDispatcher rd =req.getRequestDispatcher(view);
		try{
		member=serivce.retrieveMember(mem_id);
		if(member!=null) {
			req.setAttribute("member", member);
			rd.forward(req, resp);
		}
			
		}catch(CommonException e){
			resp.sendError(404, e.getMessage());
			return;
		}
		
	
	
	}
}
