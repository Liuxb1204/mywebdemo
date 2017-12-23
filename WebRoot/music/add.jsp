<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %> --%>
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
  	<center>
	    <form id="formEdit56" method="post" enctype="multipart/form-data"><br/>
	    	歌名:<input type="text" name="songname" readonly="true"/><br/><br/>
	    	歌手:<input type="text" name="singer" readonly="true"/><br/><br/>
	    	类别:<select id="cc" class="easyui-combobox" name="category" style="width:155px;"> 
				    <option>名谣歌曲</option>  
				    <option>流行音乐</option>  
				    <option>电音之王</option>  
				    <option>中国古风</option>    
				</select><br/><br/> 
	    	<table>	    	
	    	  	<tr style="display:none">	
	  			<td></td>
	  			<td><input type="file" name="file1" id="upfile" onchange="updatefile()"></td> 
	  			</tr>
	  			<tr>
		  		<td></td>
		  		<td><input id="img_url" readonly="true" type="text" name="icon_url"></td>
		  		<td><a class="easyui-linkbutton" onclick="document.getElementById('upfile').click();">上传</a></td>
	  			</tr>
	  		</table><br/>
	  		<div>*音乐格式为：歌名-歌手.mp3</div>
	  		<div>*部分中文歌名可能无法播放</div><br/>
	  		<!-- 有item:update权限才显示修改链接，没有该 权限不显示，相当 于if(hasPermission(item:update)) -->
			<!-- <shiro:hasPermission name="user:create"> -->
	    	<a class="easyui-linkbutton" onclick="abc();">确定</a>
	    	<!-- </shiro:hasPermission> -->
	    	</form>
	    </center>
	    <script type="text/javascript">
	    	 function updatefile(){
        	var imgname=$("#upfile").val();
        	var checkimg=new RegExp("^\\S.*\\.(ape|mp3)$", "i").test(imgname);
			if(imgname==""){
				$.messager.show({
					title:'提示',
					msg:'请选择音乐',
					showType:'show'
				});
			}else if(!checkimg){
				$.messager.show({
					title:'提示',
					msg:'请选择正确的音乐格式(歌手-歌名.mp3/歌手-歌名.ape)',
					showType:'show'
				});
			}else{ 
		         checkUpload=99;
				$('#formEdit56').form('submit', {   
					 url:"${pageContext.request.contextPath}/music/upload.do",  
		             onSubmit: function(){ 
		          		return true;
		      		},
		            success: function(data){
	         			var a=[];
	         			var aa=[];
	         			a=data.split(" - ");
	         			aa=a[1].split(".");
	   					$("input[name='singer']").val(a[0]);
	   					$("input[name='songname']").val(aa[0]);
		            	$("input[name='icon_url']").val(data);
	  					$.messager.show({
							title:'提示',
							msg:'上传成功',
							showType:'show'
						});
					}
				});
			}
         }
	
	    	
	    	function abc(){
	    		//点击了提交按钮,通过form发送异步请求,完成更新动作
	    		$("#formEdit56").form("submit",{
	    			url:"${pageContext.request.contextPath}/music/add.do",
	    			onSubmit:function(){
	    		 var a=$("input[name='songname']").val();
	    			 if(a){
	    				return true;
	    			}
	    			else{ 
	    			$("input[name='icon_url']").val("请选择要上传的音乐");
	    				return false;
	    				}
	    			},
	    			success:function(ret){//请求成功时 响应一个ok   失败时 error
	    				if(ret==="success"){
		    				$("#dia").dialog("close");//关闭
		    				$("#dancer").datagrid("reload");//刷新数据
	    				}else{
	    					$("#dia").dialog("close");//关闭	    					
							jQuery.messager.alert('提示:','歌曲已存在！'); 
	    				}
	    				
	    			}
	    		});
	    	}
	    </script>
  </body>
</html>
