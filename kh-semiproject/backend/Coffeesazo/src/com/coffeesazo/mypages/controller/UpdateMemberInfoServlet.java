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
 * Servlet implementation class UpdateMemberInfoServlet
 */
@WebServlet("/mypage_edit.update")
public class UpdateMemberInfoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberInfoServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		String memberId = ((String)session.getAttribute("id"));
		String originalMemberPwd = request.getParameter("originalMemberPwd");
		String newMemberPwd = request.getParameter("newMemberPwd");
		String originalMemberPhone = request.getParameter("originalMemberPhone");
		String newMemberPhone = request.getParameter("newMemberPhone");
		String originalMemberEmail = request.getParameter("originalMemberEmail");
		String newMemberEmail = request.getParameter("newMemberEmail");
		String memberZipcode = request.getParameter("memberZipcode");
		String[] memberAddressArray = request.getParameterValues("memberAddress");
		
		String memberAddress = "";
		String memberPwd = ""; 
		String memberEmail = "";
		String memberPhone = "";
		
		for(int i=0; i<memberAddressArray.length; i++) {
			if(memberAddressArray[i] != "") {
				memberAddress += memberAddressArray[i] + "+";
			}
		}
		
		if (newMemberPwd == "") {
			memberPwd = originalMemberPwd;
		} else {
			memberPwd = newMemberPwd;
		}
		
		if (newMemberEmail == "") {
			memberEmail = originalMemberEmail;
		} else {
			memberEmail = newMemberEmail;
		}
		
		if (newMemberPhone == "") {
			memberPhone = originalMemberPhone;
		} else {
			memberPhone = newMemberPhone;
		}
		
		System.out.println(memberAddress);
		System.out.println(originalMemberPwd);
		System.out.println(newMemberPwd);
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMemberId(memberId);
		memberVo.setMemberPwd(memberPwd);
		memberVo.setMemberEmail(memberEmail);
		memberVo.setMemberPhone(memberPhone);
		memberVo.setMemberZipcode(memberZipcode);
		memberVo.setMemberAddress(memberAddress);
		
		int affectedRows = new MemberDao().updateMemberInfo(memberVo);
		
		if (affectedRows > 0) {
//			RequestDispatcher rd = request.getRequestDispatcher("mypage_edit");
//			rd.forward(request, response);
			
			response.sendRedirect("mypage_edit");
		}
		
	}

}
