package kh.projectfinal.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ApprovInterface {
	public EmpInfo myInfo(EmpInfo info);
	public Integer draftCnt(EmpInfo info);
	public Integer stuffCnt(EmpInfo info);
	public Integer attendCnt(EmpInfo info);
}
