<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String songname=(String)session.getAttribute("songname");
String jmname=(String)session.getAttribute("jmname");
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
	<div><input id="ss" class="easyui-searchbox" style="width:300px" prompt="搜歌名"
        data-options="searcher:qq,menu:'#mm'"></div>
   
		<br/><br/>
		  	标签:&nbsp<a href="#" onclick="mingyao();"><span id="my">名谣</span></a>&nbsp&nbsp<a href="#" onclick="liuxing();"><span id="lx">流行</span></a>&nbsp&nbsp
				<a href="#" onclick="dainyin();"><span id="dy">电音</span></a>&nbsp&nbsp<a href="#" onclick="gufeng();"><span id="gf">古风</span></a>&nbsp&nbsp
		<br/><br/><br/>
		<form id="form" method="post">
    	  <table id="dancer" class="easyui-datagrid" style="width:800px"
	    	data-options="title:'不言盛景.不叙深情',
	    	              iconCls:'icon-cancel',
	    	              striped:false,
	    	              nowrap:false,
	    	              url:'${pageContext.request.contextPath}/music/all.do',
	    	              remoteSort:false,
	    	              pagination:true,
	    	              pageList:[1,3,5,7],
	    	              pageNumber:1,
	    	              pageSize:5,fitColumns:true,
	    	              toolbar:aa" > 
		    <thead>  
		        <tr>  
		         <th data-options="field:'id',width:5,checkbox:true"></th> 
		         <th data-options="field:'songname',width:150,align:'center'">歌名</th> 
		         <th data-options="field:'singer',width:100,align:'center'">歌手</th>
		         <th data-options="field:'category',width:80,align:'center'">类型</th>
		         <th data-options="field:'state',width:80,align:'center',formatter:make">试听 </th>
		         <th data-options="field:'lyric',width:80,align:'center',formatter:lyricc">歌词</th>
		         <th data-options="field:'xiazai',width:80,align:'center',formatter:download">下载</th>   
		        </tr>  
		    </thead>  
		   
		</table>
		</form>
		<div id="dia"></div>
		<div style="color:green;">正在播放 ：<%=songname%></div><br/><br/>
		<div>
		<audio autoplay="autoplay" controls="controls"loop="loop" preload="auto"
            src="${pageContext.request.contextPath}/uploadfils/<%=jmname%>">
		</audio>
		
		</div>
		</center>
		<script type="text/javascript">
		function mingyao(){
			document.getElementById('my').style.color = "red";
			document.getElementById('lx').style.color = "black";
			document.getElementById('dy').style.color = "black";
			document.getElementById('gf').style.color = "black";
			var aa="my";
			var a="${pageContext.request.contextPath}/music/biaoqianselcet.do?category="+aa;
			$('#dancer').datagrid('options').url = a;
          	$('#dancer').datagrid('reload'); 
		}
		function liuxing(){
			document.getElementById('my').style.color = "black";
			document.getElementById('lx').style.color = "red";
			document.getElementById('dy').style.color = "black";
			document.getElementById('gf').style.color = "black";
			var aa="lx";
			var a="${pageContext.request.contextPath}/music/biaoqianselcet.do?category="+aa;
			$('#dancer').datagrid('options').url = a;
          	$('#dancer').datagrid('reload'); 
		}
		function dainyin(){
			document.getElementById('my').style.color = "black";
			document.getElementById('lx').style.color = "black";
			document.getElementById('dy').style.color = "red";
			document.getElementById('gf').style.color = "black";
			var aa="dy";
			var a="${pageContext.request.contextPath}/music/biaoqianselcet.do?category="+aa;
			$('#dancer').datagrid('options').url = a;//改变dategrid option 的url 属性为a;
          	$('#dancer').datagrid('reload'); //刷新
		}
		function gufeng(){
			document.getElementById('my').style.color = "black";
			document.getElementById('lx').style.color = "black";
			document.getElementById('dy').style.color = "black";
			document.getElementById('gf').style.color = "red";
			var aa="gf";
			var a="${pageContext.request.contextPath}/music/biaoqianselcet.do?category="+aa;
			$('#dancer').datagrid('options').url = a;
          	$('#dancer').datagrid('reload'); 
		}
		
		function make(value,row,index){ 
       	 return "<a href='#' onclick='return bofang("+row.id+");' ><img src='${pageContext.request.contextPath}/css/images/4.jpg' height='20' width='20'/></a>";
  		};
  		function lyricc(value,row,index){
       	 return "<a href='#' onclick='return chakan();' >查看</a>";
  		};
  		function download(value,row,index){
       	 return "<a href='#' onclick='return xiazai("+row.value+");' >下载</a>";
  		};
  		function chakan(){
       	//alert("网络连接失败，无法查看歌词，请稍后重试。。。");
       	$.messager.alert('提示:','网络连接失败，无法查看歌词，请稍后重试。。。','info'); 
  		};
  		function bofang(id){ 
	  		 $.ajax({
				type:"post",   
				url:"${pageContext.request.contextPath}/music/querybyid.do",
				data:"id="+id,   
				success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText				
				if(Name==="ok"){
					history.go(0);
				}
				//$("#mu").attr("src","../uploadfils/Adele - Hello.mp3");
				//$("#mu").setAttribute("src","../uploadfils/Adele - Hello.mp3");
				},
			}); 
  		};
  		function xiazai(value){
       	$.messager.alert('提示:','由于版权问题，暂时无法提供下载。。。','info'); 
  		};
		  var selRow;
		  
		   //工具条
			var aa=[{	iconCls:'icon-add',text:"上传歌曲",
			            handler:function(){
			            			$("#dia").dialog({
			            					text:"添加歌曲",
					    					iconCls:"icon-add",
					    					width:300,
					    					height:300,
					    					href:"${pageContext.request.contextPath}/music/add.jsp"
					    				});
			                    }	
			         }
			         ,'-'
			         ,{	iconCls:'icon-remove',text:"批量删除",
			            handler:function(){
			            	selRow=$("#dancer").datagrid("getSelections");//选中的id
			            		if(selRow.length==0){//如果没有选中任何数据行,则提示
				    					$.messager.show({
				    						title:"亲，您有新的消息",
				    						msg:"请选择要删除歌曲",
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
										$.ajax({
									    type:"post",   
										url:"${pageContext.request.contextPath}/music/remove.do",
										data:"id="+ids,   
										success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText
											$("#dancer").datagrid("load");					
										},
										//dataType:"json",
										});	
									}
					  }			               
			        }];
			        
			        //搜索框
			         function qq(value,name){ 			  
      						$("#dancer").datagrid("load",{
      						name:value
      						});
   					 }  
		</script>
  </body>
</html>
