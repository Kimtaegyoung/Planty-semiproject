package com.planty.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.planty.jsp.member.model.dto.UserDTO;
import com.planty.jsp.member.model.service.MemberService;

/**
 * Servlet implementation class changeSerlvet
 */
@WebServlet("/member/change")
public class changeSerlvet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/views/login/change.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserDTO loginUser = (UserDTO ) request.getSession().getAttribute("loginMember");
		String id = loginUser.getId();
		String memberId = loginUser.getId();
		int memberRegNo = loginUser.getRegNo();
		String memberEmail = loginUser.getEmail();
		int EmailCheck = loginUser.getEmailCheck();
		
		
		UserDTO  requestMember = new UserDTO ();
		requestMember.setId(memberId);
		requestMember.setRegNo(memberRegNo);
		requestMember.setEmail(memberEmail);
		requestMember.setEmailCheck(EmailCheck);
		requestMember.setPwd(checkPwd);
		
		String memberPwd = request.getParameter("Pwd"); 

		int result = new MemberService().findPwd(requestMember, memberPwd);

		String page = "";
		
		if(result > 0) {
			request.setAttribute("findPwd", findPwd);
			request.getRequestDispatcher("/WEB-INF/views/login/result-Pwd.jsp").forward(request, response);
			request.setAttribute("successCode", "updateMemberPassword");
		} else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "비밀번호 변경 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
