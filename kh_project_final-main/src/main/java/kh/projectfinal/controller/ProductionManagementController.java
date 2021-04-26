package kh.projectfinal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kh.projectfinal.production.ProductionManagementDao;
import kh.projectfinal.production.ProductionVo;

@RestController
public class ProductionManagementController {

	@Autowired
	ProductionManagementDao dao;
	
	
	
	
	@RequestMapping(value = "/WarehousingSelect", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView WarehousingSelect() {
		ModelAndView mv = new ModelAndView();
		List<ProductionVo> list = dao.warehousingSelectVo();
		mv.addObject("list", list);
		mv.setViewName("ProductionManagement/Warehousing/WarehousingSelect");
		return mv;
	}
	
	@RequestMapping(value= "/WarehousingInsert", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView WarehousingInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Warehousing/WarehousingInsert");
		return mv;
	}
	
	@RequestMapping(value = "/WarehousingUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView WarehousingUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Warehousing/WarehousingUpdate");
		return mv;
	}
	
	@RequestMapping(value = "/WarehousingView", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView WarehousingView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Warehousing/WarehousingView");
		return mv;
	}
	
	@RequestMapping(value = "/WarehousingDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView WarehousingDelect() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Warehousing/WarehousingDelete");
		return mv;
	}
	
	@RequestMapping(value = "/ReleaseSelect", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ReleaseSelect() {
		ModelAndView mv = new ModelAndView();
		List<ProductionVo> list = dao.releaseSelectVo();
		mv.addObject("list", list);
		mv.setViewName("ProductionManagement/Release/ReleaseSelect");
		return mv;
	}
	
	@RequestMapping(value= "/ReleaseInsert", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ReleaseInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Release/ReleaseInsert");
		return mv;
	}
	
	@RequestMapping(value = "/ReleaseUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ReleaseUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Release/ReleaseUpdate");
		return mv;
	}
	
	@RequestMapping(value = "/ReleaseView", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ReleaseView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Release/ReleaseView");
		return mv;
	}
	
	@RequestMapping(value = "/ReleaseDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ReleaseDelect() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Release/ReleaseDelete");
		return mv;
	}
	
	@RequestMapping(value = "/StockSelect", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView StockSelect() {
		ModelAndView mv = new ModelAndView();
		List<ProductionVo> list = dao.stockSelectVo();
		mv.addObject("list", list);
		mv.setViewName("ProductionManagement/Stock/StockSelect");
		return mv;
	}
	
	@RequestMapping(value = "/StockInsert", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView StockInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Stock/StockInsert");
		return mv;
	}
	
	@RequestMapping(value = "/StockUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView StockUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Stock/StockUpdate");
		return mv;
	}
	 
	@RequestMapping(value = "/StockView", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView StockView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ProductionManagement/Stock/StockView");
		return mv;
	
	}	
}