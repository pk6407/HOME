package com.coffeesazo.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.qna.model.service.QnAService;
import com.coffeesazo.qna.model.vo.QnAVo;

import com.coffeesazo.Page;

@WebServlet("/qna")
public class QnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnAServlet() {
        super();
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
		page.setFindStr(findStr);
		
		HttpSession session = request.getSession(); 
		
		ArrayList<QnAVo> qnaList = new QnAService().selectQnAList(page);
		
		if(!qnaList.isEmpty()) {
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("page", page);
			
			String url = "index.jsp?inc=view/qna/";
			RequestDispatcher view = request.getRequestDispatcher(url + "qna.jsp");
			view.forward(request, response);
			System.out.println(qnaList);
		} else {
			out.println("<script>alert('검색 결과가 없습니다..'); history.back(); </script>");
		}	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
