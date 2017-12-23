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
	
  </head>
  
  	
  <body>
  <center>
  <div id="login">
 		<p>账号<input type="text" id="name"></p>
 		<p>密码<input type="password" id="password"></p>
 		</div>
 		<div id="btn">
 		<a href="javascript:void(0)" class="easyui-linkbutton">登录</a>
 		</div>
  </center>
 		<script type="text/javascript"> 
		$(function(){
		
			$('#login').dialog({   
    		title: 'My Dialog',
    		iconCls:'icon-login',   
   			 width: 400,   
   			 height: 200, 
   			draggable:false,//是否允许拖动 
    		modal: true,
    		buttons:'#btn',  
			}); 
			$('#name').validatebox({
				required:true,
				missingMessage:'请输入账号',
			});
			$('#password').validatebox({
				required:true,
				validType:'length[6,30]',
				missingMessage:'请输入密码',
			});
			$('#btn a').click(function(){
				if(!$('#name').validatebox('isValid')){
					$('#name').focus();
				}else if(!$('#password').validatebox('isValid')){
					$('#password').focus();
				}else{	
						$.ajax({
							type:"post", 
							url:"${pageContext.request.contextPath}/user/login.do?", 
							data:{   //发送两个参数可以写成对象新式
								name:$("name").val(),
								name:$("password").val(),
							},       
							beforeSend:function(){      //点击提交后添加一个读条效果
								$.messager.progress({
								text:"正在登陆中。。。",
								});
							},  
							success:function(abc){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText
								alert(abc);			
							},
							dataType:"json"//
						});
				}
				
			});
		
		});		
				
	</script>
  </body>
</html>
