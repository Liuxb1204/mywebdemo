<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<script type="text/javascript">
		//添加背景视频
	    $(function () {
	        document.getElementById('vi').oncanplay = function() {
	            $(this).fadeIn();
	        };	
    	});
		function dj(){
			document.getElementById("xs").style.display="";//显示
		}
		function masq(){
			var n=$("#name").val();
			var p=$("#pwd").val();
			var m=$("#img").val();
			if(n!=""&&p!=""){
				if(m==""){
					alert("验证码不能为空");
				}
			}
		}
		function huan(){ 
   	      	var verify =document.getElementById("imgg");   
			var time="yanzm.jsp?t="+new Date().getTime();//拿到当前时间
			verify.src=time;  
		}
		function yzname(){
			document.getElementById("errorname").innerHTML="";
			var name=$("#name").val();
			if(name!=""){
				$.ajax({
					type:"post",   
					url:"${pageContext.request.contextPath}/user/jiaoyan.do",
					data:"username="+name,   
					success:function(Name){				
						if(Name==="null"){
						document.getElementById("errorname").innerHTML="账户不存在"; 
						}
					},
				}); 
			}			
		}
		function yzpsw(){
			document.getElementById("errorpsw").innerHTML="";
				var name=$("#name").val();
				var pwd=$("#pwd").val();
				if(pwd!=""&&name!=""){
					$.ajax({
					type:"post",   
					url:"${pageContext.request.contextPath}/user/jiaoyan.do",
					data:"username="+name,   
					success:function(Name){				
						if(pwd!=Name){
						document.getElementById("errorpsw").innerHTML="密码错误";
						}
					},
					}); 
				}
				
		}
		function namegb(){
			yzpsw();
		}
	</script>
	
	<style>
		/* 设置背景图片 */
		.c{background-image:url(img/ng.gif);background-position:center center;}
		/* 设置视频格式大小 */
	    .login-video{
	             display: none;
	            position: fixed;
	            top: 0;
	            left: 0;
	            right: 0;
	            bottom: 0;
	            z-index: -1;
	    }
        /* 设置登录按钮鼠标获取样式 */
     	#sub:hover{border-bottom:solid 1px #333;}
     	/* 设置超链接获取鼠标样式并且去掉下划线 */
     	a:link{color:#0066CC;text-decoration: none;}
		a:visited {color:#00CC66;text-decoration: none;}
		a:hover {color:#FF0099;text-decoration: none;}
		a:active {color:#FF9900;text-decoration: none;}
		input{
		/* 圆角效果 */
		   outline:none;
	       border-radius:6px;
	       border:1px solid #909090;  
    	}
    	input:focus{
    	/* 关闭浏览器默认 */
	     outline:none;
	     /* 点击光晕效果 */
    	 box-shadow:0 0 10px #06c;
	    }
	    .input01{
	    outline:none;
	    text-shadow:1px 1px 0px #b67f01;/*字体阴影效果*/
	    box-shadow:inset 0px 0px 1px #fff;/*内发光效果*/
	    }
	</style>
  </head>
  	
  <body Class="b">
 <div>
    	 <!-- 表单 -->
    	 <center>
    	 <br/><br/><br/>
    	 <h1>登录，一切皆有可能</h1>
    	 <br/>
    	 <video id="vi" autoplay loop style="width:100%" class="login-video">
    	 <source src="${pageContext.request.contextPath}/img/login.mp4">
    	 </video>
    	 <br/><br/> <br/><br/>
    	<form id="fm56" method="post" action="${pageContext.request.contextPath}/user/login.do"> 
    	<font size="5" style="margin-left:0.7cm">账号:</font>
    	<input id="name" type="text" name="username" class="easyui-validatebox" 
    	data-options="required:true,missingMessage:'请填写您的昵称'" style="height:45px;width:200px;font-size:25px;background-color:transparent" onblur="yzname()" onchange="namegb()"/>
    	<font color="red" id="errorname"></font>
    	<br/><br/>
    	<font size="5" style="margin-left:0.7cm">密码:</font>
    	<input id="pwd" type="password" name="password" class="easyui-validatebox" 
    	data-options="required:true,validType:'length[5,10]',missingMessage:'请填写您的密码',invalidMessage:'密码格式为5到10位数字'" style="height:45px;width:200px;font-size:25px;background-color:transparent" onblur="yzpsw()"/>
    	<font color="red" id="errorpsw"></font>
    	<br/><br/>
		<font size="5">验证码:</font>
		<input id="img" type="text" name="image" class="easyui-validatebox" 
    	data-options="required:true,missingMessage:'请填写验证码'" style="height:45px;width:200px;font-size:25px;background-color:transparent" onfocus="dj()" onblur="masq()"/>
    	<br/><br/>
     	 <div id="xs" style="display:none;margin-left:1cm"> 
     	 <img id="imgg" style="margin-left:1cm" src="yanzm.jsp"/>&nbsp<a href="javascript:void(0)" onclick="huan()">看不清，换一张</a> 
     	 </div><br/>
        <!-- <font size="4" color="green" style="margin-left:0.5cm">自动登录:</font><input type="checkbox" name="rememberMe" class="easyui-checkbox"> -->
    	<div>
    	 <input id="sub" type="submit" style="height:40px;width:100px;font-size:25px;margin-left:2cm;" value="登&nbsp录" class="input01"/> 
    	</div>
    	</form>
    	<div style="margin-left:2cm">
    	<a id="wjmm" href="${pageContext.request.contextPath }/removepsw.jsp">忘记密码</a>&nbsp&nbsp&nbsp
    	<a href="${pageContext.request.contextPath }/zhuce.jsp">免费注册</a>
    	</div>
    	</center>
</div>
  </body>
</html>
