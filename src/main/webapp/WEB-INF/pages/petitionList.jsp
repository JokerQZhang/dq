<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<%
if(request.getAttribute("showForm") == null){
%>
	<head>
	    <title><fmt:message key="petitionList.title"/></title>
	    <meta name="menu" content="PetitionMenu"/>
	</head>
    <form method="post" action="${ctx}/petitions" id="petitionSearchForm" class="form-inline" onsubmit="return ajaxSubmitFormUpdateAreas(this,$('#petitionSearchFormDiv'));">
	    <input type="hidden" name="page.pageSize"/>
    	<input type="hidden" name="page.pageIndex"/>
	    <div id="search" class="text-right">
	        <span class="col-sm-9">
	            <input type="text" size="20" name="q" id="query" value="${param.q}"
	                   placeholder="<fmt:message key="search.enterTerms"/>" class="form-control input-sm"/>
	        </span>
	        <div id="actions" class="btn-group">
		        <button id="button.search" class="btn btn-default btn-sm" type="submit">
		            <i class="icon-search"></i> <fmt:message key="button.search"/>
		        </button>
		        <a class="btn btn-primary btn-sm" href="#" onclick="ajaxLoadDaialog({url:'<c:url value='/editPetition'/>',title:'<fmt:message key="petitionDetail.heading"/>',width:600,height:500,beforeDialogOpen:beforePetitionFormOpen,afterDialogOpen:afterPetitionFormOpen,data:{method:'Add',from:'list'}})" >
		            <i class="icon-plus icon-white"></i> <fmt:message key="button.add"/>
		        </a>
	        </div>
	    </div>
    </form>
	<script type="text/javascript">
		if(typeof(afterSelectPetition) == "undefined"){
			afterSelectPetition = function(data){return true;};
		}
		if(typeof(beforePetitionFormOpen) == "undefined"){
			beforePetitionFormOpen = function(data){return true;};
		}
		if(typeof(afterPetitionFormOpen) == "undefined"){
			afterPetitionFormOpen = function(data){return true;};
		}
	</script>
    <div id="petitionSearchFormDiv"></div>
<%
}else{
%>
	<table class="table table-condensed table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th><fmt:message key="petition.petitionId"/></th>
				<th><fmt:message key="petition.acceptContent"/></th>
				<th><fmt:message key="petition.acceptName"/></th>
				<th><fmt:message key="petition.acceptTime"/></th>
				<th><fmt:message key="petition.createdByUser"/></th>
				<th><fmt:message key="petition.createdTime"/></th>
				<th><fmt:message key="petition.expectEndTime"/></th>
				<th><fmt:message key="petition.lastUpdatedByUser"/></th>
				<th><fmt:message key="petition.lastUpdatedTime"/></th>
				<th><fmt:message key="petition.leaderContent"/></th>
				<th><fmt:message key="petition.processPartyId"/></th>
				<th><fmt:message key="petition.realEndTime"/></th>
				<th><fmt:message key="petition.reportContent"/></th>
				<th><fmt:message key="petition.reportDep"/></th>
				<th><fmt:message key="petition.reportMemo"/></th>
				<th><fmt:message key="petition.reportMethod"/></th>
				<th><fmt:message key="petition.reportPConnect"/></th>
				<th><fmt:message key="petition.reportPNum"/></th>
				<th><fmt:message key="petition.reportPeople"/></th>
				<th><fmt:message key="petition.reportStatus"/></th>
				<th><fmt:message key="petition.reportType"/></th>
				<th><fmt:message key="petition.reportedDep"/></th>
				<th><fmt:message key="petition.reportedMemo"/></th>
				<th><fmt:message key="petition.reportedPeople"/></th>
				<th><fmt:message key="petition.reportedStatus"/></th>
				<th><fmt:message key="petition.statusId"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${petitions}" var="petition">
				<tr onclick="commonTableListSelect(this,afterSelectPetition)">
					<td><a class="btn btn-info btn-sm" href="#" onclick="ajaxLoadDaialog({url:'<c:url value='/editPetition'/>',title:'<fmt:message key="petitionDetail.heading"/>',width:600,height:500,beforeDialogOpen:beforePetitionFormOpen,afterDialogOpen:afterPetitionFormOpen,data:{petitionId:'${petition.petitionId}',from:'list'}})">${petition.petitionId}</a></td>
					
					<td>${petition.acceptContent}</td>
					<td>${petition.acceptName}</td>
					<td>${petition.acceptTime}</td>
					<td>${petition.createdByUser}</td>
					<td>${petition.createdTime}</td>
					<td>${petition.expectEndTime}</td>
					<td>${petition.lastUpdatedByUser}</td>
					<td>${petition.lastUpdatedTime}</td>
					<td>${petition.leaderContent}</td>
					<td>${petition.processPartyId}</td>
					<td>${petition.realEndTime}</td>
					<td>${petition.reportContent}</td>
					<td>${petition.reportDep}</td>
					<td>${petition.reportMemo}</td>
					<td>${petition.reportMethod}</td>
					<td>${petition.reportPConnect}</td>
					<td>${petition.reportPNum}</td>
					<td>${petition.reportPeople}</td>
					<td>${petition.reportStatus}</td>
					<td>${petition.reportType}</td>
					<td>${petition.reportedDep}</td>
					<td>${petition.reportedMemo}</td>
					<td>${petition.reportedPeople}</td>
					<td>${petition.reportedStatus}</td>
					<td>${petition.statusId}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${page.allRecordNum > page.pageSize}">
		<nav id="petitionPageNav">
		  <ul class="pagination" style="margin-top:0px;">
		    <li>
		      <a href="#" aria-label="Previous" onclick="formPage($('#petitionSearchForm'),'${page.pageIndex-1}')">
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
				<li ${i==page.pageIndex?"class='active'":""}><a href="#" onclick="formPage($('#petitionSearchForm'),'${i}')">${i}</a></li>
			</c:forEach>
		    
		    <li>
		      <a href="#" aria-label="Next" onclick="formPage($('#petitionSearchForm'),'${page.pageIndex+1}')">
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
