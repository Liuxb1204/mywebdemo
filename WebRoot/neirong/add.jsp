<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
String path = request.getContextPath();
String defaultDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<link rel="stylesheet" href="<%=path%>/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.tools.js"></script>
	<script type="text/javascript" src="<%=path%>/editor/kindeditor.js"></script>
	<script type="text/javascript"	src="<%=path%>/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
		img{height: 50px;width: 50px;}
	</style>
	<script type="text/javascript">
	  	var checkUpload=-1;
	  	var checkForm=-1;
	  	function exitForm(){
	  		location.href="<%=path%>/neirong/wzgl.jsp";
	  	}

  		$(function(){
  			var $tab = $("#tab");
  			$tab.tabs("table.tabContent", {
			tabs: "input",
			event:'click',
			effect:'fade'
		});
		var $title = $("#inputForm :input[title]"); 
		// 表单提示
		$title.tooltip({
			position: "center right",
			effect: "fade"
		});
		if($("#articleType").val()!="pro"){
			$("#channelSelect").parent().parent().show();
			$("input[name='price']").attr("disabled","disabled");
		}else{
			$("#channelSelect").attr("disabled","disabled");
			$("input[name='price']").parent().parent().show();
		}
		
		
		$("#articleType").change(function(){
			var optionIndex = $(this).context.selectedIndex;
			var option = $(this).find("option").eq(optionIndex);
			var optValue=$(option).val();	
			if(optValue=="pro"){
				$("input[name='price']").parent().parent().show();
				$("input[name='price']").attr("disabled",null);
				$("#channelSelect").parent().parent().hide();
				$("#channelSelect").attr("disabled","disabled");
			}else{
				$("input[name='price']").parent().parent().hide();
				$("input[name='price']").attr("disabled","disabled");
				$("#channelSelect").parent().parent().show();
				$("#channelSelect").attr("disabled",null);
			}
			
		});
		//富文本编辑器
		KindEditor.ready(function(K) {
			    editor = K.create("#editor", {
				height: "400px",
				items: [
					"source",  "preview","fullscreen","clearhtml", 
					"undo", "redo","|",
					"copy", "paste","plainpaste", "wordpaste", "|", 
					"justifycenter", "justifyright",
					"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent",  "|", 
					"formatblock", "fontname", "fontsize", 
					 "forecolor", "hilitecolor", "bold",
					"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image","table", "hr", "emoticons", "baidumap", "pagebreak",
					"anchor", "link", "unlink"
				],
				langType: 'zh_CN',
				syncType: "form",
				filterMode: false,
				pagebreakHtml: '<hr class="pageBreak" \/>',
				allowFileManager: true,
				filePostName: "image",
				fileManagerJson:"<%=path%>/image/browser.do",
				uploadJson:  "<%=path%>/image/uploadImage.do",
				extraFileUploadParams: {
					token: getCookie("token")
				},
				afterChange: function() {
					this.sync();
				}
			});
		});
		//添加标签
		$("#addLabel").click(function() {
			$("#labelTr").show();
			var pri='游戏';
			var trHtml = '<tr><th>文章标签:</th><td><input type="hidden" name="leibie" value="'+pri+'" class="text" ><input type="text" name="labels[0].tagValue" class="text label" ><\/td><td> <a href="javascript:;" class="deleteProductImage">[删除]<\/a> <\/td> <\/tr>';
			$("#labelTable").append(trHtml);
		});
		//添加图片tab
		var $addProductImage = $("#addProductImage");
		var productImageIndex = 0;
		var $deleteProductImage = $("a.deleteProductImage");
		// 增加文章图片
		$addProductImage.click(function() {
			var trHtml = '<tr><th>文章大图:</th><td><input type="text" readonly="readonly" id="headPicInput" name="bigimg" class="text" ></td><td><input type="file" name="file1" id="file"/><br/><input type="button" value="上传 " onclick="scc()"/></td></tr>';
			$("#productImageTable").append(trHtml);
		});	
		
		$("#dateinfo").click(function(){
			WdatePicker({
				readyonly:true,
				showClear:true,
				dateFmt:'yyyy-MM-dd HH:mm:ss'
			});
		});			
		
   	});	
   	
  $("input[name='useTrigger']").bind("click",function(){
			if($(this).attr("checked")=="checked"){
				$("input[name='publicDate']").parent().show();
			}else{
				$("input[name='publicDate']").parent().hide();
			}
		});
   	//--------------------------------------------------------------------------------------------
   	
   	 $(function(){
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
  		$("#childSelect").empty();
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
  	/* $('#formButton').bind('click', function(){   
  		alert("提交");
  			
  }); */
  function tijiao(){
  		$('#Form').form('submit', {   
	   			 url:'${pageContext.request.contextPath }/wenzhang/add.do',   
			   	 onSubmit: function(){   
			      return true; 
			    },   
			    success:function(data){   
			        //alert(data);   
			    }   
  		});
  		location.href="${pageContext.request.contextPath}/neirong/wzgl.jsp";
  };
  function sc(){		
			var lo=$("#fil").val();
			$("input[name='headimg']").val(lo);
			$('#Form').form('submit', {   
									    url:"${pageContext.request.contextPath }/file/upload.do",   
									    onSubmit: function(){   
									          
									        return true;   
									    },   
									    success:function(data){   
									       // alert(data);   
									    }   
									}); 
			
	  		};
	  		 function scc(){		
			var lo=$("#file").val();
			$("input[name='bigimg']").val(lo);
			$('#Form').form('submit', {   
									    url:"${pageContext.request.contextPath }/file/upload.do",   
									    onSubmit: function(){   
									          
									        return true;   
									    },   
									    success:function(data){   
									       // alert(data);   
									    }   
									}); 
			
	  		};
	</script>
</head>
<body>
	<form id="Form" action="" method="post"
		enctype="multipart/form-data" novalidate="novalidate">
		<input type="hidden" name="isHotArticle" value="F">
		<input  type="text" name="principal"  value='dancer'/>
		<ul id="tab" class="tab">
			<li><input type="button" value="基本信息" class="current"></li>
			<li><input type="button" value="所属信息" class=""></li>
			<li><input type="button" value="文章图片" class=""></li>
			<li><input type="button" value="正文内容" class=""></li>
		</ul>
		<table class="input tabContent" style="display: table;" >
			<tbody>
				<tr>
					<th><span class="requiredField">*</span>标题:</th>
					<td><input type="text" name="biaoti" 
						class="text" ></td>
				</tr>
				<tr>
					<th><span class="requiredField">*</span>副标题:</th>
					<td><input type="text" name="twobiaoti" class="text" >
					</td>
				</tr>
				<tr>
					<th>作者:</th>
					<td><input type="text" name="whiter" class="text" >
					</td>
				</tr>
				<tr>
					<th>文章类型:</th>
					<td>
						<select id="articleType" name="Type">
							<option value="广告">广告</option>
							<option value="资讯">资讯</option>
							<option value="pro">商品</option>
						</select>
					</td>
				</tr>
				<tr style="display:none">
					<th><span class="requiredField">*</span>价格:</th>
					<td>
						<input type="text" name="price" class="text" >
					</td>
				</tr>
				<tr>
					<th><span class="requiredField">*</span>出处:</th>
					<td>
						<input type="text" name="chucu" class="text" >
					</td>
				</tr>
				<tr>
					<th><span class="requiredField">*</span>链接:</th>
					<td>
						<input type="text" name="link" class="text">
					</td>
				</tr>
				<tr>
					<th><span class="requiredField">*</span>商家:</th>
					<td>
						<input type="text" name="sellername" class="text" >
					</td>
				</tr>
				<tr>
					<th>定时发布<input type="checkbox" name="useTrigger"  value='T'>:</th>
					<td >
						<input class="Wdate text" value="<%=defaultDate%>" type="text" name="shijian" id="dateinfo"  >
					</td>
				</tr>
			</tbody>
		</table>
		<table  id="labelTable"  class="input tabContent" style="display: table;">
			<tbody>
				<tr>
				<th>所属类目:</th>
				<td>
					<select id="asas" name="name" onchange="aa()" >
						<option value="">[请选择]</option>
					</select>
					<select id="categorySelect" name="leimu" onchange="bb()">
						<option value="">[请选择]</option>
					</select>
					<select id="childSelect" >
						<option value="">[请选择]</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>所属频道:</th>
				<td>
					<select id="channelSelect" name="pindao" >
						<option value="" >[请选择]</option>
						<option value="游戏频道" >[游戏频道]</option>
						<option value="yy直播" >[yy直播]</option>
						<option value="探险频道" >[探险频道]</option>
						<option value="国外频道" >[国外频道]</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>所属品牌:</th>
				<td>
					<select id="brandSelect" name="pinpai" >
						<option value="" >[请选择]</option>
						<option value="苹果" >[苹果]</option>
						<option value="爱国者" >[爱国者]</option>
						<option value="香蕉" >[香蕉]</option>
						<option value="锤子" >[锤子]</option>
					</select>
				</td>
			</tr>
			<tr>
				<th></th>
				<td><a href="javascript:;" id="addLabel" class="button">添加标签</a></td>
			</tr>	
			<tr id="labelTr" style="display:none">
				<th></th>
			</tr>
			</tbody>
		</table>
		<table id="productImageTable" class="input tabContent" style="diplay:none;">
			<tr>
				<th>文章头图:</th>
				<td>
					<input type="text" readonly="readonly" id="headPicInput" name="headimg" class="text" >
				</td>
				<td>
					<input type="file" name="file1" id="fil"/><br/>
					<input type="button" value="上传 " onclick="sc()"/>
				</td>
			</tr>
			<tr>	
				<th></th>
				<td><a href="javascript:;" id="addProductImage" class="button">添加大图</a></td>	
			</tr>
		</table>
		<table class="input tabContent" style="display:none;">
			<tr>	
				<td>
					<textarea id="editor" name="content" 
						class="editor" style="width: 100%; display: none;">
					</textarea>
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th></th>
				<td>
					<input id="formButton" type="button" class="button" value="确&nbsp;&nbsp;定" onclick="tijiao();">
					<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="exitForm();">
				</td>								
			</tr>	
		</table>
	</form>
</body>
</html>
