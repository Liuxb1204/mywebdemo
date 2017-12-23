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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">

	<script type="text/javascript">
		
	</script>
	
  </head>
  <!-- 
  	更新功能页面
  -->
  <body>
	    <form id="formEdit56" method="post">
	    	频道ID:<input type="text" name="id" readonly/><br/>
	    	频道名称:<input type="text" name="name"/><br/>
	    	<a class="easyui-linkbutton" onclick="abc();">提交</a>
	    </form>
	    <script type="text/javascript">
	    	$("#formEdit56").form("load",{
	    		id:id,
	    		name:name,	
	    	});
	    	function abc(){
	    		//点击了提交按钮,通过form发送异步请求,完成更新动作
	    		$("#formEdit56").form("submit",{
	    			url:"${pageContext.request.contextPath}/lanmu/change.do",
	    			onSubmit:function(){
	    				console.log("edit onsubmit~~");
	    				return true;
	    			},
	    			success:function(ret){//请求成功时 响应一个ok   失败时 error
	    				//通过ret判断更新是否成功
	    				//if(ret=="ok")
	    				//成功后,关闭dialog,并刷新datagrid
	    				$("#dia").dialog("close");
	    				//$("#dg56").datagrid("reload");
	    				$("#dancer").datagrid("load");
	    			}
	    		});
	    	}
	    </script>
  </body>
</html>
