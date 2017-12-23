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
	
	<!-- 搜索框 -->
	<center>
	<input id="ss" class="easyui-searchbox" style="width:300px" prompt="请输入要搜索的内容"
        data-options="searcher:qq,prompt:'Please Input Value',menu:'#mm'">
    </input> 
	
	      
	<div id="mm" style="width:120px">  
    <div data-options="name:'all',iconCls:'icon-ok'">用户名称</div>  
    <div data-options="name:'sports'">用户昵称</div> 
     <div data-options="name:'sports'">真实姓名</div>  
	</div>
		<br/><br/><br/><br/><br/>
    	  <table id="dancer" class="easyui-datagrid" style="width:600px"
	    	data-options="title:'不言盛景.不叙深情',
	    	              iconCls:'icon-cancel',
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
		    <thead>  
		        <tr>  
		            <th data-options="field:'id',width:100,align:'left'">用户名称</th>  
		            <th data-options="field:'username',width:100,align:'center'">用户昵称</th>
		            <th data-options="field:'name',width:100,align:'center'">真实姓名</th> 
		            <th data-options="field:'zhuangtai',width:100,align:'center'">用户状态</th> 
		            <th data-options="field:'make',width:100,align:'center'">操作</th>   
		             
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
		var aa=[{	iconCls: 'icon-edit',title:'修改',
				    	handler: function(){
				    				console.log("edit~~");
				    				//在点击编辑工具按钮时,获取其选中的数据行
				    			var trs=$("#dancer").datagrid("getSelections");//获取被选中的行,如果没有选中,返回一个空数组
				    				if(trs.length==0){//如果没有选中任何数据行,则提示
				    					$.messager.show({
				    						title:"亲，您有新的消息",
				    						msg:"请选择要修改的数据",
				    						timeout:2000,
				    						showType:'slide',
				    						width:200,
				    						height:100
				    					});
				    				}else{//选中了数据行,则开始进行修改过程
				    					//获取选中行中的数据
				    					var tr=trs[0];
				    					id=tr.id;
				    					name=tr.username;
				    					price=tr.price;
				    					console.log("编号:"+id+" 名称:"+name+" 月薪:"+price);
					    				//显示dialog
					    				$("#dia").dialog({
					    					title:"修改",
					    					iconCls:"icon-edit",
					    					width:300,
					    					height:300,
					    					href:"${pageContext.request.contextPath}/edit.jsp"
					    				});
				    				}
				    			 }
				     }
			        ,'-'
			        ,{	iconCls:'icon-add',
			            handler:function(){
			            			$("#dia").dialog({
					    					title:"添加",
					    					iconCls:"icon-add",
					    					width:300,
					    					height:300,
					    					href:"${pageContext.request.contextPath}/add.jsp"
					    				});
			                    }	
			         }
			         ,'-'
			         ,{	iconCls:'icon-remove',
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
							$("#dancer").datagrid("reload");
				    				}
			                    }
			         }
			        ];
			        
			        //搜索框
			         function qq(value,name){   
      					  alert(value+":"+name)   
   					 }  
		</script>
  </body>
</html>
