package com.coffeesazo.mypages.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.Page;
import com.coffeesazo.member.model.dao.MemberDao;
import com.coffeesazo.member.model.vo.MemberVo;
import com.coffeesazo.mypages.model.service.MyQnaService;
import com.coffeesazo.mypages.model.vo.MyQnaList;


@WebServlet("/MyQnaList")
public class MyQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyQnaListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String memberid = ((String)session.getAttribute("id"));

		List<MyQnaList> qnaList = new MyQnaService().SelectQnaList(memberid);
		int nowPage = 1;
		String findStr = "";
		List<MemberVo> memberInfoList = new MemberDao().selectMemberInfo(memberid);
		System.out.println(memberid);
		System.out.println(memberInfoList.toString());

		String memberName = memberInfoList.get(0).getMemberName();
		String memberId = memberInfoList.get(0).getMemberId();
		System.out.println("멤버이름"+memberName);
		Page page = null;

		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		if(request.getParameter("findStr") != null) {
			findStr = request.getParameter("findStr");
		}

		page = new Page();
		page.setNowPage(nowPage);
		System.out.println(page.getNowPage());
		page.setFindStr(findStr);



		List<MyQnaList> qnaPage = new MyQnaService().selectQnaPageList(page ,memberid);

		if(qnaPage != null) {
			request.setAttribute("qnaList", qnaPage);
			request.setAttribute("page", page);

			String url = "index.jsp?inc=view/mypage/";
			RequestDispatcher view = request.getRequestDispatcher(url + "Mypage_qna.jsp");
			request.setAttribute("memberId", memberId);
			request.setAttribute("memberName", memberName);
			view.forward(request, response);
			System.out.println(qnaPage);
		} else {
			out.println("<script>alert('잘못된 접근입니다.'); history.back(); </script>");
		}

	}

}



