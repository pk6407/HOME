package kh.projectfinal.production;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ProductionManagementDao {
	@Autowired
	ProductionMapper mapper;

	public List<ProductionVo>warehousingSelectVo(){
		List<ProductionVo> list = new ArrayList<ProductionVo>();
		try {
			list = mapper.warehousingSelectVo();
		}catch(Exception e){
			e.printStackTrace();
		}	
			return list;
	}
	public List<ProductionVo>releaseSelectVo(){
		List<ProductionVo> list = new ArrayList<ProductionVo>();
		try {
			list = mapper.releaseSelectVo();
		}catch(Exception e) {
			e.printStackTrace();
		}
			return list;
	}
	public List<ProductionVo>stockSelectVo() {
		List<ProductionVo> list = new ArrayList<ProductionVo>();
		try {
			list = mapper.stockSelectVo();
		}catch(Exception e) {
			e.printStackTrace();
		}	
			return list;
	}
	public List<ProductionVo>warehousingInsert(){
		List<ProductionVo> list = new ArrayList<ProductionVo>();
		try {
			list = mapper.warehousingInsertVo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
