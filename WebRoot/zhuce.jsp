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
		function yzmm(){
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		var yx=$("#email").val();
			 if(yx!=""&&!reg.test(yx)){
			 	document.getElementById("yzm").style.display="none";
				alert("请输入正确的邮箱格式");
			}else{
				if(yx!=""){
				document.getElementById("yzm").style.display="";
				}	
			}
		}
		function huoquma(){
			var yx=$("#email").val();
			var ma=$("#ma").val();
				$.ajax({
					type:"post",   
					url:"${pageContext.request.contextPath}/user/youx.do",
					data:"email="+yx,   
					success:function(Name){
						$("#jia").val(Name);
						 if(Name=="error"){
							alert("网络未连接，请联网后重试。");
						}else{
							alert("验证码已成功发送至您的邮箱("+yx+")请及时查收！");		
						}
					},
				}); 
		}
	</script>
	
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
	    	用户名称:<input id="name" type="text" name="username"/><br/><br/>
	    	用户密码:<input id="pas" type="password" name="password"/><br/><br/>
	    	确认密码:<input id="pas2" type="password" name="password1"/><br/><br/>
	    	绑定邮箱:<input id="email" type="text" name="email"  onblur="yzmm()"/><br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	    	<button id="yzm" type="button" style="display: none" onclick="huoquma()">获取验证码</button><br/>
	    	&nbsp验证码:<input id="ma" type="text" name="yzma"/><br/><br/>
	    	<a class="easyui-linkbutton" onclick="abc();">注册</a>
	    </form><input id="jia" style="display:none">
	    	
	    <br><br>
	    </div>
	   
	    <script type="text/javascript">
	    	
	    	function abc(){
	    		var a=$("#jia").val();
	    		var ma=$("#ma").val();
		    	if($("#name").val()==""||$("#pas").val()==""||$("#pas2").val()==""){
		    		alert("账号或密码不能为空");
		    	}else if($("#email").val()==""){
		    		alert("邮箱不能为空");
		    	}else if($("#ma").val()==""){
		    		alert("请填写验证码");
		    	}else{
		    		//点击了提交按钮,通过form发送异步请求,完成更新动作
	    		$("#formEdit56").form("submit",{
	    			url:"${pageContext.request.contextPath}/user/zhuce.do",
	    			onSubmit:function(){
						if(a!=ma){
							alert("验证码输入错误，请重新发送。");
							return false;
						}else{
							return true;
						}
	    			},
	    			success:function(ret){//请求成功时 响应一个ok   失败时 error
	    				//通过ret判断更新是否成功
	    				if(ret=="ok"){
	    				location.href="${pageContext.request.contextPath }/tiaoz.jsp";
	    				}else{
		    				alert("账号已存在");
		    				location.reload();//刷新当前界面
	    				}
	    			}
	    		});
		    	}	
	    	}
	    </script>
  </body>
</html>
