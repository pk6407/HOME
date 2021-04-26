package kh.projectfinal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kh.projectfinal.administrative.AdministrationDao;
import kh.projectfinal.administrative.ApprovalVo;
import kh.projectfinal.administrative.AttendanceVo;
import kh.projectfinal.administrative.DraftVo;
import kh.projectfinal.administrative.Page;
import kh.projectfinal.administrative.StuffVo;

@RestController
public class AdministrationController {

	@Autowired
	AdministrationDao dao;

	@RequestMapping(value = "/myApproval", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myApproval(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<ApprovalVo> list = dao.selectMyApprovalVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/myApproval");
		return mv;
	}

	@RequestMapping(value = "/waitApproval", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView waitApproval(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<ApprovalVo> list = dao.selectWaitApprovalVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/waitApproval");
		return mv;
	}

	@RequestMapping(value = "/stuffTemp", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stuffTemp(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<StuffVo> list = dao.selectStuffVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/stuff/stuffTemp");
		return mv;
	}

	@RequestMapping(value = "/stuffComplete", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stuffComplete(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<StuffVo> list = dao.selectStuffVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/stuff/stuffComplete");
		return mv;
	}

	@RequestMapping(value = "/stuffHold", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stuffHold(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<StuffVo> list = dao.selectStuffVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/stuff/stuffHold");
		return mv;
	}

	@RequestMapping(value = "/stuffRejection", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stuffRejection(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<StuffVo> list = dao.selectStuffVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/stuff/stuffRejection");
		return mv;
	}

	@RequestMapping(value = "/attendanceTemp", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView attendanceTemp(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<AttendanceVo> list = dao.selectMyAttendanceVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/attendance/attendanceTemp");
		return mv;
	}

	@RequestMapping(value = "/attendanceComplete", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView attendanceComplete(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<AttendanceVo> list = dao.selectAttendanceVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/attendance/attendanceComplete");
		return mv;
	}

	@RequestMapping(value = "/attendanceHold", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView attendanceHold(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<AttendanceVo> list = dao.selectAttendanceVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/attendance/attendanceHold");
		return mv;
	}

	@RequestMapping(value = "/attendanceRejection", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView attendanceRejection(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<AttendanceVo> list = dao.selectAttendanceVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/attendance/attendanceRejection");
		return mv;
	}

	@RequestMapping(value = "/draftTemp", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView draftTemp(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<DraftVo> list = dao.selectDraftVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/draft/draftTemp");
		return mv;
	}

	@RequestMapping(value = "/draftComplete", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView draftComplete(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<DraftVo> list = dao.selectDraftVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/draft/draftComplete");
		return mv;
	}

	@RequestMapping(value = "/draftHold", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView draftHold(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<DraftVo> list = dao.selectDraftVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/draft/draftHold");
		return mv;
	}

	@RequestMapping(value = "/draftRejection", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView draftRejection(Page page) {
		ModelAndView mv = new ModelAndView();
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		List<DraftVo> list = dao.selectDraftVo(page);
		mv.addObject("list", list);
		mv.setViewName("administrative/draft/draftRejection");
		return mv;
	}

	@RequestMapping(value = "/draftWrite", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView draftWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("administrative/draft/draftWrite");
		return mv;
	}

	@RequestMapping(value = "/attendanceWrite", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView attendanceWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("administrative/attendance/attendanceWrite");
		return mv;
	}

	@RequestMapping(value = "/stuffWrite", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stuffWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("administrative/stuff/stuffWrite");
		return mv;
	}

	@RequestMapping(value = "/stuffApproval", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stuffApproval() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("administrative/stuff/stuffApproval");
		return mv;
	}

	@RequestMapping(value = "/attendanceApproval", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView attendanceApproval() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("administrative/attendance/attendanceApproval");
		return mv;
	}

	@RequestMapping(value = "/draftApproval", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView draftApproval() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("administrative/draft/draftApproval");
		return mv;
	}
}
