<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="personList.title"/></title>
    <meta name="menu" content="PersonMenu"/>
</head>
<%
if(request.getAttribute("showForm") == null){
%>
    <h2><fmt:message key="personList.heading"/></h2>

    <form method="post" action="${ctx}/persons" id="personSearchForm" class="form-inline" onsubmit="return ajaxSubmitFormUpdateAreas(this,$('#personSearchFormDiv'));">
	    <input type="hidden" name="page.pageSize"/>
    	<input type="hidden" name="page.pageIndex"/>
    	<input type="hidden" name="belongGroupId"/>
    	<input type="hidden" name="bypgid" value="yes"/>
	    <div id="search" class="text-right">
	        <span class="col-sm-9">
	            <input type="text" size="20" name="q" id="query" value="${param.q}"
	                   placeholder="<fmt:message key="search.enterTerms"/>" class="form-control input-sm"/>
	        </span>
	        <div id="actions" class="btn-group">
		        <button id="button.search" class="btn btn-default btn-sm" type="submit">
		            <i class="icon-search"></i> <fmt:message key="button.search"/>
		        </button>
		        <a class="btn btn-primary btn-sm" href="#" onclick="ajaxLoadDaialog({url:'<c:url value='/editPerson'/>',title:'<fmt:message key="personDetail.heading"/>',width:600,height:500,beforeDialogOpen:beforePersonFormOpen,afterDialogOpen:afterPersonFormOpen,data:{method:'Add',from:'list'}})" >
		            <i class="icon-plus icon-white"></i> <fmt:message key="button.add"/>
		        </a>
	        </div>
	    </div>
    </form>
	<script type="text/javascript">
		if(typeof(afterSelectPerson) == "undefined"){
			afterSelectPerson = function(data){return true;};
		}
		if(typeof(beforePersonFormOpen) == "undefined"){
			beforePersonFormOpen = function(data){
				var selectedGroupId = $("input[name='selectedGroupId']").val();
				if(selectedGroupId==null||selectedGroupId==""){
					alert("组织结构是按照关系来的，请先选择一个部门，然后再添加其人员。");
					return false;
				}
				return true;
			};
		}
		if(typeof(afterPersonFormOpen) == "undefined"){
			afterPersonFormOpen = function(data){
				$("input[name='belongGroupId']").val($("input[name='selectedGroupId']").val());
				return true;
			};
		}
	</script>
    <p><fmt:message key="personList.message"/></p>
    <div id="personSearchFormDiv"></div>
<%
}else{
%>
	<table class="table table-condensed table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th><fmt:message key="person.personId"/></th>
				<th><fmt:message key="person.name"/></th>
				<th><fmt:message key="person.cardId"/></th>
				<th><fmt:message key="person.gender"/></th>
				<th><fmt:message key="person.phone"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${persons}" var="person">
				<tr onclick="commonTableListSelect(this,afterSelectPerson)">
					<td><a class="btn btn-info btn-sm" href="#" onclick="ajaxLoadDaialog({url:'<c:url value='/editPerson'/>',title:'<fmt:message key="personDetail.heading"/>',width:600,height:500,beforeDialogOpen:undefined,afterDialogOpen:afterPersonFormOpen,data:{personId:'${person.personId}',from:'list'}})">${person.personId}</a></td>
					<td><a class="btn btn-info btn-sm" href="#" onclick="window.open('<c:url value='/editUser?method=Add&from=list&snakeid=${person.partyId}'/>');">${person.name}</a></td>
					<td>${person.cardId}</td>
					<td>${person.gender}</td>
					<td>${person.phone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${page.allRecordNum > page.pageSize}">
		<nav id="personPageNav">
		  <ul class="pagination" style="margin-top:0px;">
		    <li>
		      <a href="#" aria-label="Previous" onclick="formPage($('#personSearchForm'),'${page.pageIndex-1}')">
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
				<li ${i==page.pageIndex?"class='active'":""}><a href="#" onclick="formPage($('#personSearchForm'),'${i}')">${i}</a></li>
			</c:forEach>
		    
		    <li>
		      <a href="#" aria-label="Next" onclick="formPage($('#personSearchForm'),'${page.pageIndex+1}')">
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
