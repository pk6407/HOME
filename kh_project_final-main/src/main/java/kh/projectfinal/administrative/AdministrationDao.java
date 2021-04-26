package kh.projectfinal.administrative;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdministrationDao {

	@Autowired
	AdministrativeMapper mapper;
	
	public List<DraftVo> selectDraftVo(Page page) {
		List<DraftVo> list = null;
		System.out.println("selectDraftVo()");
		try {
			int totListSize = mapper.getTotListSizeDraft(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = mapper.selectDraftVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<StuffVo> selectStuffVo(Page page) {
		System.out.println("selectStuffVo()");
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		
		List<StuffVo> list = null;
		try {
			int totListSize = mapper.getTotListSizeStuff(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			
			list = mapper.selectStuffVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list.size());
		return list;
	}
	
	public List<AttendanceVo> selectAttendanceVo(Page page) {
		List<AttendanceVo> list = null;
		System.out.println("selectAttendanceVo()");
		try {
			int totListSize = mapper.getTotListSizeAttendance(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = mapper.selectAttendanceVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<DraftVo> selectMyDraftVo(Page page) {
		List<DraftVo> list = null;
		System.out.println("selectMyDraftVo()");
		try {
			int totListSize = mapper.getTotListSizeMyDraft(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = mapper.selectMyDraftVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<StuffVo> selectMyStuffVo(Page page) {
		System.out.println("selectMyStuffVo()");
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		
		List<StuffVo> list = null;
		try {
			int totListSize = mapper.getTotListSizeMyStuff(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			
			list = mapper.selectMyStuffVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AttendanceVo> selectMyAttendanceVo(Page page) {
		List<AttendanceVo> list = null;
		System.out.println("selectMyAttendanceVo()");
		try {
			int totListSize = mapper.getTotListSizeMyAttendance(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = mapper.selectMyAttendanceVo(page);
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list.size());
		return list;
	}
	
	public List<ApprovalVo> selectMyApprovalVo(Page page) {
		List<ApprovalVo> list = null;
		System.out.println("selectMyApprivalVo()");
		try {
			int totListSize = mapper.getTotListSizeMyApproval(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = mapper.selectMyApprovalVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ApprovalVo> selectWaitApprovalVo(Page page) {
		List<ApprovalVo> list = null;
		System.out.println("selectWaitApprovalVo()");
		try {
			int totListSize = mapper.getTotListSizeWaitApproval(page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = mapper.selectWaitApprovalVo(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
