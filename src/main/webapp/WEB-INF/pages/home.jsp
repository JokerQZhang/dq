<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="home.title"/></title>
    <meta name="menu" content="Home"/>
</head>
<body class="home">
<blockquote>
<p>尊敬的<mark> <em>${currentPartyGroupList[0].groupName}</em></mark> 用户 <mark>${currentPerson.name}</mark> 您好，欢迎使用本系统</p>
<footer>您是本月第X次登录本系统，本系统用户中排名：Y位</footer>
</blockquote>
<hr>
<h3>您有以下事项急需完善</h3>
<dl>
	<dt>1.“三会一课”记录工作</dt>
	<dd>本月“三会一课”记录上报不及时，点击<a href="<c:url value="/dq/dqHuies"/>">三会一课填报</a>及时填报</dd>
	<dt>2.党费缴纳上报</dt>
	<dd>当月党费缴纳未上报，点击<a href="<c:url value="/dq/cpChargeOper"/>">党费管理</a>及时缴纳上报</dd>
</dl>
</body>