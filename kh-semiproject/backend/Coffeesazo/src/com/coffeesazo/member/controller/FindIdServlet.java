package com.coffeesazo.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.coffeesazo.member.model.dao.MemberDao2;


@WebServlet("/findid")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String name =request.getParameter("name");
		String email = request.getParameter("email");
		
		System.out.println("고객 입력 이름 : "+ name);
		System.out.println("고객 입력 이메일 : "+ email);
		
		//MemberVo vo = new MemberVo();
		//vo.setMemberId(id);
		//vo.setMemberPwd(pwd);
		MemberDao2 dao = new MemberDao2();
		System.out.println("dao객체가 생성되었습니다.");
		//MemberVo vo =new MemberVo();
		//System.out.println("vo객체가 생성되었습니다.");
		String result = dao.findid(name,email);
		System.out.println("DB 조회 결과값 :" + result + "(성공 : 값이 들어있음 / 실패 : null)");
		
		
		if(result != null) {
			
			// mail server 설정
			String host = "smtp.gmail.com";
			String user = "coffeesazo.cop";
			String password = "nhbvidfaawgyxejz";

			// 메일 받을 주소
			/* String to_email = m.getEmail(); */
			String to_email = email;

			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");
			
			props.put("mail.smtp.socketFactory.port","465");
			props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback","false");

			// 인증 번호 생성기
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String AuthenticationKey = temp.toString();
			System.out.println("인증번호 : " + AuthenticationKey);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "COFFEESAZO"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("안녕하세요 COFFEESAZO 인증 메일입니다.");
				// 메일 내용
				msg.setText("인증 번호는 :" + temp + "입니다.");

				Transport.send(msg);
				System.out.println("이메일 전송");

			} catch (Exception e) {
				e.printStackTrace();
			}
			HttpSession session2 = request.getSession(false);
			session2.setAttribute("AuthenticationKey", AuthenticationKey);	
			System.out.println(AuthenticationKey);
			session2.setAttribute("result", result);
			
			//request.setAttribute("id", "vo.getMemberId");
			//session1.setAttribute("email", email);
			
			//request.setAttribute("id", vo.getMemberId());
			
			// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
			/*
			 * req.setAttribute("id", memberId);
			 * req.getRequestDispatcher("/views/login_myPage/searchPasswordEnd.jsp").forward
			 * (req, resp);
			 */
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?inc=view/signin/find_id_2step.jsp");
			dispatcher.forward(request, response);
		
		}
		
		else out.println("<script>alert('입력하신 정보로 일치하는 회원이 없습니다.'); history.back();</script>");
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
