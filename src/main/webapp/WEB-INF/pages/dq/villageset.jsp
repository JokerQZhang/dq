<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="activeUsers.title"/></title>
    <meta name="menu" content="AdminMenu"/>
    <style type="text/css">
.tree {
    min-height:20px;
    padding:19px;
    margin-bottom:20px;
    background-color:#fbfbfb;
    border:1px solid #999;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05)
}
.tree li {
    list-style-type:none;
    margin:0;
    padding:10px 5px 0 5px;
    position:relative
}
.tree li::before, .tree li::after {
    content:'';
    left:-20px;
    position:absolute;
    right:auto
}
.tree li::before {
    border-left:1px solid #999;
    bottom:50px;
    height:100%;
    top:0;
    width:1px
}
.tree li::after {
    border-top:1px solid #999;
    height:20px;
    top:25px;
    width:25px
}
.tree li span {
    -moz-border-radius:5px;
    -webkit-border-radius:5px;
    border:1px solid #999;
    border-radius:5px;
    display:inline-block;
    padding:3px 8px;
    text-decoration:none
}
.tree li.parent_li>span {
    cursor:pointer
}
.tree>ul>li::before, .tree>ul>li::after {
    border:0
}
.tree li:last-child::before {
    height:30px
}
.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
    background:#eee;
    border:1px solid #94a0b4;
    color:#000
}
    </style>
</head>
	<div class="col-sm-5">
		<div class="panel panel-default">
		  <div class="panel-heading">行政组织信息</div>
		  <div class="panel-body">
		    <jsp:include page="/WEB-INF/pages/dq/villagetree.jsp" flush="true"></jsp:include>
		  </div>
		</div>
	</div>
	<div class="col-sm-7">
		<div class="panel panel-default">
		  <div class="panel-heading">行政组织信息<span class="text-primary"><code id="zhibuname">请先选中村</code></span></div>
		  <div class="panel-body" id="dtlpanel">
		  	<div id="search" class="text-right">
				<div class="btn-group">
					<button class="btn btn-warning btn-sm" onclick="modifyCun()">修改</button>
					<button class="btn btn-primary btn-sm" onclick="addPeople()">新增人员</button>
				</div>
			</div>
			<div id="dtlinfo">
		    	<!-- <jsp:include page="/WEB-INF/pages/dq/villagedtl.jsp" flush="true"></jsp:include> -->
		    </div>
		  </div>
		</div>
		<div id="sss" class="modal fade" role="dialog">
			<div class="modal-dialog" align="center">
				<img alt="" src="/images/waiting.gif" style="opacity:0.50;">Waiting....
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		$("#partyGroupSearchForm").submit();
		//$("#sss").modal('show');
	})
	function modifyCun(){
		if(selectedGroupId==""){
			alert("请先选择需要修改的村信息!");
			return false;
		}
		ajaxLoadDaialog({url:'<c:url value='/dqd/editPartyGroupCun'/>',title:'<fmt:message key="partyGroupDetail.heading"/>',width:600,height:500,beforeDialogOpen:undefined,afterDialogOpen:afterPartyGroupFormOpen,data:{isNowXiang:isNowXiang,partyId:selectedGroupId,method:'Modify',from:'list'}});
	}
	function addPeople(){
		if(selectedGroupId==""){
			alert("请先选择需要修改的村信息!");
			return false;
		}
		ajaxLoadDaialog({url:'<c:url value='/dqd/editCunPerson'/>',title:'<fmt:message key="partyGroupDetail.heading"/>',width:600,height:500,beforeDialogOpen:undefined,afterDialogOpen:afterPartyGroupFormOpen,data:{belongGroupId:selectedGroupId,isNowXiang:isNowXiang,method:'Add',from:'list'}});
	}
	function villageTreeSelect(partyId, isXiang){
		loadingEffect($(".col-sm-7"));
		$.ajax({
			url:"<c:url value='/dqd/cunInfoDtl'/>"
			,type:"post"
			,data:{partyId:partyId,isXiang:isXiang}
			,success:function(data){
				loadingEffectOff($(".col-sm-7"));
				$("#dtlinfo").html(data);
			}
		});
	}
	</script>