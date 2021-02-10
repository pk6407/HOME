package com.coffeesazo.mypages.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.mypages.model.service.OrderDetailService;

/**
 * Servlet implementation class OrderDetailDeleteServlet
 */
@WebServlet("/cancelorder")
public class OrderDetailDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		
		HttpSession session = request.getSession();
		String memberId = (String)(session.getAttribute("id"));
		
		String index = request.getParameter("orderIndex");
		int orderIndex = Integer.parseInt(index);
		System.out.println("받아온 파라미터 출력: " + orderIndex);
		
		int affectedRows = new OrderDetailService().deleteOrderDetailList(memberId, orderIndex);
		System.out.println(affectedRows);
		
		if (affectedRows > 0) {
			
			response.sendRedirect("OrderListSelect");
		}
	}

}
