package com.coffeesazo.notice.controller;

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
import com.coffeesazo.notice.model.service.NoticeService;
import com.coffeesazo.notice.model.vo.NoticeVo;
@WebServlet("/notice")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		int nowPage = 1;
		String findStr = "";
		
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
		
		List<NoticeVo> noticeList = new NoticeService().selectNoticeList(page);
	
		if(!noticeList.isEmpty()) {
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("page", page);
			
			String url = "index.jsp?inc=view/notice/";
			RequestDispatcher view = request.getRequestDispatcher(url + "notice.jsp");
			view.forward(request, response);
			System.out.println(noticeList);
		} else {
			out.println("<script>alert('검색 결과가 없습니다.'); history.back(); </script>");
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}