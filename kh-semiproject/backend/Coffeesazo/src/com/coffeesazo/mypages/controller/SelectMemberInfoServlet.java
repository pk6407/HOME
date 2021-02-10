package com.coffeesazo.mypages.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffeesazo.member.model.dao.MemberDao;
import com.coffeesazo.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberListServlet
 */

@WebServlet("/mypage_edit")
public class SelectMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String url = "index.jsp?inc=view/mypage/";

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
		String memberId = ((String)session.getAttribute("id"));

		List<MemberVo> memberInfoList = new MemberDao().selectMemberInfo(memberId);
		System.out.println(memberId);
		System.out.println(memberInfoList.toString());

		String memberAddress = memberInfoList.get(0).getMemberAddress();
		String memberZipcode = memberInfoList.get(0).getMemberZipcode();
		System.out.println(memberAddress);
		
		String mainAddress = "";
		String detailAddress = "";
		String extraAddress = "";
		
		if (memberAddress != null) {
			String[] addressArray = memberAddress.split("\\+");

			mainAddress = addressArray[0];
			detailAddress = addressArray[1];
			extraAddress = addressArray[2];
		}
		
		if (memberZipcode == null) {
			memberZipcode = "";
		}

		RequestDispatcher rd = request.getRequestDispatcher(url + "Mypage_edit.jsp");
		request.setAttribute("memberInfoList", memberInfoList);
		request.setAttribute("mainAddress", mainAddress);
		request.setAttribute("detailAddress", detailAddress);
		request.setAttribute("extraAddress", extraAddress);
		request.setAttribute("memberZipcode", memberZipcode);

		rd.forward(request, response);
	}

}
