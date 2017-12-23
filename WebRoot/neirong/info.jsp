<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String defaultDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
%>
<html>
<head>
	<link rel="stylesheet" href="<%=path%>/back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="<%=path%>/back/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=path%>/back/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/back/js/jquery.tools.js"></script>
	<script type="text/javascript" src="<%=path%>/back/editor/kindeditor.js"></script>
	<script type="text/javascript" src="<%=path%>/back/js/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
		img{height: 50px;width: 50px;}
	</style>
	<script type="text/javascript">
	  	function exitForm(){
	  		location.href="<%=path%>/back/page/content/article/list.jsp";
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
			var trHtml = '<tr><th><input type="hidden"  name="labels[0].id" value="" class="text" maxlength="200"></th><td><input type="text" name="labels[0].tagValue" class="text label" maxlength="200"><\/td><td> <a href="javascript:;" class="deleteLabel">[删除]<\/a> <\/td> <\/tr>';
			$("#labelTable").append(trHtml);
		});
		//添加图片tab
		var $addProductImage = $("#addProductImage");
		var $deleteProductImage = $("a.deleteProductImage");
		var productImageIndex=0;
		$("#headPic").browser({
					browserUrl: "<%=path%>/image/browser.do",
					uploadUrl: "<%=path%>/image/uploadImage.do"
		});
		// 增加文章图片
		$addProductImage.click(function() {
			var trHtml = '<tr><th></th><td><input type="text" name="pictures[0].picUrl" class="text picture" maxlength="200"><input type="button" class="button browserButton" value="选择文件" /><\/td><td> <a href="javascript:;" class="deleteProductImage">[删除]</a> </td> </tr>';
			$("#productImageTable").append(trHtml).find("input.browserButton").browser({
				browserUrl: "<%=path%>/image/browser.do",
				uploadUrl: "<%=path%>/image/uploadImage.do"
			});;
		});
		$("input.browserButton1").browser({
				browserUrl: "<%=path%>/image/browser.do",
				uploadUrl: "<%=path%>/image/uploadImage.do"
		});
				
		// 删除文章图片
		$deleteProductImage.live("click", function() {
			var $this = $(this);
			var id =$this.attr("val");
			if(typeof(id) == 'undefined'){
				$.dialog({
				type: "warn",
				content: "您确定要删除吗？",
				onOk:function(){
					$this.closest("tr").remove();
				}
			})
			}
			else{
			$.dialog({
				type: "warn",
				content: "您确定要删除吗？",
				onOk: function() {
					$.ajax({
						url:"<%=path%>/back/removeBigPicture.do?id="+id,
						success:function(data){
							if(data['success']){
								$this.closest("tr").remove();
							}else{
								$.message("warn",data['msg']);
							}
						}
					});
				}
			});
			}
			
		});
		// 删除
		$("a.deleteLabel").live("click", function() {
			var $this = $(this);
			var id =$this.attr("val");
			if(typeof(id) == 'undefined'){
				$.dialog({
				type: "warn",
				content: "您确定要删除吗？",
				onOk:function(){
					$this.closest("tr").remove();
				}
				});
			}else{
				$.dialog({
				type: "warn",
				content: "您确定要删除吗？",
				onOk: function() {
					$.ajax({
						url:"<%=path%>/back/removeLabel.do?id="+id,
						success:function(data){
							if(data['success']){
								$this.closest("tr").remove();
							}else{
								$.message("warn",data['msg']);
							}
						}
					});
				}
			});
			}
			
		});
		
		function selectData(selectJquery,url,dataName){
			$.ajax({
				url:url,
				success:function(data){
					if(data['success']==false){
						alert(data['msg']);
					}else{
						selectJquery.empty();
						var opt=$("<option value=''>[请选择]</option>");
						selectJquery.append(opt);
						$.each(data['data'],function(j){
							var opt=$("<option id="+dataName+this.id+" value="+this.id+">"+this.name+"</option>");
							selectJquery.append(opt);
						});
					}
					if(dataName=="channel")
					$("#"+dataName+"${data.channel.id}").attr("selected",true);
					if(dataName=="brand")
					$("#"+dataName+"${data.brand.id}").attr("selected",true);
				}
			});
		}
		
		selectData($("#channelSelect"),"<%=path%>/back/showChannel.do","channel");
		selectData($("#brandSelect"),"<%=path%>/back/showBrand.do","brand");
		var $parentSelect=$("#parentSelect");
		var $categorySelect=$("#categorySelect");
		var $childSelect=$("#childSelect");
		function optionSelected(){
			var cid='${data.category.id}';
			$.ajax({
				url:'<%=path%>/back/queryCategoryByIdForArticleEdit.do?id='+cid,
				dataType:'json',
				success:function(data){
					var $categoryInput=$("#categoryInput");
					if(data['success']){
						var artCate=data['data'];
						$("#categoryhidden").val(artCate.id);
						if(artCate.clevel==1){
							$categoryInput.val(artCate.name);
						}else if(artCate.clevel==2){
							$categoryInput.val(artCate.parentCategory.name+" >> "+artCate.name);
						}else if(artCate.clevel==3){
							$categoryInput.val(artCate.parentCategory.parentCategory.name+" >>  "+artCate.parentCategory.name+" >> "+artCate.name);
						}
					}
				}
			});
		}
		$parentSelect.ready(function(){
			$.ajax({
				url:'<%=path%>/back/showCategory.do',
				dataType:'json',
				success:function(data){
					if(data['success']){
						$parentSelect.empty();
						var opt=$("<option value=''>[请选择]</option>");
						$parentSelect.append(opt);
						$.each(data['data'],function(i){
							var opt=$("<option id='opt"+this.id+"' value="+this.id+">"+this.name+"</option>");
							$parentSelect.append(opt);				
						});
						optionSelected();
					}
				}
			});
			
		});
		$parentSelect.change(function(){
			$parentSelect.attr("name","category.id");
			$categorySelect.attr("name",null);
			$childSelect.attr("name",null);
			$("#categoryhidden").attr("name",null);
			var optionIndex = $(this).context.selectedIndex;
			var option = $(this).find("option").eq(optionIndex);
			var optId=option.val();
			if(optId==""){
				$categorySelect.empty();
				$childSelect.empty();
				var opt=$("<option value=''>[请选择]</option>");
				var opt1=$("<option value=''>[请选择]</option>");
				$categorySelect.append(opt);
				$childSelect.append(opt1);
				$("#categoryhidden").attr("name","category.id");
				$parentSelect.attr("name",null);
			}else{
				$.ajax({
					url:'<%=path%>/back/queryCategoryByIdForAjax.do?id='+optId,
					dataType:'json',
					success:function(data){								
						$categorySelect.empty();
						var opt=$("<option value=''>[请选择]</option>");
						$categorySelect.append(opt);
						$.each(data['data'].childrenCategorys,function(i){
							var opt=$("<option id='opt"+this.id+"' value="+this.id+">"+this.name+"</option>");
							$categorySelect.append(opt);
						});			 						
					}
				});
			}
		});
		$categorySelect.change(function(){
			$parentSelect.attr("name",null);
			$categorySelect.attr("name","category.id");
			$childSelect.attr("name",null);
			$("#categoryhidden").attr("name",null);
			var optionIndex = $(this).context.selectedIndex;
			var option = $(this).find("option").eq(optionIndex);
			var optId=option.val();
			if(optId==""){
				$childSelect.empty();
				var opt=$("<option value=''>[请选择]</option>");
				$childSelect.append(opt);
			}else{
				$.ajax({
					url:'<%=path%>/back/queryCategoryByIdForAjax.do?id='+optId,
					dataType:'json',
					success:function(data){
						$childSelect.empty();
						var opt=$("<option value=''>[请选择]</option>");
						$childSelect.append(opt);
						$.each(data['data'].childrenCategorys,function(i){
							var opt=$("<option id='opt"+this.id+"' value="+this.id+">"+this.name+"</option>");
							$childSelect.append(opt);
						});			 		
					}
				});
			}
		});
		$childSelect.change(function(){
			$parentSelect.attr("name",null);
			$categorySelect.attr("name",null);
			$childSelect.attr("name","category.id");
			$("#categoryhidden").attr("name",null);
			var optionIndex = $(this).context.selectedIndex;
			var option = $(this).find("option").eq(optionIndex);
			var optId=option.val();
			if(optId==""){
				$childSelect.attr("disbaled","disbaled");
			}else{
				$childSelect.attr("disbaled",null);
			}
		});
		
		
		//提交表单
		$("#formButton").click(function(){
			//重新维护标签和大图的下表
			var labelNames=$("input[name='labels[0].tagValue']");
			var labelIds=$("input[name='labels[0].id']");
			var pictureNames=$("input[name='pictures[0].picUrl']");
			var pictureIds=$("input[name='pictures[0].id']");
			for(var i = 0 ;  i<labelNames.length;i++){
				$(labelNames[i]).attr("name","labels["+ i +"].tagValue");
				$(labelIds[i]).attr("name","labels["+ i +"].id");
			}
			for(var i = 0 ;  i<pictureNames.length;i++){
				$(pictureNames[i]).attr("name","pictures["+i+"].picUrl");
				$(pictureIds[i]).attr("name","pictures["+i+"].id");
			}
			$.ajax({
				type:"post",
				url:'<%=path%>/back/modifyArticle.do',
				data:$("#inputForm").serialize(),
				success:function(data){
						if(data['success']){
	  						$.message("warn","更新成功");
	  						exitForm();
	  					}else{
	  						$.message("warn",data['msg']);
	  					}
 					},
  				error:function(){
  						$.message("error","服务忙,请稍后重试");
  				}
			});
		});
		$("#dateinfo").click(function(){
			WdatePicker({
				readyonly:true,
				showClear:true,
				dateFmt:'yyyy-MM-dd HH:mm:ss'
			});
		});
   	});
	</script>
</head>
<body>
	<form id="inputForm" action="" method="post"
		enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li><input type="button" value="基本信息" class="current"></li>
			<li><input type="button" value="所属信息" class=""></li>
			<li><input type="button" value="文章图片" class=""></li>
			<li><input type="button" value="正文内容" class=""></li>
		</ul>
		<input type="hidden" name="id" value="${data.id}"> 
		<input  type="hidden" name="principal"  value=${principal } />
		<input type="hidden" name="isHotArticle" value="F">
		<table class="input tabContent" style="display: table;" >
			<tbody>
				<tr>
					<th>标题:</th>
					<td><input type="text" name="articleTitle" value="${data.articleTitle }"
						class="text" maxlength="200"></td>
				</tr>
				<tr >
					<th>副标题:</th>
					<td><input type="text" name="articleSubTitle" value="${data.articleSubTitle }"
					 class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>作者:</th>
					<td><input type="text" name="staff" value="${data.staff }"
					class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>文章类型:</th>
					<td>
						<select id="articleType" name="articleType">
							<option value="gg" 
								<c:if test='${data.articleType=="gg" }' >selected="true"</c:if>
							>广告</option>
							<option value="info" 
								<c:if test='${data.articleType=="info" }'>selected="true"</c:if>
							>资讯</option>
							<option value="pro"
								<c:if test='${data.articleType=="pro" }'>selected="true"</c:if>
							>商品</option>
						</select>
					</td>
				</tr>
				<tr style="display:none">
					<th>价格:</th>
					<td><input type="text" name="price" value="${data.price }"
					 class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>出处:</th>
					<td><input type="text" name="articleFrom" value="${data.articleFrom }"
					class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>链接:</th>
					<td><input type="text" name="articleLink" value="${data.articleLink }"
					 class="text" >
					</td>
				</tr>
				<tr>
					<th>商家:</th>
					<td><input type="text" name="sellerName"	value="${data.sellerName}"
					 class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>发布时间:</th>
					<td>
						<input class="Wdate text" value="${data.publicDate}" type="text" name="publicDate" id="dateinfo"  >
					</td>
				</tr>
			</tbody>
		</table>
	<table id="labelTable" class="input tabContent" style="display: none;" >
		<tbody>
			<tr>
				<th>原始类目：</th>
				<td>
				<input id="categoryhidden" type="hidden" name="category.id" class="text" size="10">
				<input id="categoryInput" type="text" class="text" size="50"></td>
			</tr>
			<tr style="display:none">
				<th>所属频道:</th>
				<td>
					<select id="channelSelect" name="channel.id" disabled="disabled">
						<option value="">[请选择]</option>
					</select>
				</td>
			</tr>
			<tr >
				<th>所属品牌:</th>
				<td>
					<select id="brandSelect" name="brand.id"  disabled="disabled">
						<option value="">[请选择]</option>
					</select>
				</td>
			</tr>
		<c:forEach items="${data.labels }" var="label" varStatus="vs">
			<tr>	
				<th>文章标签:</th>		
				<td>
				<input type="text" name="labels[0].tagValue" class="text label"  value="${label.tagValue}"></td>
			</tr>	
		</c:forEach>
	
			</table>

		<table id="productImageTable" class="input tabContent" style="display: table;" >
			<tr>
				<th>文章头图</th>
				<td>
					<img  src="${data.headPic }">
				</td>
			</tr>
			<c:forEach varStatus="vs" items="${data.pictures }" var="picture">
				<tr>
					<th>文章大图:</th>
					<td>
						<img alt="" src="${picture.picUrl }">
					</td>
				</tr>
			</c:forEach>
			</table>
			<table class="input tabContent" style="display: table;" >
				<tr>
					<td>
						<textarea id="editor" name="articleContent" 
							class="editor" style="width: 100%;display:none">
						${data.articleContent }
						</textarea>
					</td>
				</tr>
		</table>
		<table class="input">
				<tr>
					<th>&nbsp;</th>
					<td>
						<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="exitForm();">
					</td>								
				</tr>	
			</tbody>
		</table>
	</form>
</body>
</html>
