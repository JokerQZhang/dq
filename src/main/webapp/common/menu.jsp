<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<menu:useMenuDisplayer name="Velocity" config="navbarMenu.vm" permissions="rolesAdapter">
<div class="collapse navbar-collapse" id="navbar">
<ul class="nav navbar-nav">
    <c:if test="${empty pageContext.request.remoteUser}">
        <li class="active">
            <a href="<c:url value="/login"/>"><fmt:message key="login.title"/></a>
        </li>
    </c:if>
    <menu:displayMenu name="AdminMenu"/>
    <menu:displayMenu name="FacilityMgnMenu"/>
    <menu:displayMenu name="PartyMgnMenu"/>
    <menu:displayMenu name="ForPeopleMenu"/>
    <menu:displayMenu name="SunShineMenu"/>
</ul>

<ul class="nav navbar-nav navbar-right" style="margin-right:10px;padding:10px;">
<li title="修改密码"><a href="<c:url value="/editProfile"/>" class="btn btn-default btn-sm" style="padding:5px;color:#5bc0de;"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;${currentPerson.name}</a></li>
<li title="退出系统"><a href="<c:url value="/logout"/>" class="btn btn-default btn-sm" style="padding:5px;color:red;"><i class="glyphicon glyphicon-off"></i></a></li>
</ul>
</div>
</menu:useMenuDisplayer>
