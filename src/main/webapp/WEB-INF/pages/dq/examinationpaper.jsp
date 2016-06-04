<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>尉氏县-党员测试系统</title>
    <link rel="stylesheet" href="<c:url value="/scripts/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/styles/examination.css"/>">
    <script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/jquery.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap.min.js"/>"></script>
</head>
<body>
	<div class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header visible-xs">
				<span id="toggle-mobile-dropdown-nav" style="width: 25%;text-align: left;">考试中...</span>
				<div class="navbar-brand" style="width: 50%;text-align: center;">
				<a href="/"></a>
				</div>
				<a class="toggle-mobile-telephone-nav visible-xs" href="#" style="width: 15%;text-align: right">
				</a>
			</div>
			<div class="navbar-header hidden-xs">
				
			</div>
		</div>
	</div>
	<div class="panel panel-warning">
		  <div class="panel-heading">题目1:</div>
		  <div class="panel-body">
		   	 共产党的建党日期
		  </div>
		   <ul class="list-group">
			    <li class="list-group-item"><input type="radio" name="chkanswer" value="A">A:  Cras justo odio</li>
			    <li class="list-group-item"><input type="radio" name="chkanswer" value="B">B:  Dapibus ac facilisis in</li>
			    <li class="list-group-item"><input type="radio" name="chkanswer" value="C">C:  Morbi leo risus</li>
			    <li class="list-group-item"><input type="radio" name="chkanswer" value="D">D:  Porta ac consectetur ac</li>
		   </ul>
		</div>
</html>
