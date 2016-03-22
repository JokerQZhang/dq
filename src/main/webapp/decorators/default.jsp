<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<c:url value="/images/favicon.ico"/>"/>
    <title><decorator:title/> | <fmt:message key="webapp.name"/></title>
    <t:assets type="css"/>
    <t:assets type="js"/>
    <decorator:head/>
    <style>
	.custom-combobox {
	  position: relative;
	  display: inline-block;
	}
	.custom-combobox-toggle {
	  position: absolute;
	  top: 0;
	  bottom: 0;
	  margin-left: -1px;
	  padding: 0;
	}
	.custom-combobox-input {
	  margin: 0;
	  padding: 5px 10px;
	}
	</style>
</head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/> style="font-family:Microsoft YaHei,arial !important;background:rgba(138, 234, 16, 0.16);">
    <c:set var="currentMenu" scope="request"><decorator:getProperty property="meta.menu"/></c:set>

    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value='/'/>" style="padding-top:0px;"><img src="<c:url value='/images/bottomlog.png'/>"></a>
        </div>

        <%@ include file="/common/menu.jsp" %>
        <c:if test="${pageContext.request.locale.language != 'zh'}">
            <div id="switchLocale"><a href="<c:url value='/?locale=zh'/>">
                <fmt:message key="webapp.name"/> in Chinese</a>
            </div>
        </c:if>
    </div>

    <div class="container" id="content">
        <div class="row">
            <decorator:body/>

            <c:if test="${currentMenu == 'AdminMenu'}">
                <div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="AdminMenu"/>
                </menu:useMenuDisplayer>
                </div>
            </c:if>
        </div>
    </div>
    <div id="footer" class="container" style="background-color: rgba(138, 234, 16, 0.156863) !important;">
        <span class="col-sm-6 text-left"><fmt:message key="webapp.version"/>
            <c:if test="${pageContext.request.remoteUser != null}">
            | <fmt:message key="user.status"/> ${pageContext.request.remoteUser}
            </c:if>
        </span>
        <span class="col-sm-6 text-right">
            &copy; <fmt:message key="copyright.year"/> <a href="<fmt:message key="company.url"/>"><fmt:message key="company.name"/></a>
        </span>
    </div>

<%= (request.getAttribute("scripts") != null) ?  request.getAttribute("scripts") : "" %>
</body>
</html>
