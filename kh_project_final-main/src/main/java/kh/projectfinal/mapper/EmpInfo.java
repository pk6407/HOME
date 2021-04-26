package kh.projectfinal.mapper;

public class EmpInfo {
	String command;
	int empNo;
	int classNo; //직급
	int departNo; // 부서
	String empName;
	int superNo;
	String hireDate;
	String photo;
	String sign;
	
	int draftCnt;
	int stuffCnt;
	int attendanceCnt;

	
	public int getDraftCnt() {
		return draftCnt;
	}
	public void setDraftCnt(int draftCnt) {
		this.draftCnt = draftCnt;
	}
	public int getStuffCnt() {
		return stuffCnt;
	}
	public void setStuffCnt(int stuffCnt) {
		this.stuffCnt = stuffCnt;
	}
	public int getAttendanceCnt() {
		return attendanceCnt;
	}
	public void setAttendanceCnt(int attendanceCnt) {
		this.attendanceCnt = attendanceCnt;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}

	public int getDepartNo() {
		return departNo;
	}
	public void setDepartNo(int departNo) {
		this.departNo = departNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getSuperNo() {
		return superNo;
	}
	public void setSuperNo(int superNo) {
		this.superNo = superNo;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	
	
	
}
