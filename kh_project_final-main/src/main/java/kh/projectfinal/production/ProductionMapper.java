package kh.projectfinal.production;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;



@Repository
@Mapper
public interface ProductionMapper {
	
	public List<ProductionVo> warehousingSelectVo();
	public List<ProductionVo> releaseSelectVo();
	public List<ProductionVo> stockSelectVo();
	public List<ProductionVo> warehousingInsertVo();
}
