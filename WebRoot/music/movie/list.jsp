<%@ page language="java" import="java.util.*"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<html>
  <head>
    <link rel="stylesheet" type="text/css"	href="<%=path%>/back/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"	href="<%=path%>/back/themes/icon.css">
	<link rel="stylesheet" type="text/css"	href="<%=path%>/back/css/demo.css">
	<script type="text/javascript" src="<%=path%>/back/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"	src="<%=path%>/back/js/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="<%=path%>/back/js/ajaxfileupload.js"></script>
  	<script type="text/javascript">
  		var checkUpload=-1;
  		var checkAddForm=-1;
  		var checkEditForm=-1;
  		function exitForm(){
	  		location.href="<%=path%>/back/page/column/category/list.jsp";
	  	}
	  	function uploadFile(){	
			imgname=$("#uploadFileId").val();
			var checkimg=new RegExp("^\\S.*\\.(jpg|jpeg|bmp|gif|png)$", "i").test(imgname);
			if(imgname==""){
				$.messager.show({
					title:'提示',
					msg:'请选择图片',
					showType:'show'
				});
			}else if(!checkimg){
				$.messager.show({
					title:'提示',
					msg:'请选择正确的图片格式(jpg|jpeg|bmp|gif|png)',
					showType:'show'
				});
			}else{
		         checkUpload=99;
				 $.ajaxFileUpload({  
		            url:'<%=path%>/image/uploadImage.do',  
		            secureuri:false,
		            fileElementId:'uploadFileId',  
		            dataType:'json',  
		            success: function(data){
		            	$("input[name='iconUrl']").val(data['url']);
	         			checkUpload=true;			  		
	  					$.messager.show({
							title:'提示',
							msg:'上传成功',
							showType:'show'
						});
					},
				});
			}			
		}
  		function modifyCategory(){
  			if(checkUpload==99){
				$.messager.show({
					title:'提示',
					msg:'文件上传中,请稍后',
					showType:'show',
					style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
					}
				});
  			}else if(checkEditForm==99){
  				$.messager.show({
					title:'提示',
					msg:'数据传输中,请稍后',
					showType:'show',
					style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
					}
				});
  			}else{
  				checkEditForm=99;
	  			$.ajax({
	  				type:"post",
	  				data:$("#tabForm").serialize(),
	  				url:"<%=path%>/back/modifyCategory.do",
	  				success:function(data){
	  					checkEditForm=data['success'];
	  					if(checkEditForm){
	  						exitForm();
	  					}else{
							$.messager.show({
								title:'提示',
								msg:data['msg'],
								showType:'show'
							});
	  					}
	  				},
	  			});
  			}
  		}	
  		$(function(){
  			$("#tab").datagrid({
  				url:'<%=path%>/back/showCategoryList.do',
  				method:'post',
  				onLoadError:function(){
  						$.messager.alert('提示信息','暂无数据','info');
  					},
  				columns:[[
  					{field:'id',title:'',width:100,checkbox:true},    
        			{field:'name',title:'类目名称',width:100}, 
        			{field:'clevel',title:'类目级别',width:100},   
        			{field:'pc',title:'上级类目',width:100,formatter:function(value,row,index){
        				if(row.parentCategory!=null)
        					return row.parentCategory.name;
        			
        			}},  
        			{field:'ic',title:'icon',width:100,formatter:function(value,row,index){
        				if(row.iconUrl==null||row.iconUrl==""){
        					return "暂无";
        				}else{
        					return "<img height='50px' width='50px' src='"+row.iconUrl+"'/>";
        				}
        			}}, 
       			    {field:'aa',title:'操作',width:100,formatter:function(value,row,index){
       			    	return "<a href='javaScript:' onclick='return openModify("+row.id+");'>编辑</a>";
       			    }}  
       			 ]],
  				striped:true,
  				fitColumns:true,
  				toolbar: [{
					iconCls: 'icon-remove',
					text:"批量删除",
					handler: function(){
					if($("[name=id]:checked").size()==0){
	  					$.messager.alert('提示信息','未选中信息','info');
	  				}else{
						$.ajax({
							url:"<%=path%>/back/removeCategory.do",
							data:$("[name=id]:checked").serialize(),
							success: function(data){
								if(data['success']){
									exitForm();
								}else{
									$.messager.alert('提示信息',data['msg'],'warning');
								}
						 	}
						}); 
	  				}
					}
				},'-',{
					iconCls: 'icon-add',
					text:"添加类目",
					handler: function(){
						var option = $parentSelect.find("option").eq(0);
						option.attr("selected",true);
						$("input[name='id']").val(null);
						$("input[name='name']").val(null);
						$("input[name='clevel']").val(null);
						$("input[name='iconUrl']").val(null);
						$("#qxzp").attr("selected",true);
						var opt=$("<option  value=''>[请选择]</option>");
						$categorySelect.empty();
						$categorySelect.append(opt);
						var optc=$("<option  value=''>[请选择]</option>");
						$childSelect.empty();
						$childSelect.append(optc);
						$("#dia").dialog("open");
						$("#submitForm").click(function(){
							if(checkUpload==99){
								$.messager.show({
									title:'提示',
									msg:'文件上传中,请稍后',
									showType:'show',
									style:{
										right:'',
										top:document.body.scrollTop+document.documentElement.scrollTop,
										bottom:''
									}
								});							
							}else if(checkAddForm==99){
								$.messager.show({
									title:'提示',
									msg:'数据传输中,请稍后',
									showType:'show',
									style:{
										right:'',
										top:document.body.scrollTop+document.documentElement.scrollTop,
										bottom:''
									}
								});	
							}else{	
								checkAddForm=99;
								$.ajax({
									type:"post",
									data:$("#tabForm").serialize(),
									url:"<%=path%>/back/addCategory.do",
									success:function(data){
										checkAddForm=data.success;
										if(checkAddForm){
											exitForm();								
										}else{
											$.messager.alert('提示',data['msg'],'info');
										}
									},
								});
							}		
			   			});
					}
				}],
				pagination:true
  			});
  			
  			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					$("#tab").datagrid("load",{
						"type":name,
						"value":value
					});
				}, 
				menu:'#mm', 
				prompt:'请输入搜索内容' 
			}); 
			
			$("#dia").dialog({
				title: '类目信息',
				top:100,    
	   			width: 500,    
	  			height:300,
	  			closable:false,
				closed: true,
				buttons:'#bb',
				modal:true
			});
			var $parentSelect=$("#parentSelect");
			var $categorySelect=$("#categorySelect");
			var $childSelect=$("#childSelect");
			$parentSelect.ready(function(){
				$.ajax({
					url:'<%=path%>/back/showCategory.do',
					dataType:'json',
					success:function(data){
						if(data['success']){
							$parentSelect.empty();
							var opt=$("<option id='qxzp' value=''>[请选择]</option>");
							$parentSelect.append(opt);
							$.each(data['data'],function(i){
								var opt=$("<option id='opt"+this.id+"' value="+this.id+">"+this.name+"</option>");
								$parentSelect.append(opt);				
							});
						}
					}
				});
				
			});
			$parentSelect.change(function(){
				$parentSelect.attr("name","parentCategory.id");
				$categorySelect.attr("name",null);
				var optionIndex = $(this).context.selectedIndex;
				var option = $(this).find("option").eq(optionIndex);
				var optId=option.val();
				$childSelect.empty();
				var optc=$("<option value=''>[请选择]</option>");
				$childSelect.append(optc);
				if(optId==""){
					$categorySelect.empty();
					var opt=$("<option  value=''>[请选择]</option>");
					$categorySelect.append(opt);
					$parentSelect.attr("name",null);
				}else{
					$.ajax({
						url:'<%=path%>/back/queryCategoryByIdForAjax.do?id='+optId,
						dataType:'json',
						success:function(data){								
							$categorySelect.empty();
							var opt=$("<option  value=''>[请选择]</option>");
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
				$categorySelect.attr("name","parentCategory.id");
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
 		});
  	
		
	function openModify(cid){
		$.ajax({
			url:'<%=path%>/back/queryCategoryByIdForArticleEdit.do?id='+cid,
			dataType:'json',
			success:function(data){
				if(data['success']){
						$("input[name='id']").val(data['data'].id);
						$("input[name='name']").val(data['data'].name);
						$("input[name='clevel']").val(data['data'].clevel);
						$("input[name='iconUrl']").val(data['data'].iconUrl);
						var artCate=data['data'];
						if(artCate.clevel==1){
							$("#parentSelect").attr("name",null);
							$("#categorySelect").attr("name",null);
						}else if(artCate.clevel==2){
							$("#parentSelect").attr("name","parentCategory.id");
							$("#categorySelect").attr("name",null);
							if(artCate.parentCategory!=null){
								$("#opt"+artCate.parentCategory.id).attr("selected",true);
								$("#cateInput").remove();
								var pid=artCate.parentCategory.id;
								cateInput=$("<input id='cateInput' type='hidden' name='parentCategory.id' value='"+pid+"'>");
								$("#formTd").append(cateInput);
							}
						}else if(artCate.clevel==3){
							$("#parentSelect").attr("name",null);
							$("#categorySelect").attr("name","parentCategory.id");
							if(artCate.parentCategory!=null&&artCate.parentCategory.parentCategory){
								$("#opt"+artCate.parentCategory.parentCategory.id).attr("selected",true);
								var opt=$("<option id='opt"+artCate.parentCategory.id+"' value="+artCate.parentCategory.id+">"+artCate.parentCategory.name+"</option>");
								$("#categorySelect").empty();
								$("#categorySelect").append(opt);		
								$("#opt"+artCate.parentCategory.id).attr("selected",true);
								$("#cateInput").remove();
								var optc=$("<option id='opt"+artCate.id+"' value="+artCate.id+">"+artCate.name+"</option>");
								$("#childSelect").empty();
								$("#childSelect").append(optc);
								var pid=artCate.parentCategory.id;
								cateInput=$("<input id='cateInput' type='hidden' name='parentCategory.id' value='"+pid+"'>");
								$("#formTd").append(cateInput);
							}
						}
						$("#dia").dialog("open");
						$("#submitForm").live("click",function(){			
							modifyCategory();
						});
					}else{
						$.messager.show({
							title:'提示',
							msg:data['msg'],
							showType:'show'
						});
					}
				},
				error:function(){
					exitForm();
				}
			});
  		return false;
	}		
  	</script>
  </head>
  <body>
  <br/><br/>
  	<div align="center">
	  	<input id="ss"></input> 
		<div id="mm" style="width:120px"> 
				<div data-options="name:'name'">分类名称</div> 
		</div> 
	</div>
	<br/><br/>
   	<table id="tab"></table>
   	<div id="dia">
		<table align="center">
	<form id="tabForm" action="" method="post">
    		<tr height="50px">
				<th>一级类目:</th>
				<td>
					<select id="parentSelect" name="parentCategory.id" >
						<option value="" >[请选择]</option>
					</select>
					<select id="categorySelect" name="parentCategory.id" >
						<option value="">[请选择]</option>
					</select>
					<select id="childSelect" >
						<option value="">[请选择]</option>
					</select>
				</td>
			</tr>
    		<tr height="50px">
    			<th>类目名称:</th>
    			<td id="formTd">
    				<input  type="hidden" name="id" />
    				<input  type="text" class="text" name="name" />
    				<input  type="hidden" name="clevel" />
    			</td>
    		</tr>
    		<tr height="50px">
    			<th></th>
    			<td>
    				<input type="text" readonly="readonly" class="text easyui-validatebox"  name="iconUrl" >
    			</td>
		</form>
    			<td>
    				<div id="fileBtn" style="cursor:pointer;background-image:url('<%=path%>/back/themes/icons/file.png');  width:84px; height:28px;" onclick="document.getElementById('uploadFileId').click();"></div>
    				<input class="easyui-validatebox" style="display:none;" onchange="uploadFile();" id="uploadFileId" type="file" name="image" >	
				</td>
    		</tr>
		</table>
	</div>
	<div id="bb">
	   	<a href="#" class="easyui-linkbutton" id="submitForm" >保存</a>
		<a href="#" class="easyui-linkbutton" onclick="exitForm()" >关闭</a>
	</div>
  </body>
</html>
