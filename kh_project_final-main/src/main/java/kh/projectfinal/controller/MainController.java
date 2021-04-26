package kh.projectfinal.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

	@RequestMapping(value = "/administrationMain", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView administrationMain() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("administrative/administrationMain");
		return mv;
	}
	
	@RequestMapping(value = "/ProductionManagement", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ProductionManagement() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ProductionManagement/ProductionManagement");
		return mv;
	}
}
