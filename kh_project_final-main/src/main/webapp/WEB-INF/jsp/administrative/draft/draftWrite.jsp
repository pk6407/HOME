<%@page import="kh.projectfinal.mapper.EmpInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	EmpInfo info = (EmpInfo)session.getAttribute("emp");
	int classNo = info.getClassNo();
	String className = null;
	if(classNo == 1) { className = "사원"; } else
	if(classNo == 2) { className = "과장"; } else
	if(classNo == 3) { className = "부장"; } else
	if(classNo == 4) { className = "사장"; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/administration/approvalform.css' />
<script src='js/administration.js'></script>
</head>
<body>
<div id='approvalWrite'>
<form name='frm_approval' method='post' id='frm_approval'>
	<table id='approvalTable' border="1">
		<tr>
			<td colspan="11"><h3>기안결재서</h3></td>
		</tr>
		<tr>
			<td rowspan="2">작성자</td>
			<td colspan="2">부서</td>
			<td colspan="2">성명</td>
			<td colspan="2">직급</td>
			<td colspan="4">사원번호</td>
		</tr>
		<tr>
			<td colspan="2"><%= info.getDepartNo() %></td>
			<td colspan="2"><%= info.getEmpName() %></td>
			<td colspan="2"><%= className %></td>
			<td colspan="4"><%= info.getEmpNo() %></td>
		</tr>

		<tr>
			<td id='tabelhead'>제목</td>
			<td colspan="10"><input type='text' name='title' id='reasonTitle'/></td>
		</tr>
		<tr>
			<td>목적</td>
			<td colspan="10"><textarea id='contentsmall' name='subject'></textarea></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="10"><textarea id='content' name='purpose'></textarea></td>
		</tr>
		<tr>
			<td rowspan="2">결재인</td>
			<td>과장</td>
			<td>부장</td>
			<td>사장</td>
			<td rowspan="2">비고</td>
			<td rowspan="2" colspan="6"><textarea id='tmi' name='remark'></textarea></td>
		</tr>
		<tr>
			<td class='stamp'></td>
			<td class='stamp'></td>
			<td class='stamp'></td>
		</tr>
	</table>
	<input type='file' name='attach' multiple='multiple' id='fileUpload'/>
	<input type='button' value='취소' onclick="goUrl('/administrationMain');location.href='#행정관리'"/>
	<input type='button' value='작성중지'/>
	<input type='button' value='임시보관'/>
	<input type='button' id='btnSave' value='확인'/>
	<input type='hidden' name='emp_no' value='<%= info.getEmpNo() %>'/>
	
	<c:set var="classNo" value="<%= info.getClassNo() %>"/>
	<c:choose>
    <c:when test="${classNo == 1}">
	<input type='hidden' name='staff' value='<%= info.getEmpNo() %>'/>
	<input type='hidden' name='gm' value='<%= info.getSuperNo() %>'/>
	<input type='hidden' name='dm' disabled='disabled'/>
	<input type='hidden' name='ceo' disabled='disabled'/>
    </c:when>
    <c:when test="${classNo == 2}">
	<input type='hidden' name='staff' disabled='disabled'/>
	<input type='hidden' name='gm' value='<%= info.getEmpNo() %>'/>
	<input type='hidden' name='dm' value='<%= info.getSuperNo() %>'/>
	<input type='hidden' name='ceo' disabled='disabled'/>
    </c:when>
    <c:when test="${classNo == 3}">
	<input type='hidden' name='staff' disabled='disabled'/>
	<input type='hidden' name='gm' disabled='disabled'/>
	<input type='hidden' name='dm' value='<%= info.getEmpNo() %>'/>
	<input type='hidden' name='ceo' value='<%= info.getSuperNo() %>'/>
    </c:when>
    <c:otherwise>
	<input type='hidden' name='staff' disabled='disabled'/>
	<input type='hidden' name='gm' disabled='disabled'/>
	<input type='hidden' name='dm' disabled='disabled'/>
	<input type='hidden' name='ceo' value=<%= info.getEmpNo() %>/>
    </c:otherwise>
	</c:choose>
</form>
<script>app()</script>
</div>
</body>
</html>