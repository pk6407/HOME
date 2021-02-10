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

import com.coffeesazo.cart.model.service.CartService;
import com.coffeesazo.cart.model.vo.Cart;
import com.coffeesazo.cart.model.vo.CartCompare;
import com.coffeesazo.cart.model.vo.OrderIndex;
import com.coffeesazo.cart.model.vo.OrderMember;

/**
 * Servlet implementation class CartAddOneServlet
 */
@WebServlet("/cartaddone")
public class CartOneBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartOneBuyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니 버튼과 바로구매버튼 여기다가만듬
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String clicks = request.getParameter("servlet");
		int click = 0;
		int check = 0;
		int cal = 0;
		click = Integer.parseInt(clicks);	

		HttpSession session = request.getSession();
		String memberid = ((String)session.getAttribute("id"));

		switch (click) {
		//장바구니추가
		case 1:
			String pi = request.getParameter("product_index");
			int productIndex= Integer.parseInt(pi);
			String productImage = request.getParameter("product_image");
			String productName = request.getParameter("product_name");
			String pp = request.getParameter("product_price");
			int productPrice = Integer.parseInt(pp);
			String oc = request.getParameter("product_count");
			int orderCount = Integer.parseInt(oc);


			ArrayList<Cart> pList = new CartService().SelectCartList(memberid);


			CartCompare cartcompare = new CartCompare();
			cartcompare.setOrderCount(orderCount);
			cartcompare.setProductImage(productImage);
			cartcompare.setProductIndex(productIndex);
			cartcompare.setProductName(productName);
			cartcompare.setProductPrice(productPrice);
			System.out.println("장바구니도는횟수"+pList.size());
			if(pList.size() == 0) {
				int addcart = new CartService().CartAddOne(memberid,cartcompare);
				System.out.println("인서트 횟수:" + addcart);
				if(addcart != 0 ) {
					out.println("<script>alert('장바구니에 추가되었습니다.');  history.back(); </script>");
					out.close();
					break;
				}
			}
			if(pList.size() > 0) {
				for(int i = 0 ; i<pList.size() ; i++) {
					System.out.println("들어옴");
					int compare1 = pList.get(i).getProductIndex();
					System.out.println("compare1 ="+compare1);
					int count1 = pList.get(i).getOrderCount();
					System.out.println("count1 = "+count1);
					int compare2 = cartcompare.getProductIndex();
					System.out.println("compare2 ="+compare2);
					int count2 = cartcompare.getOrderCount();
					System.out.println("count2 = " + count2);
					if(compare1 == compare2) {
						check = 1;
						cal = count1 + count2;
						System.out.println("체크버튼"+check);
						break;
					}



				}
				
			}


			if( check == 1) {
				System.out.println("같은인덱스");
				
				System.out.println(cal);
				int updatecart = new CartService().UpdateCart(memberid,cartcompare,cal);
				
				if(updatecart != 0 ) {
					System.out.println("updatecart:" + updatecart);
					out.println("<script>alert('장바구니에 추가되었습니다.');  history.back(); </script>");
					out.close();
					
				}
				break;
			}


			if (check == 0) {
				System.out.println("다른인덱스");
				int addcart = new CartService().CartAddOne(memberid,cartcompare);
				System.out.println("인서트 횟수:" + addcart);
				if(addcart != 0 ) {
					out.println("<script>alert('장바구니에 추가되었습니다.');  history.back(); </script>");
					out.close();
					break;
				}

			}

















			//바로구매
		case 2:
			String pi2 = request.getParameter("product_index");
			int productIndex2= Integer.parseInt(pi2);
			String productImage2 = request.getParameter("product_image");
			String productName2 = request.getParameter("product_name");
			String pp2 = request.getParameter("product_price");
			int productPrice2 = Integer.parseInt(pp2);
			String oc2 = request.getParameter("product_count");
			int orderCount2 = Integer.parseInt(oc2);

			//주문자정보때 필요한 사항
			OrderMember om = new CartService().SearchMember(memberid);


			CartCompare cartcompare2 = new CartCompare();
			cartcompare2.setOrderCount(orderCount2);
			cartcompare2.setProductImage(productImage2);
			cartcompare2.setProductIndex(productIndex2);
			cartcompare2.setProductName(productName2);
			cartcompare2.setProductPrice(productPrice2);

			int addcart2 = new CartService().CartAddOne(memberid,cartcompare2);
			ArrayList<Cart> pList2 = new CartService().SelectCartList(memberid);
			int allresult = 0;

			Cart lastElement = null;
			if(!pList2.isEmpty()) {
				lastElement = pList2.get(pList2.size() - 1);
			}
			int price = lastElement.getProductPrice();
			int count = lastElement.getOrderCount();
			allresult = price*count;
			if(!pList2.isEmpty()) {
				request.setAttribute("lastElement", lastElement);
				request.setAttribute("allresult", allresult);
				request.setAttribute("om", om);
				String url = "index.jsp?inc=view/order/";
				RequestDispatcher view = request.getRequestDispatcher(url + "shopping_payment_buyitnow.jsp");
				view.forward(request, response);
				System.out.println(pList2);


			} 


		default:
			break;
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
