<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<style type="text/css">
		/* 设置背景图片 */
		.c{background-image:url(img/wsj.gif);background-position:center center;}
	</style>
  </head>
  
  	
  <body onload="Load(url)" class="c">
  <center><br><br><br><br>
  <div ></div>	
  <h2>恭喜你，注册成功！</h2>
  <div id="ShowDiv"></div><br/>
 	<div><a href="${pageContext.request.contextPath }/login.jsp">立即跳转</a></div>

  </center>
 		<script type="text/javascript"> 
			var time = 5; //倒计时的秒数 
			var URL="${pageContext.request.contextPath }/login.jsp";
			$(function(url){ 
				url=URL;
				for(var i=time;i>=0;i--) { 
				   window.setTimeout("doUpdate("+i+")",(time-i)*1000); 
				} 
			}); 
			function doUpdate(num) { 
			document.getElementById('ShowDiv').innerHTML = "将在<font color='red'>&nbsp"+num+"&nbsp</font>秒后自动跳转到登录界面";
				if(num == 0) { 
				window.location =URL;
				}
			}
				
	</script>
  </body>
</html>
