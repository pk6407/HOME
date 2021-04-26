package kh.projectfinal.administrative;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdministrativeMapper {
	public List<DraftVo> selectDraftVo(Page page);
	
	public List<StuffVo> selectStuffVo(Page page);
	
	public List<AttendanceVo> selectAttendanceVo(Page page);

	public List<DraftVo> selectMyDraftVo(Page page);
	
	public List<StuffVo> selectMyStuffVo(Page page);
	
	public List<AttendanceVo> selectMyAttendanceVo(Page page);
	
	public List<ApprovalVo> selectMyApprovalVo(Page page);

	public List<ApprovalVo> selectWaitApprovalVo(Page page);
	
	public int getTotListSizeDraft(Page page);

	public int getTotListSizeStuff(Page page);

	public int getTotListSizeAttendance(Page page);

	public int getTotListSizeMyDraft(Page page);

	public int getTotListSizeMyStuff(Page page);

	public int getTotListSizeMyAttendance(Page page);

	public int getTotListSizeMyApproval(Page page);
	
	public int getTotListSizeWaitApproval(Page page);
}
