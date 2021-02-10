package com.coffeesazo.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.cart.model.service.CartService;

/**
 * Servlet implementation class CartDeleteAllServlet
 */
@WebServlet("/deleteall")
public class CartDeleteAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String memberid = ((String)session.getAttribute("id"));
		int result = new CartService().CartAllDelete(memberid);
		System.out.println("전체삭제값:" + result);
		String url = "index.jsp?inc=view/order/";
		if(result != 0) {
			RequestDispatcher view = request.getRequestDispatcher(url + "shopping_cart.jsp");
			view.forward(request, response);
		}else {
			System.out.print("<script> alert('잘못된 접근입니다.'); history.back(); </script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
