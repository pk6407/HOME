package kh.projectfinal.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.projectfinal.mapper.EmpInfo;
import kh.projectfinal.member.EmpDao;

@RestController
public class ApprovController {
	
	@Autowired
	EmpDao dao;
	
	@RequestMapping("/login.do")
	public String login(@ModelAttribute EmpInfo empInfo, HttpServletRequest req) {
		System.out.println("ApprovController.login---------------------");
		System.out.println("emp : " + empInfo.getEmpNo());
		System.out.println("emp : " + empInfo.getEmpName());
		
		// 로그인 정보를 사용하여 사원정보와 결재정보를 가져옴.
		EmpInfo info = dao.login(empInfo);
		
		//session에 로그인 정보 저장
		HttpSession session = req.getSession();
		session.setAttribute("emp", info);
		
		// 결재정보를 내정보를 사용하여 가져옴.
		info = dao.approvCnt(info);
		
		Gson gson = new Gson();
		String json = gson.toJson(info);
		System.out.println("login json=" + info);
		
		return json;
	}
	

	@RequestMapping("/approv.do")
	public String approv(@ModelAttribute EmpInfo upInfo, HttpServletRequest req) {
		System.out.println("ApprovController.approv ---------------------");
		//session에 로그인 정보 저장
		HttpSession session = req.getSession();
		EmpInfo info = (EmpInfo)session.getAttribute("emp");
		
	
		// 결재정보를 내정보를 사용하여 가져옴.
		upInfo = dao.approv(upInfo);
		
		Gson gson = new Gson();
		String json = gson.toJson(upInfo);
		System.out.println("approv json=" + info);
		
		return json;
	}
	
	@RequestMapping("/accept.do")
	public String accept(HttpServletRequest req) {
		System.out.println("ApprovController.accept ---------------------");

		//session에 로그인 정보 저장
		HttpSession session = req.getSession();
		EmpInfo info = (EmpInfo)session.getAttribute("emp");
		
	
		// 결재정보를 내정보를 사용하여 가져옴.
		info = dao.accept(info);
		
		Gson gson = new Gson();
		String json = gson.toJson(info);
		System.out.println("accept json=" + info);
		
		return json;
	}

	@RequestMapping("logout.do")
	public void logout(HttpServletResponse resp, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.removeAttribute("emp");
		try {
			resp.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void outputTest(EmpInfo info) {
		System.out.println("mapper after");
		System.out.println("empName : " + info.getEmpName());
		System.out.println("classNo : " + info.getClassNo());
		System.out.println("DepartNo : " + info.getDepartNo());
		System.out.println("classNo : " + info.getClassNo());
		System.out.println("departNo: " + info.getDepartNo());
		System.out.println("supperNo : " + info.getSuperNo());
		System.out.println("hireDate : " + info.getHireDate());
		System.out.println("photo : " + info.getPhoto());
		System.out.println("sign :" + info.getSign());
		
	}
	
	
}
