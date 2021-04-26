<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/administration/approvalform.css' />
<style>
.hiddenbox{
background-color:transparent;
border:0 solid black;
text-align:right;
}
</style>
</head>
<body>
<div id='approvalWrite'>
	<table id='approvalTable' border="1">
		<tr>
			<td colspan="11"><h3>근태결재서</h3></td>
		</tr>
		<tr>
			<td rowspan="2">대상자</td>
			<td colspan="2">부서</td>
			<td colspan="2">성명</td>
			<td colspan="2">직급</td>
			<td colspan="4">사원번호</td>
		</tr>
		<tr>
			<td colspan="2">　</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td rowspan="2">기간</td>
			<td>년</td>
			<td>월</td>
			<td>일</td>
			<td rowspan="2">부터</td>
			<td>년</td>
			<td>월</td>
			<td>일</td>
			<td rowspan="2">까지</td>
			<td>일간</td>
			<td>구분</td>
		</tr>
		<tr>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td><input type='text' class='date hiddenbox' readonly disabled/></td>
			<td>
				<select name="type" class='hiddenbox' disabled>
					<option value="">휴가</option>
					<option value="">결조</option>
					<option value="">하계</option>
					<option value="">년월차</option>
					<option value="">교육</option>
					<option value="">공과</option>
					<option value="">결근</option>
					<option value="">지각</option>
					<option value="">조퇴</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id='tabelhead'>제목</td>
			<td colspan="10"><input type='text' id='reasonTitle' class='hiddenbox' readonly disabled/></td>
		</tr>
		<tr>
			<td>사유</td>
			<td colspan="10"><textarea id='content' class='hiddenbox' readonly disabled></textarea></td>
		</tr>
		<tr>
			<td colspan="11" id='end'>사유와 같이 근태계를 제출하오니 재가하여 주시기 바랍니다.</td>
		</tr>
		<tr>
			<td rowspan="2">결재인</td>
			<td>과장</td>
			<td>부장</td>
			<td>사장</td>
			<td rowspan="2">비고</td>
			<td rowspan="2" colspan="6"><textarea id='tmi' class='hiddenbox' readonly disabled></textarea></td>
		</tr>
		<tr>
			<td class='stamp'></td>
			<td class='stamp'></td>
			<td class='stamp'></td>
		</tr>
	</table>
	<input type='button' value='취소' onclick="goUrl('/administrationMain');location.href='#행정관리'"/>
	<input type='button' value='부결'/>
	<input type='button' value='승인'/>
</div>
</body>
</html>