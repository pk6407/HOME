package com.coffeesazo.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/auth")
public class FindIdAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	
	
		
		String auth_number =request.getParameter("auth_number");
		System.out.println("고객이 입력한 인증번호 : " + auth_number);
		
	
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		String result = (String)request.getSession().getAttribute("result");
		
		
		if(!AuthenticationKey.equals(auth_number))
        {
			out.println("<script>alert('인증번호가 일치하지 않습니다.'); history.back();</script>"); 
            
        }
		else {
			request.setAttribute("result", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?inc=view/signin/find_id_success.jsp");
			dispatcher.forward(request, response); 
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
