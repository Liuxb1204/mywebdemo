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

	
	<style type="text/css">
		/* 设置背景图片不重复显示并居中 */
		.c{	background:url(img/tt.gif) no-repeat center center;}
		
		input{
		/* 圆角效果 */
		   outline:none;
	       border-radius:6px;
	       border:1px solid #909090;
    	}
    	input:focus{
	     outline:none;
	     -moz-box-shadow:0 0 10px #06c;
    	 -webkit-box-shadow:0 0 10px #06c;
    	 box-shadow:0 0 10px #06c;
	    }
	    /* 北京颜色 */
	    #oo{background:url(img/234206.jpg) center center}
	</style>
	
  </head>
  <!-- 
  	更新功能页面
  -->
  <body id="oo"><br><br><br><br><br><br><br>
  	
  		<div Class="c" style="text-align:center;"><br><br>
	    <form id="formEdit56" method="post">
	    	&nbsp用户名:<input id="name" type="text" name="username" onblur="onname()"/>
	    	<br/><font color="red" id="errorname"></font><br/>
	    	&nbsp邮箱:<input id="email" type="text" name="email"/><br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	    	<button id="yzm" type="button" style="display: none" onclick="huoquma()">获取验证码</button><br/>
	    	&nbsp验证码:<input id="ma" type="text" name="ma" onfocus="mama()" onblur="masq()"/>
	    	<br/><font color="red" id="errorma"></font><br/>
	    	<div id="ps" style="display: none">
	    	修改密码:<input id="psw" type="password" name="password"/><br/><br/>
	    	确认密码:<input id="psw1" type="password" name="password1"/><br/><br/>
	    	</div>
	    	<a class="easyui-linkbutton" onclick="abc();">确定</a>
	    </form><input id="jia" style="display:none">
	    	
	    <br><br>
	    </div>
	   
	    <script type="text/javascript">
	    	
	    	function abc(){
	    		var a=$("#jia").val();
	    		var ma=$("#ma").val();
	    		var p=$("#psw").val();
	    		var p1=$("#psw1").val();
	    		var errma=$("#errorma").val();
		    	if($("#name").val()==""||$("#email").val()==""){
		    		alert("账号或邮箱不能为空");
		    	}else if(ma==""&&errma==""){
		    		alert("验证码错误或不能为空");
		    	}else if(p==""||p1==""){
		    		alert("密码不能为空");
		    	}else if(p!=p1){
		    		alert("两次输入密码不一致。");
		    	}else{
		    		//点击了提交按钮,通过form发送异步请求,完成更新动作
	    		$("#formEdit56").form("submit",{
	    			url:"${pageContext.request.contextPath}/user/xiugai.do",
	    			onSubmit:function(){
						if(a!=ma){
							document.getElementById("errorma").innerHTML="验证码输入错误"; 
							return false;
						}else{
							return true;
						}
	    			},
	    			success:function(ret){//请求成功时 响应一个ok   失败时 error
	    				if(ret=="ok"){
	    					alert("修改完成！");
	    					location.href="${pageContext.request.contextPath }/login.jsp";
	    				}
	    			}
	    		});
		    	}	
	    	}
	    	function onname(){
	    		document.getElementById("errorname").innerHTML=""; 
	    		var name=$("#name").val();
	    		if(name!=""){
	    			$.ajax({
					type:"post",   
					url:"${pageContext.request.contextPath}/user/removepsw.do",
					data:"username="+name,   
					success:function(Name){
						 if(Name=="nohave"){
							document.getElementById("errorname").innerHTML="账户不存在"; 
						}else{
							$("#email").val(Name);
							 document.getElementById('email').disabled = true;//设置邮箱输入框不可更改！
							 document.getElementById("yzm").style.display="";//显示验证码	
						}
					},
					});
	    		} 
	    	} 
	    	function huoquma(){
			var yx=$("#email").val();
				$.ajax({
					type:"post",   
					url:"${pageContext.request.contextPath}/user/removepsw.do",
					data:"email="+yx,   
					success:function(Name){
						$("#jia").val(Name);
						 if(Name=="error"){
							alert("发送失败！网络超时，请联网后重试。");
						}else{
							alert("验证码已成功发送至您的邮箱("+yx+")请及时查收！");		
						}
					},
				}); 
		}
		function mama(){
			if(!$("#name").val()==""||!$("#email").val()==""){
			document.getElementById("ps").style.display="";//显示验证码
			}
		}
		function masq(){
			var a=$("#jia").val();
	    	var ma=$("#ma").val();
	    	if(a==ma){
	    	document.getElementById("errorma").innerHTML="";
	    	}else{
	        document.getElementById("errorma").innerHTML="验证码输入错误。";
	    	}
		}
	    </script>
  </body>
</html>
