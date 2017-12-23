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

	
	
  </head>
  <!-- 
  	更新功能页面
  -->
  <body>
  <script type="text/javascript">
  
  $(function(){
	//  alert("点了");
	var c;
	
		  $.ajax({
				type:"post", 
				url:"${pageContext.request.contextPath }/leimu/queryjb.do", 
				data:"id="+1,   
				success:function(abc){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText
					for(var a=0;a<abc.length;a++){
						c=(abc[a].name);
						$("#asas").append($("<option  value="+c+">["+c+"]</option>"));	
					}
				
				//var opt=$("<option  value=''>[请选择]</option>");
				//	$categorySelect.empty();
				//	$categorySelect.append($("<option  value=''>[请选择]</option>"));
				//	$categorySelect.append($("<option  value=''>["+c+"]</option>"));
						
				},
				dataType:"json"
				});
	  });
  	function aa(){
  		$("#categorySelect").empty();
  		var a=($("#asas").val());
  		$.ajax({
			type:"post",//请求方式:get/post
			url:"${pageContext.request.contextPath }/leimu/queryname.do",
			data:"name="+a,//请求参数
			success:function(abc){//会在请求成功且响应完整时执行,其中的参数abc即xhr.responseText
				for(var a=0;a<abc.length;a++){
					var s=(abc[a]);
					$("#categorySelect").append($("<option  value="+s+">["+s+"]</option>"));
				}	
			},
			dataType:"json"//如果确认响应值为一个json,自动解析响应值,则此时,abc就已经是js对象了.
		});
  	}
  	function bb(){
  		
  		var a=($("#categorySelect").val());
  		$.ajax({
			type:"post",//请求方式:get/post
			url:"${pageContext.request.contextPath }/leimu/querybyname.do",
			data:"name="+a,//请求参数
			success:function(abc){//会在请求成功且响应完整时执行,其中的参数abc即xhr.responseText
				for(var a=0;a<abc.length;a++){
					var s=(abc[a]);
					//alert(s);
					$("#childSelect").append($("<option  value="+s+">["+s+"]</option>"));
				}	
				
			},
			dataType:"json"//如果确认响应值为一个json,自动解析响应值,则此时,abc就已经是js对象了.
		});
  	}
   
    $('#submitForm').click(function(){   
        alert('easyui');   
    });   
  
  </script>
  <br/><br/>
	 	
   	
   	<div id="dia" align="center">
		<table>
	<form id="tabForm" method="post">
    		<tr height="50px">
				<th>一级类目:</th>
				<td>
					<select id="asas" name="name" onchange="aa()" >
						<option value="">[请选择]</option>
					</select>
					<select id="categorySelect" name="parent" onchange="bb()">
						<option value="">[请选择]</option>
					</select>
					<select id="childSelect" >
						<option value="">[请选择]</option>
					</select>
				</td>
			</tr>
    		<tr height="50px">
    			<th>类目名称:</th>
    			<td id="formTd">
    				<input  type="hidden" name="id" />
    				<input  type="text" class="text" name="name" />
    				<input  type="hidden" name="clevel" />
    			</td>
    		</tr>
    		<tr height="50px">
    			<th></th>
    			<td>
    				<input type="text" readonly="readonly" class="text easyui-validatebox"  name="iconUrl" >
    			</td>
		</form>
    			<td>
    				<div id="fileBtn" style="cursor:pointer;background-image:url('<%=path%>/back/themes/icons/file.png');  width:84px; height:28px;" onclick="document.getElementById('uploadFileId').click();"></div>
    				<input class="easyui-validatebox" style="display:none;" onchange="uploadFile();" id="uploadFileId" type="file" name="image" >	
				</td>
    		</tr>
		</table>
	</div>
	<div id="bb">
	   	<a href="" class="easyui-linkbutton" id="submitForm">保存</a>
		<a href="#" class="easyui-linkbutton" onclick="exitForm()" >关闭</a>
	</div>
  </body>
</html>
