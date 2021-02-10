package com.coffeesazo.notice.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.coffeesazo.notice.model.service.NoticeService;
import com.coffeesazo.notice.model.vo.NoticeVo;

@WebServlet("/noticedetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeDetailServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 

		String index = request.getParameter("noticeIndex");
		int noticeIndex = Integer.parseInt(index);

		System.out.println("받아온 파라미터 출력");
		System.out.println(request.getParameter("noticeIndex"));

		NoticeVo noticevo = new NoticeService().selectNoticeDetailList(noticeIndex);		

		if(noticevo != null) {

			request.setAttribute("noticeIndex", noticeIndex);
			request.setAttribute("noticevo", noticevo);
			String url = "index.jsp?inc=view/notice/";
			RequestDispatcher view = request.getRequestDispatcher(url + "notice_detail.jsp");
			view.forward(request, response);

		} else {
			response.sendRedirect("");
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
