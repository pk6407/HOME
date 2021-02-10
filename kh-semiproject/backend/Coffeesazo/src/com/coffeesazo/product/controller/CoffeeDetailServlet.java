package com.coffeesazo.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coffeesazo.product.model.service.ProductDetailService;
import com.coffeesazo.product.model.vo.Product;


@WebServlet("/CoffeeDetail")
public class CoffeeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        

    public CoffeeDetailServlet() {

    }
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String productname = request.getParameter("List");
		System.out.println("여기까지");
		System.out.println(productname);
		Product List = new ProductDetailService().CoffeeDetail(productname);
		String info = List.getProductInfo();
		String text = List.getProductText();
		String[] infoArray = info.split("\\|");
		String[] textArray = text.split("\\|");
				
 		
		
		
		
		
		if(List != null) {
			request.setAttribute("List", List);
			request.setAttribute("infoArray", infoArray);
			request.setAttribute("textArray", textArray);
			
			String url = "index.jsp?inc=view/shopping/product_detail/";
			RequestDispatcher view = request.getRequestDispatcher(url + "product_detail.jsp");
			view.forward(request, response);
			System.out.println(List);
		} else {
			System.out.print("<script> alert('잘못된 접근입니다.'); history.back(); </script>");
		}	
		
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
