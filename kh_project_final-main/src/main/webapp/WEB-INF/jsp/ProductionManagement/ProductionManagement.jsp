<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 관리</title>
<link rel='stylesheet' type='text/css' href='css/Production/Production.css' />
<script src='js/ProductionManagement.js'></script>
</head>
<body>
<div id ='ProductionManagementMain'>
	<div id='PmMenu'>
	<ul id=''>
		<li class='Ws'><a href='#입고' onclick="PmgoUrl('/WarehousingSelect')">입고</a></li>
		<li class='Rs'><a href='#출고' onclick="PmgoUrl('/ReleaseSelect')">출고</a></li>
		<li class='Ss'><a href='#재고' onclick="PmgoUrl('/StockSelect')">재고</a></li>
	</ul>
	</div>
	<div id='PmShow'></div>
</div>
</body>
</html>