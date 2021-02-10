package com.coffeesazo.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coffeesazo.member.model.dao.MemberDao;
import com.coffeesazo.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberServlet
 */

// 회원가입 처리 서블릿 
@WebServlet("/signup.do")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String url = "index.jsp?inc=view/signup/";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("memberPhone");
		String memberZipcode = request.getParameter("memberZipcode");
		String[] memberAddressArray = request.getParameterValues("memberAddress");
		
		String memberAddress = "";

		for(int i=0; i<memberAddressArray.length; i++) {
			if (memberAddressArray[i] != "") {
				memberAddress += memberAddressArray[i] + "+";
			}
		}

		MemberVo memberVo = new MemberVo();
		memberVo.setMemberId(memberId);
		memberVo.setMemberPwd(memberPwd);
		memberVo.setMemberName(memberName);
		memberVo.setMemberEmail(memberEmail);
		memberVo.setMemberPhone(memberPhone);
		memberVo.setMemberZipcode(memberZipcode);
		memberVo.setMemberAddress(memberAddress);

		int affectedRows = new MemberDao().signup(memberVo);
		RequestDispatcher rd = null;

		if(affectedRows > 0) {
			rd = request.getRequestDispatcher(url + "signup_complete.jsp");
			request.setAttribute("memberId", memberVo.getMemberId());
			rd.forward(request, response);
		} else {
			out.print("<script> alert('잘못된 접근입니다. '); history.back(); </script>");
		}
	}

}
