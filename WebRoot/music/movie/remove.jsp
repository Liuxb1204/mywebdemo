<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String name=(String)session.getAttribute("songname");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
		
		
		
	</head>
  
  <body>
  	<center><br/>
    	<table id="dancer" class="easyui-datagrid" style="width:350px;height:300px"  
        data-options="url:'${pageContext.request.contextPath}/movie/all.do',
        fitColumns:true">  
    <thead>  
        <tr> 
        	<th data-options="field:'id',width:5,checkbox:true"></th>  
            <th data-options="field:'img',width:80">电影</th>
            <th data-options="field:'category',width:50">类型</th>     
        </tr>  
    </thead>  
</table> 
<a class="easyui-linkbutton" onclick="removee()">删除</a>&nbsp&nbsp<a id="btn" href="#" class="easyui-linkbutton" onclick="quxiao()">取消</a>
</center>
<script type="text/javascript">
		function removee(){
			selRow=$("#dancer").datagrid("getSelections");//选中的id
			            		if(selRow.length==0){//如果没有选中任何数据行,则提示
				    					$.messager.show({
				    						title:"亲，您有新的消息",
				    						msg:"请选择要删除电影",
				    						timeout:2000,
				    						showType:'slide',
				    						width:200,
				    						height:100
				    					});
				    			}else{ 
						    					var ids=[];
												for (var i = 0; i < selRow.length; i++) {  
										             //获取自定义table 的中的checkbox值  
										             var id=selRow[i].id;   //拿到这个数组的id属性的值 
										          	ids.push(id); //然后把单个id循环放到ids的数组中  
										         }  
					    			$.messager.confirm('提示框', '你确定要删除吗?',function(r){
						    			if(r){
						    			$.ajax({
										    type:"post",   
											url:"${pageContext.request.contextPath}/movie/remove.do",
											data:"id="+ids,   
												success:function(ret){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText
													if(ret==="success"){
									    				$("#dia").dialog("close");//关闭
									    				history.go(0);//刷新当前页面
									    				}				
												}
											});	
						    			return true;
					    				}
										return false;
									});		
								}
		}
		function quxiao(){
				$("#dia").dialog("close");//关闭
		}
</script>
  </body>
</html>
