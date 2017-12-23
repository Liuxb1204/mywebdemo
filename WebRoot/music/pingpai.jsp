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
    <div data-options="name:'all',iconCls:'icon-ok'">品牌名称</div>  
     
    
	</div>
		<br/><br/><br/><br/><br/>
    	  <table id="dancer" class="easyui-datagrid" style="width:600px"
	    	data-options="title:'不言盛景.不叙深情',
	    	              iconCls:'icon-cancel',
	    	              
	    	              striped:false,
	    	              nowrap:false,
	    	              url:'‘${pageContext.request.contextPath}/pinpai/all.do',
	    	              remoteSort:false,
	    	              pagination:true,
	    	              pageList:[3,5,7],
	    	              pageNumber:1,
	    	              pageSize:5,
	    	              toolbar:aa" >  
		    <thead>  
		        <tr>  
		        	 <th data-options="field:'id',width:5,checkbox:true"></th>
		            <th data-options="field:'name',width:100,align:'left'">品牌名称</th> 
		            <th data-options="field:'noname',width:100,align:'left'">品牌别名</th>  
		            <th data-options="field:'logo',width:100,align:'left',formatter:logo">logo图</th>  
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
		    var value;
		   //工具条
		var aa=[{	iconCls:'icon-add',text:"添加品牌",
			            handler:function(){
			            			$("#dia").dialog({
			            					text:"添加频道",
					    					iconCls:"icon-add",
					    					width:450,
					    					height:300,
					    					href:"${pageContext.request.contextPath}/music/pinpai/addpinpai.jsp"
					    				});
			                    }	
			         }
			         ,'-'
			         ,{	iconCls:'icon-remove',text:"批量删除",
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
							url:"${pageContext.request.contextPath}/pinpai/remove.do",
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
			        
			        //搜索框
			         function qq(value,name){   
      					  alert(value+":"+name);
   					 };  
			        
			         function logo(value,row,index){
			        	 //alert(value);
			        	 return "<img height='50px' width='50px' src='../upload/"+value+"'/>";
		       		};
		       		function make(value,row,index){
			        	 //alert(value);
			        	 return "<a href='#' onclick='return bianji("+row.id+");' >编辑</a>";
		       		};
		       		function bianji(id){
		       			//alert(value);
		       			$("#dia").dialog({
						    					title:"修改",
						    					iconCls:"icon-edit",
						    					width:400,
						    					height:400,
						    					href:"${pageContext.request.contextPath}/lanmu/pinpai/exit.jsp"
						    				});
		       			
			       			$.ajax({
			  					url:"<%=path%>/pinpai/querybyid.do",
			  					data:{"id":id},
			  					success:function(data){
			  						//alert(data);
			  							$("input[name='id']").val(data.id);
			  							$("input[name='name']").val(data.name);
			  							$("input[name='noname']").val(data.noname);
			  							$("input[name='logo']").val(data.logo);
			  					},
			  				});
		       		}	
		</script>
  </body>
</html>
