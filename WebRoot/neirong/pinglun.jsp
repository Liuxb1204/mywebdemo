<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户管理</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
		
		
		
	</head>
	<body>
	
	
	<center>
	
		
    	  <table id="dancer" class="easyui-datagrid" style="width:800px"
	    	data-options="title:'不言盛景.不叙深情',
	    	              iconCls:'icon-cancel',
	    	              checkbox:true,
	    	              singleSelect:true,
	    	              striped:false,
	    	              nowrap:false,
	    	              url:'javascript:void(0)',
	    	              remoteSort:false,
	    	              pagination:true,
	    	              pageList:[3,5,7],
	    	              pageNumber:1,
	    	              pageSize:5,
	    	              toolbar:aa" >  
		    <thead >  
		        <tr>  
		            <th data-options="field:'id',width:80,align:'left'">评论内容</th> 
		             <th data-options="field:'id',width:10,align:'left'">评论人</th>
		              <th data-options="field:'id',width:10,align:'left'">主帖标题</th>
		              
		            <th data-options="field:'make',width:150,align:'center'">操作</th>   
		             
		        </tr>  
		    </thead>  
		   
		</table>
		<div id="dia"></div>
		</center>
		<script type="text/javascript">
			var id;
		    var name;
		    var price;
		   //工具条
		var aa=[
		        {	iconCls:'icon-remove',text:"批量删除",
			            handler:function(){
			            		var trs=$("#dancer").datagrid("getSelections");
			            		if(trs.length==0){//如果没有选中任何数据行,则提示
				    					$.messager.show({
				    						title:"亲，您有新的消息",
				    						msg:"请选择要删除的数据",
				    						timeout:2000,
				    						showType:'slide',
				    						width:200,
				    						height:100
				    					});
				    				}else{
				    				var tr=trs[0];
				    					id=tr.id;
				    					$.ajax({
							type:"post",   
							url:"${pageContext.request.contextPath}/user/delete.do",
							data:"id="+id,   
							success:function(Name){//会在请求成功且响应完整时执行,其中的参数abc即xhr.responseText
											
							},
							dataType:"json"//
							});
							$("#dancer").datagrid("load");
				    				}
			                    }
			         }
			        ];
			        
			      
		</script>
  </body>
</html>
