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
  			/* $('#tt').tabs({    
			    border:true,  
			    fit:true,  
			    toolPosition:'right',
			    onSelect:function(title){    
			        var pp = $('#tt').tabs('getSelected'); 
					pp.show();
			    }, 
			   tools:'#tab-tools'
			});  */
  			/* $("#frontTab").datagrid({
  				url:'',
  				method:'post',
  				columns:[[  
       			    {field:'operateContent',title:'操作信息',width:200},  
        			{field:'operator',title:'操作人',width:50},    
       				{field:'operatorIp',title:'IP',width:50},
       				{field:'operateTime',title:'操作时间',width:50}
       			 ]],
  				striped:true,
  				fitColumns:true,
				pagination:true
  			}); */
  			$("#backTab").datagrid({
  				url:'<%=path%>/back/queryBackgroundLogs.do',
  				method:'post',
  				columns:[[
       			    {field:'operateContent',title:'操作信息',width:200},  
        			{field:'operator',title:'操作人',width:50},    
       				{field:'operatorIp',title:'IP',width:50},
       				{field:'operateTime',title:'操作时间',width:50}
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
		   	<table id="backTab"></table>
  </body>
</html>
