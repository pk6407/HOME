package com.coffeesazo.qna.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.coffeesazo.member.model.vo.MemberVo;
import com.coffeesazo.qna.model.dao.FileUpload;
import com.coffeesazo.qna.model.dao.QnADao;
import com.coffeesazo.qna.model.vo.QnAVo;



@MultipartConfig(
		
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
		)

@WebServlet("/qnawrite")
public class QnAWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(); 
		String memberid = ((String)session.getAttribute("id"));

		String qnaTitle = request.getParameter("title");
		System.out.println(qnaTitle);
		String qnaText = request.getParameter("content");
		System.out.println(qnaText);

		Collection<Part> parts = request.getParts();//다중파일받기위한
		StringBuilder builder = new StringBuilder();//디비에 다중 파일 넣을 때 이름 구분위해
				
		for(Part p : parts) {
			if(!p.getName().equals("file")) continue;
			if(p.getSize()==0) continue;

			Part filePart = p;
			String fileName = filePart.getSubmittedFileName();
			builder.append(fileName);
			builder.append(",");
			
			InputStream fis =filePart.getInputStream();

			String realPath = request.getServletContext().getRealPath("/upload");
			System.out.println(realPath);

			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);

			byte[] buf = new byte[1024];
			int size=0;
			while((size= fis.read(buf)) != -1)
				fos.write(buf,0,size);

			fos.close();
			fis.close();
		}
		
		builder.delete(builder.length()-1, builder.length());//마지막파일명에서 , 빼기위한
		
		QnADao dao = new QnADao();
		System.out.println("dao객체가 생성되었습니다.");
		int result = dao.updateqna(memberid , qnaTitle, qnaText, builder.toString()); 
		System.out.println("DB 조회 결과값 :" + result + "(성공 : 1 / 실패 : 0)");

		if(result == 1) {
			//업데이트성공시

			response.sendRedirect("qna");
			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher("qna");
			 * dispatcher.forward(request, response);
			 */
		}
		else out.println("<script>alert('등록에 실패하였습니다..'); history.back();</script>");




	}
}
