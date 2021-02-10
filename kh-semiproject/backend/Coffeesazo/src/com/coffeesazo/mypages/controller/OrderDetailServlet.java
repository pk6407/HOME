package com.coffeesazo.mypages.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.mypages.model.service.OrderDetailService;
import com.coffeesazo.mypages.model.vo.OrderDetailListVo;


/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/orderdetail")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderDetailServlet() {
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String memberId = ((String)session.getAttribute("id"));
		
		String index = request.getParameter("orderIndex"); // 정수로 고치기
		int orderIndex = Integer.parseInt(index);
		
		System.out.println("받아온 파라미터 출력: " + orderIndex);
		

		List<OrderDetailListVo> orderDetailList = new OrderDetailService().selectOrderDetailList(memberId, orderIndex);
		String orderAddress = orderDetailList.get(0).getOrderAddress();
		String orderText = orderDetailList.get(0).getOrderText();
		String finalOrderAddress = "";
		String[] orderAddressArray = orderAddress.split("\\+");
		
		for (String temp : orderAddressArray) {
			finalOrderAddress += temp + " ";
		}
		
		if (orderText == null) {
			orderDetailList.get(0).setOrderText("요청사항 없음");
		}
		
		
		if (!orderDetailList.isEmpty()) {
			request.setAttribute("orderIndex", orderIndex);
			request.setAttribute("orderDetailList", orderDetailList);
			request.setAttribute("orderAddress", finalOrderAddress);
			String url = "index.jsp?inc=view/mypage/";
			RequestDispatcher rd = request.getRequestDispatcher(url + "mypage_order_detail.jsp");
			rd.forward(request, response);
			
		} else {
			out.println("<script>alert('잘못된 접근입니다.'); history.back(); </script>");
		}

	}

}
