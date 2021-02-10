package com.coffeesazo.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coffeesazo.product.model.service.ProductService;
import com.coffeesazo.product.model.vo.Product;


@WebServlet("/capsulecoffee")
public class CapsuleSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CapsuleSelectServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ArrayList<Product> capList = new ProductService().CapsuleSelete();
		
		
		if(!capList.isEmpty()) {
			request.setAttribute("capList", capList);
			String url = "index.jsp?inc=view/shopping/product/";
			RequestDispatcher view = request.getRequestDispatcher(url + "capsule_coffee.jsp");
			view.forward(request, response);
			System.out.println(capList);
		} else {
			System.out.print("<script> alert('잘못된 접근입니다.'); history.back(); </script>");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
