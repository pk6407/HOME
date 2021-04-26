package kh.projectfinal.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.projectfinal.mapper.ApprovInterface;
import kh.projectfinal.mapper.EmpInfo;

@Service
public class EmpDao {
	
	@Autowired
	ApprovInterface app;
	
	
	public EmpInfo login(EmpInfo info) {
		
		EmpInfo empInfo = app.myInfo(info);
		
		
		return empInfo;
	}
	
	//결재 메시지가 오면 classNo를 한단계 높여 같은 부서장에게 전달할 메시지 설정
	public EmpInfo approv(EmpInfo upInfo) {
		
		upInfo = approvCnt(upInfo);
		
		return upInfo;
	}
	
	public EmpInfo accept(EmpInfo info) {
		
		
		return info;
	}
	
	public EmpInfo approvCnt(EmpInfo info) {
		System.out.println("\tEmpDao.draftCnt()");
		System.out.println("\t" + info.getEmpNo());
		System.out.println("\t" + info.getEmpName());
		int cnt = 0;
		
		cnt = app.draftCnt(info);
		info.setDraftCnt(cnt);
		
		cnt = app.stuffCnt(info);
		info.setStuffCnt(cnt);
		
		cnt = app.attendCnt(info);
		info.setAttendanceCnt(cnt);
		
		return info;
	}
}
