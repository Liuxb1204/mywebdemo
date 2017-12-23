<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
  	<script type="text/javascript">
  		function exitForm(){
  			location.href = '<%=path%>/back/page/system/systemuser/list.jsp';
  		}
  		$(function(){
  			$("#tab").datagrid({
  				url:'<%=path%>/back/queryAllSystemUser.do',
  				method:'post',
  				onLoadError:function(){
  					$.messager.alert('提示信息','暂无数据','info');
  				},
  				columns:[[
  					{field:'id',title:'',width:100,checkbox:true},    
        			{field:'username',title:'用户名',width:100},    
       				{field:'up',title:'所在组',width:100,formatter:function(value,row,index){
       					var roles="";
	       				$.each(row.roles,function(i){
	       					roles+=this.roleName+"  <input type='hidden' class='code' value='"+this.roleCode+"'>";
	       				});
	       				return roles;
       				}},
       				{field:'uc',title:'负责类目',width:100,formatter:function(value,row,index){
       					var categories="";
       					if(row.categories!=null){
		       				$.each(row.categories,function(i){
		       					categories+=this.name+" ";
		       				});
       					}
	       				return categories;
       				}}
       			 ]],
  				striped:true,
  				fitColumns:true,
  				toolbar: [{
					iconCls: 'icon-add',
					text:"新建用户",
					handler: function(){
					$("#dia").dialog("open");
					$("#addBackUser").click(function(){
						$.ajax({
							url:"<%=path%>/back/addBackUser.do",
							data:$("#userForm").serialize(),
							success: function(data){
							 	if(data['success']){
									exitForm();						 	
							 		$.messager.show({
							 			title:'提示信息',
										msg:'操作成功',
										timeout:2000,
										showType:'slide'	 			
							 		});
							 	}else{
							 	
							 		$.messager.show({
							 			title:'提示信息',
										msg:data['msg'],
										timeout:2000,
										showType:'slide'	 			
							 		});
							 	}
						 	},
						 	error:function(data){
						 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
						 	}
						}); 
					});
					
					}
					
				},'-',{
					iconCls: 'icon-remove',
					text:"删除用户",
					handler: function(){
					if($("[name=id]:checked").size()==0){
						$.messager.alert('提示信息','请选择要删除的用户','info');
					}else{
						$.ajax({
							url:"<%=path%>/back/removeBackUser.do",
							data:$("[name=id]:checked").serialize(),
							success: function(data){
							 	if(data['success']){
								 	exitForm();	
							 		$.messager.show({
							 			title:'提示信息',
										msg:'操作成功',
										timeout:2000,
										showType:'slide'	 			
							 		});
							 	}else{
								 	
							 		$.messager.show({
							 			title:'提示信息',
										msg:data['msg'],
										timeout:2000,
										showType:'slide'	 			
							 		});
							 	}
						 	},
						 	error:function(data){
						 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
						 	}
						}); 
					}
					}
				},'-',{
					iconCls: 'icon-edit',
					text:"更新密码",
					handler: function(){
					if($("[name=id]:checked").size()==0){
						$.messager.alert('提示信息','请选择要更新的用户','info');
					}else{
						$("#newPass").dialog("open");
						$("#changePassword").click(function(){
						var pass=$("input[name='newPassword']").val();
						var pass1=$("input[name='newPassword1']").val();
						if(pass==null||pass1==null||pass==""||pass1==""){
							$.messager.show({
						 			title:'提示信息',
									msg:'请输入密码',
									timeout:2000,
									showType:'slide'	 			
						 		});
						}else{
							if(pass!=pass1){
								$.messager.show({
						 			title:'提示信息',
									msg:'密码不一致',
									timeout:2000,
									showType:'slide'	 			
						 		});
							}else{
								$.ajax({
									url:'<%=path%>/back/restartBackUserPassword.do?newPassword='+pass,
									data:$("[name=id]:checked").serialize(),
									success: function(data){
									 	if(data['success']){
										 	exitForm();	
									 		$.messager.show({
									 			title:'提示信息',
												msg:'操作成功',
												timeout:2000,
												showType:'slide'	 			
									 		});
									 	}else{
										 	
									 		$.messager.show({
									 			title:'提示信息',
												msg:data['msg'],
												timeout:2000,
												showType:'slide'	 			
									 		});
									 	}
								 	},
								 	error:function(data){
								 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
								 	}
								}); 
							}	
						}
						});
					}
					}
				},'-',{
					iconCls: 'icon-edit',
					text:"分配组",
					handler: function(){
						if($("[name=id]:checked").size()==0){
							$.messager.alert('提示信息','请选择用户','info');
						}else{
							rolesData();
							$("#roles").dialog("open");	
							$("#addRole").click(function(){	
								if($("[name='roleIds']:checked").size()==0){
									$.messager.show({
							 			title:'提示信息',
										msg:'请选择组',
										timeout:2000,
										showType:'slide'	 			
									});
								}else{
									$.ajax({
										url:'<%=path%>/back/correlationRoles.do',
										data:$("input[type='checkbox']:checked").serialize(),
										success: function(data){
										 	if(data['success']){
											 	exitForm();	
										 		$.messager.show({
										 			title:'提示信息',
													msg:'操作成功',
													timeout:2000,
													showType:'slide'	 			
										 		});
										 	}else{
											 
										 		$.messager.show({
										 			title:'提示信息',
													msg:data['msg'],
													timeout:2000,
													showType:'slide'	 			
										 		});
										 	}
									 	},
									 	error:function(data){
									 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
									 	}
									}); 
								}
							});		
						}
					}
				},'-',{
					iconCls: 'icon-edit',
					text:"移出组",
					handler: function(){
						if($("[name=id]:checked").size()==0){
							$.messager.alert('提示信息','请选择用户','info');
						}else{
							rolesData();
							$("#roles").dialog("open");	
							$("#addRole").click(function(){	
								if($("[name='roleIds']:checked").size()==0){
									$.messager.show({
										 			title:'提示信息',
													msg:'请选择组',
													timeout:2000,
													showType:'slide'	 			
										 		});
								}else{
									$.ajax({
										url:'<%=path%>/back/uncorrelationRoles.do',
										data:$("input[type='checkbox']:checked").serialize(),
										success: function(data){
										 	if(data['success']){
											 	exitForm();	
										 		$.messager.show({
										 			title:'提示信息',
													msg:'操作成功',
													timeout:2000,
													showType:'slide'	 			
										 		});
										 	}else{
										 		$.messager.show({
										 			title:'提示信息',
													msg:data['msg'],
													timeout:2000,
													showType:'slide'	 			
										 		});
										 	}
									 	},
									 	error:function(data){
									 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
									 	}
									}); 
								}
							});		
						}
					}
				},'-',{
					iconCls: 'icon-edit',
					text:"分配类目",
					handler: function(){
						if($("[name=id]:checked").size()==0){
							$.messager.alert('提示信息','请选择用户','info');
						}else{
							var check=true;
	  						$.each($("input[name=id]:checked"),function(i){
	  							var $tr=$(this).parent().parent().parent();
	  							var $roles=$tr.find(".code");
	  							$.each($roles,function(i){
	  								var code=$(this).val();
	  								if(code=="leimuzhubian"||code=="zhubian"){
	  									check=false;
	  								}
	  							});
	  						});
	  						if(check){
	  							$.messager.alert('提示','请给类目编辑 或 类目主编分配类别');
	  						}else{
								$("#categorySelect").empty();
								$("#options").html("");
								categoryData();
								$("#categories").dialog("open");
								$("#submitForm").click(function(){	
									if($("[name='categoryIds']:checked").size()==0){
										$.messager.show({
											 			title:'提示信息',
														msg:'请选择组',
														timeout:2000,
														showType:'slide'	 			
											 		});
									}else{
										$.ajax({
											url:'<%=path%>/back/correlationCategories.do',
											data:$("input[type='checkbox']:checked").serialize(),
											success: function(data){
											 	if(data['success']){
												 	exitForm();	
											 		$.messager.show({
											 			title:'提示信息',
														msg:'操作成功',
														showType:'slide'	 			
											 		});
											 	}else{
											 		$.messager.show({
											 			title:'提示信息',
														msg:data['msg'],
														showType:'slide'	 			
											 		});
											 	}
										 	},
										 	error:function(data){
										 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
										 	}
										}); 
									}
								});		
	  						}
						}
					}
				},'-',{
					iconCls: 'icon-edit',
					text:"移除类目",
					handler: function(){
						if($("[name=id]:checked").size()==0){
							$.messager.alert('提示信息','请选择用户','info');
						}else{
							var check=false;
	  						$.each($("input[name=id]:checked"),function(i){
	  							var $tr=$(this).parent().parent().parent();
	  							var $roles=$tr.find(".code");
	  							$.each($roles,function(i){
	  								var code=$(this).val();
	  								if(!(code=="leimuzhubian"||code=="zhubian")){
	  									check=true;
	  								}
	  							});
	  						});
	  						if(check){
	  							$.messager.alert('提示','请给类目编辑 或 类目主编移除类别');
	  						}else{
	  							$("#categorySelect").empty();
								$("#options").html("");
								categoryData();
								$("#categories").dialog("open");
								$("#submitForm").click(function(){	
									if($("[name='categoryIds']:checked").size()==0){
										$.messager.show({
											 			title:'提示信息',
														msg:'请选择组',
														timeout:2000,
														showType:'slide'	 			
											 		});
									}else{
										$.ajax({
											url:'<%=path%>/back/uncorrelationCategories.do',
											data:$("input[type='checkbox']:checked").serialize(),
											success: function(data){
											 	if(data['success']){
												 	exitForm();	
											 		$.messager.show({
											 			title:'提示信息',
														msg:'操作成功',
														showType:'slide'	 			
											 		});
											 	}else{
											 		$.messager.show({
											 			title:'提示信息',
														msg:data['msg'],
														showType:'slide'	 			
											 		});
											 	}
										 	},
										 	error:function(data){
										 		$.messager.alert('提示信息','抱歉,请稍后重试','error');
										 	}
										}); 
									}
								});
	  						}
						}
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
				title: '新建用户',    
    			width: 340,    
   				height:200,
				closed: true,
				modal:true
			});
			
			$("#newPass").dialog({
				title: '更新密码',    
    			width: 340,    
   				height:200,
				closed: true,
				modal:true
			});
			$("#roles").dialog({
				title: '选择组',    
    			width: 340,    
   				height:150,
				closed: true,
				modal:true
			});
			$("#categories").dialog({
				title: '类目信息',
				top:100,    
	   			width: 500,    
	  			height:300,
				closed: true,
				buttons:'#bb',
				modal:true
			});
			$("#categorySelect").change(function(){
				var $option=$("#categorySelect option:selected");
				var $checkbox=$('<input type="checkbox" name="categoryIds" value="'+$option.val()+'" checked="checked">'+$option.text());
				var $msgspan=$('<span></span>');
				$msgspan.text($option.text());
				console.info($checkbox);
				$("#options").append($checkbox).append($msgspan);
				$option.remove();
			});
  		});
  		function categoryData(){
  			$.ajax({
				url:'<%=path%>/back/showCategory.do',
				dataType:'json',
				success:function(data){
					if(data['success']){
						$("#categorySelect").empty();
						var opt=$("<option value=''>[请选择]</option>");
						$("#categorySelect").append(opt);
						$.each(data['data'],function(i){
							var opt=$("<option id='opt"+this.id+"' value="+this.id+">"+this.name+"</option>");
							$("#categorySelect").append(opt);				
						});
					}
				}
			});
  		}
  		function rolesData(){
  			$.ajax({
  				url:'<%=path%>/back/queryAllSystemGroup.do',
  				datatype:'json',
  				success:function(data){
  					var checkboxHtml="";
  					$.each(data,function(i){
  						checkboxHtml+='<input type="checkbox" name="roleIds" value="'+this.id+'" >'+this.roleName;
  					});
  					$("#roleCheckbox").html(checkboxHtml);
  				}
  			});
  		}
  	</script>
  </head>
  <body>
  <br/><br/>
  	<div align="center">
	  	<input id="ss"></input> 
		<div id="mm" style="width:120px"> 
				<div data-options="name:'username'">用户名称</div> 
		</div> 
	</div>
	<br/><br/>
   	<table id="tab"></table>
   	<div id="dia">
   	<br><br>
   	<form action="" id="userForm">
   		<table align="center">
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input  type="text" name="username" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input  type="password" name="password" ></input></td>
	    		</tr>
	    </table>
	  </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" id="addBackUser" class="easyui-linkbutton" >确定</a>
	    </div>
   	</div>
   	<div id="newPass">
   		<div style="text-align:center;padding:5px">
	    	新密码&nbsp:<input type="password" name="newPassword" ><br/>
	    	重复密码:<input type="password" name="newPassword1" >
	    </div>
   		<div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" id="changePassword" class="easyui-linkbutton" >确定</a>
	    </div>
   	</div>
   	<div id="roles">
   		<div id="roleCheckbox" style="text-align:center;padding:5px">
	    	
	    </div>
   		<div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" id="addRole" class="easyui-linkbutton" >确定</a>
	    </div>
   	</div>
   	<div id="categories">
   		<select id="categorySelect"></select>
   		<div id="options"></div>
   	</div>
   	<div id="bb">
	   	<a href="#" class="easyui-linkbutton" id="submitForm" >保存</a>
		<a href="#" class="easyui-linkbutton" onclick="exitForm()" >关闭</a>
	</div>
  </body>
</html>
