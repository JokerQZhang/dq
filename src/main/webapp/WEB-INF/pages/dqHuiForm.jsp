<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="dqHuiDetail.title"/></title>
    <meta name="menu" content="DqHuiMenu"/>
</head>

<div class="col-sm-12">
    <s:form id="dqHuiForm" action="saveDqHui" method="post" validate="false" cssClass="well" onsubmit="return ajaxSubmitFormUpdateAreas(this,undefined,afterSaveDqHui);">
        <s:hidden key="dqHui.huiId"/>
        <div class="form-group col-sm-12">
        	<label><fmt:message key="dqHui.title"/></label>
        	<input class="form-control" type="text" name="dqHui.title" value="${dqHui.title}"/>
        </div>
        <div class="form-group col-sm-3">
        	<label><fmt:message key="dqHui.huiType"/></label>
        	<select class="form-control" name="dqHui.huiType" value="${dqHui.huiType}">
        	<%=request.getAttribute("huiTypeStr") %>
        	</select>
        </div>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.huiTime"/></label>
        	<input class="form-control" type="text" name="dqHui.huiTime" value="${dqHui.huiTime}"/>
        </div>
        <script type="text/javascript">
        $(document).ready(function() {
        	getDatePicker($("input[name='dqHui.huiTime']"));
	    });
        </script>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.huiMaster"/></label>
        	<input class="form-control" type="text" name="dqHui.huiMaster" value="${dqHui.huiMaster}"/>
        </div>
        <div class="form-group col-sm-5">
        	<label><fmt:message key="dqHui.huiAddress"/></label>
        	<input class="form-control" type="text" name="dqHui.huiAddress" value="${dqHui.huiAddress}"/>
        </div>
        
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.huiRecorder"/></label>
        	<input class="form-control" type="text" name="dqHui.huiRecorder" value="${dqHui.huiRecorder}"/>
        </div>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.numAbsent"/></label>
        	<input class="form-control" type="text" name="dqHui.numAbsent" value="${dqHui.numAbsent}"/>
        </div>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.numAbsentParty"/></label>
        	<input class="form-control" type="text" name="dqHui.numAbsentParty" value="${dqHui.numAbsentParty}"/>
        </div>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.numParty"/></label>
        	<input class="form-control" type="text" name="dqHui.numParty" value="${dqHui.numParty}"/>
        </div>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.numReal"/></label>
        	<input class="form-control" type="text" name="dqHui.numReal" value="${dqHui.numReal}"/>
        </div>
        <div class="form-group col-sm-2">
        	<label><fmt:message key="dqHui.numShould"/></label>
        	<input class="form-control" type="text" name="dqHui.numShould" value="${dqHui.numShould}"/>
        </div>
        
        <div class="form-group col-sm-12">
        	<label><fmt:message key="dqHui.nameAbsent"/></label>
        	<input class="form-control" type="text" name="dqHui.nameAbsent" value="${dqHui.nameAbsent}"/>
        </div>
        <div class="form-group col-sm-12">
        	<label><fmt:message key="dqHui.nameComeIn"/></label>
        	<input class="form-control" type="text" name="dqHui.nameComeIn" value="${dqHui.nameComeIn}"/>
        </div>
        <div class="form-group col-sm-12">
        	<label><fmt:message key="dqHui.nameSiteIn"/></label>
        	<input class="form-control" type="text" name="dqHui.nameSiteIn" value="${dqHui.nameSiteIn}"/>
        </div>
        
        <div class="form-group col-sm-12">
        	<label><fmt:message key="dqHui.huiContent"/></label>
        	<textarea class="form-control" name="dqHui.huiContent" style="height:200px;" placeholder="会议内容，1-2000个字符" minlength="1" maxlength="2000">${dqHui.huiContent}</textarea>
        </div>

        <div class="form-group">
            <s:submit type="button" id="save" cssClass="btn btn-primary" method="save" key="button.save" theme="simple">
                <i class="icon-ok icon-white"></i> <fmt:message key="button.save"/>
            </s:submit>
            <c:if test="${not empty dqHui.huiId}">
                <s:submit type="button" id="delete" cssClass="btn btn-danger" method="delete" key="button.delete"
                    onclick="$('#dqHuiForm').attr('action','/saveDqHui?delete=1'); return confirmMessage('确认删除？')" theme="simple">
                    <i class="icon-trash icon-white"></i> <fmt:message key="button.delete"/>
                </s:submit>
            </c:if>
            <a href="#" class="btn btn-default" onclick="afterSaveDqHui('取消保存')">
                <i class="icon-remove"></i> <fmt:message key="button.cancel"/></a>
        </div>
    </s:form>
</div>
<script type="text/javascript">
function afterSaveDqHui(data){
	alert(data);
	$("#jokerdialogframexixi").dialog("close");
	formPage($("#dqHuiSearchForm"),$("#dqHuiPageNav").find("li[class='active']").find("a").html());
}
</script>
