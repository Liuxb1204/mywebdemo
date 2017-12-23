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
  	<center>
	    <form id="formEdit56" method="post"><br/>
	    	加密名称:<input type="text" name="moviename" readonly="true"/><br/><br/>
	    	电影类别:<select id="cc" class="easyui-combobox" name="category" style="width:155px;"> 
				    <option>动作</option>  
				    <option>喜剧</option>  
				    <option>科幻</option>  
				    <option>动漫</option>    
				</select>

		</form>				<br/>
			<form id="dancer" method="post" enctype="multipart/form-data"> 
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
	  		<div>*部分电影格式可能无法播放</div><br/>
	    	<a class="easyui-linkbutton" onclick="abc();">确定</a>
	    	
	    	</form>
	    	<div id="p" style="width:400px;"></div>
	    </center>
	    <script type="text/javascript">
	    	 function updatefile(){
        	var imgname=$("#upfile").val();
        	var checkimg=new RegExp("^\\S.*\\.(mp4)$", "i").test(imgname);
			if(imgname==""){
				$.messager.show({
					title:'提示',
					msg:'请选择电影',
					showType:'show'
				});
			}else if(!checkimg){
				$.messager.show({
					title:'提示',
					msg:'抱歉！暂仅支持上传MP4格式',
					showType:'show'
				});
			}else{ 
		         checkUpload=99;
				$('#dancer').form('submit', {   
					 url:"${pageContext.request.contextPath}/movie/upload.do",  
		             onSubmit: function(){  
		             return true;
		      		},
		            success: function(data){
	         			//	var a=[];
	         			//var aa=[];
	         			//a=data.split(" - ");
	         			//aa=a[1].split(".");
	   					//$("input[name='singer']").val(a[0]);
	   					$("input[name='moviename']").val(data);
	   					$("input[name='icon_url']").val("上传成功");
		            	//$("input[name='icon_url']").val(data);
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
	    			url:"${pageContext.request.contextPath}/movie/add.do",
	    			onSubmit:function(){
	    			var a=$("input[name='moviename']").val();
	    			 if(a){
	    				return true;
	    			}
	    			else{
	    			$("input[name='icon_url']").val(" ☺ 请选择要上传的电影");
	    				return false;
	    				}
	    			},
	    			success:function(ret){//请求成功时 响应一个ok   失败时 error
	    				//通过ret判断更新是否成功
	    				if(ret==="success"){
	    				$("#dia").dialog("close");//关闭
	    				history.go(0);//刷新当前页面
	    				//$("#dancer").datagrid("load");//刷新
	    				}else{
	    				$("#dia").dialog("close");//关闭	    					
							jQuery.messager.alert('提示:','电影已存在,请尝试修改名字后重新上传！'); 
	    				}
	    			}
	    		});
	    	}
	    </script>
  </body>
</html>
