package com.coffeesazo.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coffeesazo.member.model.dao.MemberDao;

/**
 * Servlet implementation class EmailDuplicatdCheckServlet
 */
@WebServlet("/EmailDuplicatedCheckServlet")
public class EmailDuplicatedCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String memberEmail = request.getParameter("memberEmail"); 
		
		MemberDao memberDao = new MemberDao();
		response.getWriter().write(memberDao.emailDuplicatedCheck(memberEmail) + "");
	}

}
