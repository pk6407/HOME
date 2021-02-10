package com.coffeesazo.mypages.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.mypages.model.service.OrderService;

/**
 * Servlet implementation class CartDeleteServlet
 */
@WebServlet("/deleteorder")
public class OrderDeleteServelt extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public OrderDeleteServelt() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */

      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request, response);

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
   
      request.setCharacterEncoding("utf-8");
  		response.setContentType("text/html;charset=UTF-8");
      HttpSession session = request.getSession();
      String memberid = ((String)session.getAttribute("id"));
      String[] checkorder = request.getParameterValues("delete-name");
      
      int[] cod = new int[checkorder.length];
      for(int i=0; i<cod.length ; i++) {
         cod[i] = Integer.parseInt(checkorder[i]);
      }
         int result = new OrderService().OrderDelete(cod,memberid);
         System.out.println("선택삭제 값:"+result);
         

         if(result != 0) {         
            
            response.sendRedirect("OrderListSelect");
         }else {
 			System.out.println("<script>alert('잘못된 접근입니다.'); history.back(); </script>");
         }
   }

}