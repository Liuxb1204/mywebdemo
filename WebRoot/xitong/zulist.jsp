<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			$("#tab").datagrid({
  				url:'<%=path%>/back/queryAllSystemGroup.do',
  				method:'post',
  				columns:[[
  					{field:'id',title:'',width:100,checkbox:true},    
        			{field:'roleName',title:'用户组',width:100},      
       			 ]],
  				striped:true,
  				fitColumns:true,
				pagination:true
  			});
			
  		});
  	</script>
  </head>
  <body>
  <br/><br/>
  	<div align="center">
	</div>
	<br/><br/>
   	<table id="tab"></table>
   	<div id="dia">
   	<br><br>
   	</div>
  </body>
</html>
