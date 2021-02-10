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
import com.coffeesazo.member.model.dao.MemberDao2;



@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String id =request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("고객 입력 아이디 : "+ id);
		System.out.println("고객 입력 비밀번호 : "+ pwd);
		
		//MemberVo vo = new MemberVo();
		//vo.setMemberId(id);
		//vo.setMemberPwd(pwd);
		System.out.println("vo객체가 생성되었습니다.");
		MemberDao2 dao = new MemberDao2();
		System.out.println("dao객체가 생성되었습니다.");
		int result = dao.signin(id, pwd);
		System.out.println("DB 조회 결과값 :" + result + "(성공 : 0 / 실패 : 1)");
		
		if(result == 0) {
			//로그인성공시
			HttpSession session = request.getSession();
			
			session.setAttribute("isLogOn", true);	//세션에 isLogOn이라는 이름으로 true를 저장
			session.setAttribute("id", id);	//id와 pw를 세션에 저장.
			session.setAttribute("pwd", pwd);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");//임시로 해놨음 -> 로그인 후 메인페이지로 페이지 설정할 것.
			dispatcher.forward(request, response);
		}
		else out.println("<script>alert('아이디 또는 비밀번호를 확인해 주세요.'); history.back();</script>");
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
