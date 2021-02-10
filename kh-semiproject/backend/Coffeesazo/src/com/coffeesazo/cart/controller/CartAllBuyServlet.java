package com.coffeesazo.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.cart.model.service.CartService;
import com.coffeesazo.cart.model.vo.Cart;
import com.coffeesazo.cart.model.vo.OrderMember;

/**
 * Servlet implementation class CartAddAllServlet
 */
@WebServlet("/allbuy")
public class CartAllBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartAllBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//요청사항 모든 텍스트 등등 을 utf-8인코딩해서 가져와라
		response.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession(); //나 세션을 가지고올래
		String memberid = ((String)session.getAttribute("id"));
		//뇌절오는부분 -- 50%이해햇다 아주칭찬해
		ArrayList<Cart> pList = new CartService().SelectCartList(memberid);
		int allresult = 0;
		for(Cart plist : pList) {
		    int price = plist.getProductPrice();
		    int count = plist.getOrderCount();
		    allresult += price * count;
		    }
		//주문자정보
		OrderMember om = new CartService().SearchMember(memberid);
		
		if(!pList.isEmpty()) {
			request.setAttribute("pList", pList);
			request.setAttribute("allresult", allresult);
			request.setAttribute("om", om);
			String url = "index.jsp?inc=view/order/";
			RequestDispatcher view = request.getRequestDispatcher(url + "shopping_payment.jsp");
			view.forward(request, response);
			System.out.println(pList);
			
			
		} else {
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
