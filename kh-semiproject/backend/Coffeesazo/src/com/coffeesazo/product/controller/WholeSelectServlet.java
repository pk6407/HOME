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


@WebServlet("/wholebean")
public class WholeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public WholeSelectServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ArrayList<Product> beanList = new ProductService().WholeSelete();
		
		if(!beanList.isEmpty()) {
			request.setAttribute("beanList", beanList);
			String url = "index.jsp?inc=view/shopping/product/";
			RequestDispatcher view = request.getRequestDispatcher(url + "whole_bean.jsp");
			view.forward(request, response);

		} else {
			System.out.print("<script> alert('잘못된 접근입니다.'); history.back(); </script>");
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
