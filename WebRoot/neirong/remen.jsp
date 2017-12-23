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
    	  <table id="dancer" class="easyui-datagrid" style="width:600px"
	    	data-options="title:'不言盛景.不叙深情',
	    	              iconCls:'icon-cancel',
	    	              striped:false,
	    	              nowrap:false,
	    	              url:'${pageContext.request.contextPath}/wenzhang/hot.do',
	    	              remoteSort:false,
	    	              pagination:true,
	    	              pageList:[3,5,7],
	    	              pageNumber:1,
	    	              pageSize:5,
	    	              toolbar:aa" >  
		    <thead>  
		        <tr>  <th data-options="field:'id',width:5,checkbox:true"></th> 
		            <th data-options="field:'biaoti',width:100,align:'left'">文章标题</th> 
		            <th data-options="field:'pindao',width:100,align:'left'">频道</th>  
		            <th data-options="field:'type',width:100,align:'left'">文章类型</th>  
		           <th data-options="field:'make',width:100,align:'center',formatter:make">操作</th> 
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
		var aa=[{	iconCls:'icon-remove',text:"批量删除",
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
							url:"${pageContext.request.contextPath}/wenzhang/quxiao.do",
							data:$("[name=id]:checked").serialize(),
							success:function(Name){//会在请求成功且响应完整时执行,其中的参数abc即xhr.responseText
											
							},
							dataType:"json"//
							});
							$("#dancer").datagrid("load");
				    				}
			                    }
			         }
			        ];
		function make(value,row,index){
       		 return "<a href='#' onclick='return bianji("+row.id+");' >编辑</a>";
  		};
  		function bianji(){
  			alert("敬请期待。。。");
  		}
		   
		</script>
  </body>
</html>
