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
		<br/>	
		<div id="cc" class="easyui-layout" style="width:1020px;height:450px;">  
				    
				    
			 <div data-options="region:'east',title:'电影列表',split:true" style="width:187px;">
				    <div id="aa" class="easyui-accordion" style="width:180px;height:352px;">  
				    	<div id="dz" title="动作"  style="overflow:auto;padding:10px;">  
				          <!-- <input id="lo" name='99' style="width:165px;height:35px;background:green" type='button' onmousedown="whichButton(event)" value='顶一下'/> --> 
				    	</div>  
					    <div id="xj" title="喜剧"  style="padding:10px;">  
					         
					    </div>  
					    <div id="dm" title="动漫" >  
					          
					    </div> 
					    <div id="kh" title="科幻" >  
					          
					    </div>  
					</div>	
					<div id="tb">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addmovie()">&nbsp&nbsp上传本地电影</a><br/>
						<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="removemovie()">&nbsp&nbsp批量删除电影 </a>
					</div>
			 </div>  
  
				    <div data-options="region:'center',title:'迷你播放器'" style="padding:5px;background:#eee;">
				    	<center>
				    	
				    	<div id="movieid">
				    	<%-- <video width="720" controls autoplay name="media">
							<source src="${pageContext.request.contextPath}/uploadfils/8090.mp4">		
						</video> --%>
						<br/>
						<font size="6" color="green">欢迎使用迷你播放器</font>
				    	</div>
				    	</center>
				    </div>  
		</div>
				
			
		<div id="dia"></div>
		</center>
		<script type="text/javascript">
		$(function(){//页面加载完毕执行
			$.ajax({
				type:"post",   
				url:"${pageContext.request.contextPath}/movie/bycategory.do",
				data:"category="+"动作",   
				success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText				
					for(var a=0;a<=Name.length;a++){
					//alert(Name[a].img);
					//$("#dz").html("<font color='red'>"+Name[a].img+"</font>");//向div标签里添加东西
					document.getElementById("dz").innerHTML+=                                  
					"<input style='width:155px;height:35px;background:grey;font-size:20px' type='button' onclick='dancer("+Name[a].id+")' value='"+Name[a].img+"'/>";//向div标签里添加东西
					}
				}
				
			}); 
			$.ajax({
				type:"post",   
				url:"${pageContext.request.contextPath}/movie/bycategory.do",
				data:"category="+"喜剧",   
				success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText				
					for(var a=0;a<=Name.length;a++){
					//alert(Name[a].img);
					//$("#dz").html("<font color='red'>"+Name[a].img+"</font>");//向div标签里添加东西
					document.getElementById("xj").innerHTML+=                                  
					"<input style='width:155px;height:35px;background:grey;font-size:20px' type='button' onclick='dancer("+Name[a].id+")' value='"+Name[a].img+"'/>";//向div标签里添加东西
					}
				}
				
			}); 
			$.ajax({
				type:"post",   
				url:"${pageContext.request.contextPath}/movie/bycategory.do",
				data:"category="+"动漫",   
				success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText				
					for(var a=0;a<=Name.length;a++){
					//alert(Name[a].img);
					//$("#dz").html("<font color='red'>"+Name[a].img+"</font>");//向div标签里添加东西
					document.getElementById("dm").innerHTML+=                                  
					"<input style='width:155px;height:35px;background:grey;font-size:20px' type='button' onclick='dancer("+Name[a].id+")' value='"+Name[a].img+"'/>";//向div标签里添加东西
					}
				}
				
			}); 
			$.ajax({
				type:"post",   
				url:"${pageContext.request.contextPath}/movie/bycategory.do",
				data:"category="+"科幻",   
				success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText				
					for(var a=0;a<=Name.length;a++){
					//alert(Name[a].img);
					//$("#dz").html("<font color='red'>"+Name[a].img+"</font>");//向div标签里添加东西
					document.getElementById("kh").innerHTML+=                                  
					"<input style='width:155px;height:35px;background:grey;font-size:20px' type='button' onclick='dancer("+Name[a].id+")' value='"+Name[a].img+"'/>";//向div标签里添加东西
					}
				}
				
			}); 
		});
		function addmovie(){//弹出加载窗口
		$("#dia").dialog({
			iconCls:"icon-add",
			width:300,
			height:250,
			href:"${pageContext.request.contextPath}/music/movie/addmovie.jsp"
		}).dialog('setTitle','上传电影');
		
		}
		function removemovie(){
			$("#dia").dialog({
			width:400,
			height:400,
			href:"${pageContext.request.contextPath}/music/movie/remove.jsp"
			}).dialog('setTitle','批量删除');
		}
		function dancer(id){
			$.ajax({
				type:"post",   
				url:"${pageContext.request.contextPath}/movie/byid.do",
				data:"id="+id,   
				success:function(Name){//会在请求成功且响应完整时执行,其中的参数name即xhr.responseText
					//alert(Name.moviename);
				$("#movieid").html("<video width='720' controls autoplay name='media'><source src="+"${pageContext.request.contextPath}/uploadfils/"+Name.moviename+"></video>");//向div标签里添加东西(覆盖)
				}
			});
		}
		</script>
  </body>
</html>
