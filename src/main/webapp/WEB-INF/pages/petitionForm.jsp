<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="petitionDetail.title"/></title>
    <meta name="menu" content="PetitionMenu"/>
</head>

<div class="col-sm-12">
    <s:form id="petitionForm" action="savePetition" method="post" validate="false" cssClass="well" onsubmit="return ajaxSubmitFormUpdateAreas(this,undefined,afterSavePetition);">
        <s:hidden key="petition.petitionId"/>
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.acceptContent"/></label>
				        	  <input class="form-control" type="text" name="petition.acceptContent" value="${petition.acceptContent}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.acceptContent"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.acceptName"/></label>
				        	  <input class="form-control" type="text" name="petition.acceptName" value="${petition.acceptName}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.acceptName"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.acceptTime"/></label>
				        	  <input class="form-control" type="text" name="petition.acceptTime" value="${petition.acceptTime}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.acceptTime"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.createdByUser"/></label>
				        	  <input class="form-control" type="text" name="petition.createdByUser" value="${petition.createdByUser}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.createdByUser"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.createdTime"/></label>
				        	  <input class="form-control" type="text" name="petition.createdTime" value="${petition.createdTime}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.createdTime"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.expectEndTime"/></label>
				        	  <input class="form-control" type="text" name="petition.expectEndTime" value="${petition.expectEndTime}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.expectEndTime"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.lastUpdatedByUser"/></label>
				        	  <input class="form-control" type="text" name="petition.lastUpdatedByUser" value="${petition.lastUpdatedByUser}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.lastUpdatedByUser"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.lastUpdatedTime"/></label>
				        	  <input class="form-control" type="text" name="petition.lastUpdatedTime" value="${petition.lastUpdatedTime}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.lastUpdatedTime"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.leaderContent"/></label>
				        	  <input class="form-control" type="text" name="petition.leaderContent" value="${petition.leaderContent}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.leaderContent"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.processPartyId"/></label>
				        	  <input class="form-control" type="text" name="petition.processPartyId" value="${petition.processPartyId}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.processPartyId"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.realEndTime"/></label>
				        	  <input class="form-control" type="text" name="petition.realEndTime" value="${petition.realEndTime}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.realEndTime"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportContent"/></label>
				        	  <input class="form-control" type="text" name="petition.reportContent" value="${petition.reportContent}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportContent"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportDep"/></label>
				        	  <input class="form-control" type="text" name="petition.reportDep" value="${petition.reportDep}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportDep"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportMemo"/></label>
				        	  <input class="form-control" type="text" name="petition.reportMemo" value="${petition.reportMemo}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportMemo"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportMethod"/></label>
				        	  <input class="form-control" type="text" name="petition.reportMethod" value="${petition.reportMethod}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportMethod"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportPConnect"/></label>
				        	  <input class="form-control" type="text" name="petition.reportPConnect" value="${petition.reportPConnect}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportPConnect"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportPNum"/></label>
				        	  <input class="form-control" type="text" name="petition.reportPNum" value="${petition.reportPNum}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportPNum"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportPeople"/></label>
				        	  <input class="form-control" type="text" name="petition.reportPeople" value="${petition.reportPeople}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportPeople"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportStatus"/></label>
				        	  <input class="form-control" type="text" name="petition.reportStatus" value="${petition.reportStatus}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportStatus"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportType"/></label>
				        	  <input class="form-control" type="text" name="petition.reportType" value="${petition.reportType}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportType"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportedDep"/></label>
				        	  <input class="form-control" type="text" name="petition.reportedDep" value="${petition.reportedDep}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportedDep"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportedMemo"/></label>
				        	  <input class="form-control" type="text" name="petition.reportedMemo" value="${petition.reportedMemo}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportedMemo"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportedPeople"/></label>
				        	  <input class="form-control" type="text" name="petition.reportedPeople" value="${petition.reportedPeople}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportedPeople"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.reportedStatus"/></label>
				        	  <input class="form-control" type="text" name="petition.reportedStatus" value="${petition.reportedStatus}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.reportedStatus"/> -->
        <div class="form-group col-sm-12">
				        	  <label><fmt:message key="petition.statusId"/></label>
				        	  <input class="form-control" type="text" name="petition.statusId" value="${petition.statusId}"/>
				          </div>
            			<!--  <s:textfield cssClass="form-control" key="petition.statusId"/> -->

        <div class="form-group">
            <s:submit type="button" id="save" cssClass="btn btn-primary" method="save" key="button.save" theme="simple">
                <i class="icon-ok icon-white"></i> <fmt:message key="button.save"/>
            </s:submit>
            <c:if test="${not empty petition.petitionId}">
                <s:submit type="button" id="delete" cssClass="btn btn-danger" method="delete" key="button.delete"
                    onclick="$('#petitionForm').attr('action','/savePetition?delete=1'); return confirmMessage('确认删除？')" theme="simple">
                    <i class="icon-trash icon-white"></i> <fmt:message key="button.delete"/>
                </s:submit>
            </c:if>
            <a href="#" class="btn btn-default" onclick="afterSavePetition('取消保存')">
                <i class="icon-remove"></i> <fmt:message key="button.cancel"/></a>
        </div>
    </s:form>
</div>
<script type="text/javascript">
function afterSavePetition(data){
	alert(data);
	$("#jokerdialogframexixi").dialog("close");
	formPage($("#petitionSearchForm"),$("#petitionPageNav").find("li[class='active']").find("a").html());
}
</script>
