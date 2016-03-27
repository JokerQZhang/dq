<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<%
if(request.getAttribute("showForm") == null){
%>
	<head>
	    <title><fmt:message key="menu.partymgn"/></title>
    <meta name="menu" content="PartyMgnMenu"/>
	</head>
    <form method="post" action="${ctx}/dqHuies" id="dqHuiSearchForm" class="form-inline" onsubmit="return ajaxSubmitFormUpdateAreas(this,$('#dqHuiSearchFormDiv'));">
	    <input type="hidden" name="page.pageSize"/>
    	<input type="hidden" name="page.pageIndex"/>
	    <div id="search" class="text-right" style="margin-top:0px;">
	        <span class="col-sm-9">
	            <input type="text" size="20" name="q" id="query" value="${param.q}"
	                   placeholder="<fmt:message key="search.enterTerms"/>" class="form-control input-sm"/>
	        </span>
	        <div id="actions" class="btn-group">
		        <button id="button.search" class="btn btn-default btn-sm" type="submit">
		            <i class="icon-search"></i> <fmt:message key="button.search"/>
		        </button>
		        <a class="btn btn-primary btn-sm" href="#" onclick="ajaxLoadDaialog({url:'<c:url value='/editDqHui'/>',title:'<fmt:message key="dqHuiDetail.heading"/>',width:1024,height:550,beforeDialogOpen:beforeDqHuiFormOpen,afterDialogOpen:afterDqHuiFormOpen,data:{method:'Add',from:'list'}})" >
		            <i class="icon-plus icon-white"></i> <fmt:message key="button.add"/>
		        </a>
	        </div>
	    </div>
    </form>
	<script type="text/javascript">
		if(typeof(afterSelectDqHui) == "undefined"){
			afterSelectDqHui = function(data){return true;};
		}
		if(typeof(beforeDqHuiFormOpen) == "undefined"){
			beforeDqHuiFormOpen = function(data){return true;};
		}
		if(typeof(afterDqHuiFormOpen) == "undefined"){
			afterDqHuiFormOpen = function(data){return true;};
		}
	</script>
    <div id="dqHuiSearchFormDiv"></div>
<%
}else{
%>
	<table class="table table-condensed table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th><fmt:message key="dqHui.huiId"/></th>
				<th><fmt:message key="dqHui.title"/></th>
				<th><fmt:message key="dqHui.huiTime"/></th>
				<th><fmt:message key="dqHui.huiAddress"/></th>
				<th><fmt:message key="dqHui.huiType"/></th>
				<th><fmt:message key="dqHui.zhibuPartyId"/></th>
				<th><fmt:message key="dqHui.huiMaster"/></th>
				<th><fmt:message key="dqHui.huiRecorder"/></th>
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dqHuies}" var="dqHui">
				<tr onclick="commonTableListSelect(this,afterSelectDqHui)">
					<td><a class="btn btn-info btn-sm" href="#" onclick="ajaxLoadDaialog({url:'<c:url value='/editDqHui'/>',title:'<fmt:message key="dqHuiDetail.heading"/>',width:1024,height:550,beforeDialogOpen:beforeDqHuiFormOpen,afterDialogOpen:afterDqHuiFormOpen,data:{huiId:'${dqHui.huiId}',from:'list'}})">${dqHui.huiId}</a></td>
					
					<td>${dqHui.title}</td>
					<td>${dqHui.huiTime}</td>
					<td>${dqHui.huiAddress}</td>
					<td>${dqHui.huiType}</td>
					<td>${dqHui.zhibuPartyId}</td>
					<td>${dqHui.huiMaster}</td>
					<td>${dqHui.huiRecorder}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${page.allRecordNum > page.pageSize}">
		<nav id="dqHuiPageNav">
		  <ul class="pagination" style="margin-top:0px;">
		    <li>
		      <a href="#" aria-label="Previous" onclick="formPage($('#dqHuiSearchForm'),'${page.pageIndex-1}')">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
			<c:set var="minpage" scope="page" value="${page.pageIndex-2}"></c:set>
			<c:if test="${minpage<1 || page.pageNum<=5}">
				<c:set var="minpage" scope="page" value="1"></c:set>
			</c:if>
			<c:set var="maxpage" scope="page" value="${minpage+4}"></c:set>
			<c:if test="${maxpage>page.pageNum}">
				<c:set var="maxpage" scope="page" value="${page.pageNum}"></c:set>
				<c:if test="${maxpage>5}">
					<c:set var="minpage" scope="page" value="${maxpage-4}"></c:set>
				</c:if>
			</c:if>
			<c:forEach begin="${minpage}" end="${maxpage}" var="i">
				<li ${i==page.pageIndex?"class='active'":""}><a href="#" onclick="formPage($('#dqHuiSearchForm'),'${i}')">${i}</a></li>
			</c:forEach>
		    
		    <li>
		      <a href="#" aria-label="Next" onclick="formPage($('#dqHuiSearchForm'),'${page.pageIndex+1}')">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    <li><span><fmt:message key="page.pagetitle"><fmt:param value="${page.pageNum}"/><fmt:param value="${page.allRecordNum}"/></fmt:message></span></li>
		  </ul>
		</nav>
	</c:if>
<%
}
%>
