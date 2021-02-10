package com.coffeesazo.cart.controller;

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

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.coffeesazo.cart.model.service.CartService;
import com.coffeesazo.cart.model.vo.Cart;
import com.coffeesazo.member.model.vo.MemberVo;

/**
 * Servlet implementation class CartSelectServlet
 */
@WebServlet("/cart")
public class CartSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public CartSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		System.out.println(allresult);
		    if(pList !=null) {
		    	
		    }
			request.setAttribute("pList", pList);
			request.setAttribute("allresult", allresult);
			String url = "index.jsp?inc=view/order/";
			RequestDispatcher view = request.getRequestDispatcher(url + "shopping_cart.jsp");
			view.forward(request, response);
			System.out.println(pList);
		
	    
		
		
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
