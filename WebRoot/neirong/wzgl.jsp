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
    <div data-options="name:'all',iconCls:'icon-ok'">文章标题</div>  
     
    
	</div>
		<br/><br/><br/><br/><br/>
    	  <table id="dancer" class="easyui-datagrid" style="width:1000px"
	    	data-options="title:'不言盛景.不叙深情',
	    	              iconCls:'icon-cancel',  
	    	              striped:false,
	    	              nowrap:false,
	    	              url:'${pageContext.request.contextPath}/wenzhang/all.do',
	    	              remoteSort:false,
	    	              pagination:true,
	    	              pageList:[3,5,7],
	    	              pageNumber:1,
	    	              pageSize:5,
	    	              toolbar:aa" >  
		    <thead>  
		        <tr> <th  data-options="field:'id',width:5,checkbox:true"></th> 
		            <th data-options="field:'biaoti',width:70,align:'left'">文章标题</th> 
		             <th data-options="field:'twobiaoti',width:70,align:'left'">副标题</th>
		              <th data-options="field:'whiter',width:70,align:'left'">作者</th>
		               <th data-options="field:'sellername',width:70,align:'left'">商家</th> 
		                <th data-options="field:'type',width:70,align:'left'">文章类别</th> 
		                 <th data-options="field:'pindao',width:70,align:'left'">频道</th> 
		                  <th data-options="field:'leimu',width:70,align:'left'">类目</th> 
		                   <th data-options="field:'pinpai',width:70,align:'left'">品牌</th>
		                   <th data-options="field:'ishot',width:50,align:'left'">热门</th> 
		                    <th data-options="field:'status',width:70,align:'left'">审核状态</th> 
		                     <th data-options="field:'shijian',width:100,align:'left',formatter:dancer">发布时间</th> 
		       				<th data-options="field:'make',width:100,align:'center',formatter:make">操作</th> 
		        </tr>  
		    </thead>  
		</table>
		<div id="dia"></div>
		</center>
		<script type="text/javascript">
		function dancer(value,row,index){
			var d=new Date();
			d.setTime(row.shijian);
			var s=format('yyyy-MM-dd HH:mm:ss',d);
			return s;
		}
		
		function format(fmt,Date) {        
	  	    var o = {        
	  	    "M+" : Date.getMonth()+1, //月份        
	  	    "d+" : Date.getDate(), //日        
	  	    "h+" : Date.getHours()%12 == 0 ? 12 : Date.getHours()%12, //小时        
	  	    "H+" : Date.getHours(), //小时        
	  	    "m+" : Date.getMinutes(), //分        
	  	    "s+" : Date.getSeconds(), //秒        
	  	    "q+" : Math.floor((Date.getMonth()+3)/3), //季度        
	  	    "S" : Date.getMilliseconds() //毫秒        
	  	    };        
	  	    var week = {        
	  	    "0" : "\u65e5",        
	  	    "1" : "\u4e00",        
	  	    "2" : "\u4e8c",        
	  	    "3" : "\u4e09",        
	  	    "4" : "\u56db",        
	  	    "5" : "\u4e94",        
	  	    "6" : "\u516d"       
	  	    };        
	  	    if(/(y+)/.test(fmt)){        
	  	        fmt=fmt.replace(RegExp.$1, (Date.getFullYear()+"").substr(4 - RegExp.$1.length));        
	  	    }        
	  	    if(/(E+)/.test(fmt)){        
	  	        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "\u661f\u671f" : "\u5468") : "")+week[Date.getDay()+""]);        
	  	    }        
	  	    for(var k in o){        
	  	        if(new RegExp("("+ k +")").test(fmt)){        
	  	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));        
	  	        }        
	  	    }        
	  	    return fmt;        
	  	} 

		
			var id;
		    var name;
		    var price;
		   //工具条
		var aa=[{	iconCls:'icon-add',text:"添加文章",
            		handler:function(){
    				//$("#dia").dialog({
    				//	text:"添加频道",
    				//	iconCls:"icon-add",
    				//	width:300,
    				//	height:300,
    				location.href="${pageContext.request.contextPath}/neirong/add.jsp";
				    	//			});
				            }	
				 }
				 ,'-'
				 ,
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
							url:"${pageContext.request.contextPath}/wenzhang/delete.do",
							data:$("[name=id]:checked").serialize(),    
							success:function(Name){//会在请求成功且响应完整时执行,其中的参数abc即xhr.responseText
											
							},
							dataType:"json"//
							});
				    		//$("#dancer").alert('提示信息','推送成功','info');
							$("#dancer").datagrid("load");
				    				}
			                    }
			         },'-'
					 ,
				 {	iconCls:'icon-add',text:"热门推送",
	            		handler:function(){
	            			var trs=$("#dancer").datagrid("getSelections");
		            		if(trs.length==0){//如果没有选中任何数据行,则提示
			    					$.messager.show({
			    						title:"亲，您有新的消息",
			    						msg:"请选择要推送的信息",
			    						timeout:2000,
			    						showType:'slide',
			    						width:200,
			    						height:100
			    					});
			    				}
		            			else{
			    				var tr=trs[0];
			    					id=tr.id;
			    					$.ajax({
									type:"post",   
									url:"${pageContext.request.contextPath}/wenzhang/tuisong.do",
									data:$("[name=id]:checked").serialize(),  
									success:function(Name){//会在请求成功且响应完整时执行,其中的参数abc即xhr.responseText
										if(Name==="success"){
												alert("欧了！推送成功");
											}else{
												alert("扫噶！！！热门最多只能推送六篇");
											}	
									},
									//dataType:"json"//
									});
										$("#dancer").datagrid("load");//刷新
				    				}
			                    }
					 }
					 ,'-'
					 ,{	iconCls:'icon-add',text:"文章审核",
				            		handler:function(){
					    				$("#dia").dialog({
					    					text:"添加频道",
					    					iconCls:"icon-add",
					    					width:300,
					    					height:300,
					    					href:"${pageContext.request.contextPath}/add.jsp"
									    				});
									            }	
									 }
					 ,'-'
					 ,{	iconCls:'icon-add',text:"取消发布",
				            		handler:function(){
					    				$("#dia").dialog({
					    					text:"添加频道",
					    					iconCls:"icon-add",
					    					width:300,
					    					height:300,
					    					href:"${pageContext.request.contextPath}/add.jsp"
									    				});
									            }	
									 }
			        ];    
		 //搜索框
        function qq(value,name){ 			  
				  var a=value;
				$("#dancer").datagrid("load",{
					name:a
				});
			 }  
        function make(value,row,index){
       	 //alert(value);
       	 return "<a href='#' onclick='return chakan("+row.id+");' >查看详情</a>      <a href='#' onclick='return bianji("+row.id+");' >编辑</a>";
  		};
  		function chakan(id){
  			alert("看客姥爷！您直接看编辑吧。。。");
  			//location.href="${pageContext.request.contextPath}/wenzhang/querybyid.do?id="+id;
  		}
  		function bianji(id){
  			location.href="${pageContext.request.contextPath}/wenzhang/querybyid.do?id="+id;
  		}
		</script>
  </body>
</html>
