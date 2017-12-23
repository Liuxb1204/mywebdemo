<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String name=(String)session.getAttribute("name");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
		<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script> --%>	
		
		<!--   -->
		<script type="text/javascript">
		function qh(){
			$('#qqh').dialog({//抓取界面
			title:"切换账户",
			width:300,
			height:400,
			href:"${pageContext.request.contextPath}/login.jsp"
			});
		}
		function c(){
			$.messager.alert(
				'温馨小贴士',
				'亲，确定要退出吗？'
			);
		}
		function cl(){
		    $.messager.defaults = { ok: "确定", cancel: "取消" };
			$.messager.confirm(
			'温馨提醒',
			'亲，确定要退出吗？',
			function (r){
				if(r){
				
				location.href="${pageContext.request.contextPath}/login.jsp";
				}else{
				//location.href="${pageContext.request.contextPath}/layout.jsp";
				//alert("取消");
				}
			});
		}
		</script>
		<%-- <a href="${pageContext.request.contextPath}/login.jsp"> --%>
	</head>
	<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:100px;background:#666;padding:8px">
		<div style="text-align:left;margin-left:auto;margin-right:auto;height:10px;width:1000px">
			<font style="font-size:42px;font-family:'华文行楷'">后台转基因太阳能防弹百宝箱</font>
		</div>	<br/><br/>
		<div style="text-align:right">
			您好!&nbsp<div class="logout"><a href="javascript:void(0)" id="sb" class="easyui-splitbutton"  data-options="menu:'#mm'" onclick="adc()"><%=name%></a>  
				<div id="mm" style="width:100px;">
			    	<div data-options="iconCls:'icon-ok'," onclick="qh();">切换账号</div>  
			   		<div data-options="iconCls:'icon-cancel'" onclick="cl();">退出</div>  
				</div> 
					</div>
		</div>
	</div>
	<div data-options="region:'west',split:true,collapsed:false,title:'灵魂摆渡'" style="width:230px;padding:10px;">
		
		<div id="aa" class="easyui-accordion" style="width:200px;height:400px;">  
		   	<div title="用户模块" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">  
		      <div class="panel-header" align="center" style="color:#0099FF"><a href="${pageContext.request.contextPath}/user/user.jsp" target="centerFrame"><font size="3px">用户管理</font></a></div>
		    </div>  
		    <div title="娱乐游戏" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">  
		    		
		         <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/music/music.jsp" target="centerFrame"><font size="3px">网易云音乐</font></a></div>
		         
		          <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/music/movie/video.jsp" target="centerFrame"><font size="3px">电影天堂</font></a></div>
				 <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/music/label/biaoqian.jsp" target="centerFrame"><font size="3px">电音之王</font></a></div>		    
		    	<div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/music/pingpai.jsp" target="centerFrame"><font size="3px">中国古风</font></a></div>  
		    </div>  
		    <div title="内容模块" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">  
		        <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/neirong/remen.jsp" target="centerFrame"><font size="3px">热门文章</font></a></div>
		        <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/neirong/wzgl.jsp" target="centerFrame"><font size="3px">文章管理</font></a></div>
		        <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/neirong/pinglun.jsp" target="centerFrame"><font size="3px">评论管理</font></a></div>   
		    </div> 
		     <div title="数据统计模块" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">  
		       <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/back/page/statistics/page/list.jsp" target="centerFrame"><font size="3px">页面数据统计</font></a></div>  
       			 <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/back/page/statistics/user/list.jsp" target="centerFrame"><font size="3px">用户数据统计</font></a></div>  
       			 <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/back/page/statistics/product/list.jsp" target="centerFrame"><font size="3px">商品数据统计</font></a></div>   
		    </div>  
		     <div title="系统模块" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">  
		        <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/xitong/userlist.jsp" target="centerFrame"><font size="3px">系统用户管理</font></a></div>  
       			 <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/xitong/zulist.jsp" target="centerFrame"><font size="3px">系统组管理</font></a></div>  
       			 <div class="panel-header" align="center" style="color:#0099FF"><a href="<%=path%>/xitong/loglist.jsp" target="centerFrame"><font size="3px">系统日志管理</font></a></div>  
   			 </div>  
		    </div>   
		</div>                                                                                                   		  <!--文本大小和居中  -->
		  <div data-options="region:'south',title:'South Title',split:true,noheader:true" style="height:50px;line-height:30px;text-align:center;">
 © 2009-2016 ZANTONG 北京赞同科技网络技术有限公司京公网安备11000002000019号
		  </div>  
		
	</div>
	<div id="qx" data-options="left:10,top:20,region:'center',collapsed:false,title:'你的眼睛，是我永生不再遇的海。'" style="padding:10px">
		<iframe height="100%" width="100%" border="0" frameborder="0"  name="centerFrame"></iframe>
		<div id="qqh"></div>
	</div>
</body>

</html>
