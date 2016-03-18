<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植档案</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 34,allowTopResize:false });
            $(".platItem").hover(function(){$(this).find(".toolsBtn").css("display","inline");},function(){
                $(this).find(".toolsBtn").css("display","none");
            });
        });
        function AddPlantLot(params){
            myopen("${ctx}/Plant/Vegetables/PlantLotEdit.html?params=" +encodeURIComponent(params),"新增种植批次",600,450);
        }
        function plotChecked(id) {
        	console.log(id);
            myopen("${ctx}/Plant/PlantLotShow.html?plotId=" +id,"查看已种植作物","100%","100%");
        }



        function selecCheck(obj) {
            art.dialog.opener.setSelectValue(obj);
            art.dialog.close();
        }

        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            aspnetForm.txt_FarmerName.value = obj["name"]; //将对象的值赋给表单
            aspnetForm.GoodsID.value = obj["no"];
        }

    </script>
    <style>
        .MyNetPage {
            height: 30px;
            line-height: 30px;
            margin-top: 0px;
            width: 100%;
        }
    </style>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">基地名称：</div>
					<div class="sert left">
						<input name="txt_PlotBasesName" type="text" id="txt_PlotBasesName" class="serchInput" />
					</div>
					<div class="rtxt left">地块名称：</div>
					<div class="sert left">
						<input name="txt_PlotName" type="text" id="txt_PlotName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" name="btn_Search" value="查找" id="btn_Search" class="serchButton" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
           <div position="center" style="overflow-y:scroll;">
               <table id="DataPlotList" cellspacing="0" style="border-collapse:collapse;">
			  	<!-- <tr>
                   <td>
                       <div class="platItem pla_used" data-state="1">
                           <ul class="itemData">
                               <li><span class="itemText">基地名称:</span>白水县宏达果业</li>
                               <li><span class="itemText">地块名称:</span>五泉村3号地</li>
                               <li><span class="itemText">区域面积:</span>2468.00亩</li>
                               <li><span class="itemText">农户名称:</span>**</li>
                           </ul>
                           <span class="state_used">使用</span>
                           <dl class="toolsBtn">
                               <dd>
                                   <label class="lbel_AddPlant">
                                       <input type="button" value="新增种植批次" onclick="AddPlantLot('79d42682-69dd-4acc-8c4c-0241285ea73f,2468.00,五泉村3号地,610527001-003');" class="btnAddPlant" />
                                   </label>
                               </dd>
                               <dd>
                                   <label class="lbel_ViewPlant">
                                       <input type="button" value="已种植作物"  onclick="plotChecked('79d42682-69dd-4acc-8c4c-0241285ea73f    ');" class="btnViewPlant" />
                                   </label>
                               </dd>
                           </dl>
                       </div>
                   </td>
                   <td>
                       <div class="platItem pla_unused" data-state="0">
                           <ul class="itemData">
                               <li><span class="itemText">基地名称:</span>秦岭山基地</li>
                               <li><span class="itemText">地块名称:</span>东连栋西八档</li>
                               <li><span class="itemText">区域面积:</span>0.60亩</li>
                               <li><span class="itemText">农户名称:</span>**</li>
                           </ul>
                           <span class="state_unused">使用</span>
                           <dl class="toolsBtn">
                               <dd>
                                   <label class="lbel_AddPlant">
                                       <input type="button" value="新增种植批次" onclick="AddPlantLot('b76843a8-493e-44d1-806a-021402c2d9eb,0.60,东连栋西八档,610403009-1577    ');" class="btnAddPlant" />
                                   </label>
                               </dd>
                               <dd>
                                   <label class="lbel_ViewPlant">
                                       <input type="button" value="已种植作物" title="当前地块还没有种植作物" disabled="disabled" style='color:#747474;' onclick="plotChecked('b76843a8-493e-44d1-806a-021402c2d9eb    ');" class="btnViewPlant" />
                                   </label>
                               </dd>
                           </dl>
                       </div>
                   </td>
                 </tr> -->
				</table>
               <input type="hidden" name="GoodsID" id="GoodsID" />
               <input type="hidden" name="hf_PlotID" id="hf_PlotID" />
               <input type="hidden" name="HDCofarmer" id="HDCofarmer" />
           </div>
           <div position="bottom" style="line-height: 30px;">
			<div id="Pager_Plot" class="MyNetPage">
			<a class="FirstLastButtons" disabled="disabled" style="margin-right:5px;">首页</a><a class="PrevNextButton" disabled="disabled" style="margin-right:5px;">上一页</a><span class="CurrentPageButton" style="margin-right:5px;">1</span><a href="javascript:__doPostBack('Pager_Plot','2')" class="PageButtons" style="margin-right:5px;">2</a><a href="javascript:__doPostBack('Pager_Plot','3')" class="PageButtons" style="margin-right:5px;">3</a><a href="javascript:__doPostBack('Pager_Plot','4')" class="PageButtons" style="margin-right:5px;">4</a><a href="javascript:__doPostBack('Pager_Plot','5')" class="PageButtons" style="margin-right:5px;">5</a><a class="PageButtons" href="javascript:__doPostBack('Pager_Plot','6')" style="margin-right:5px;">...</a><a href="javascript:__doPostBack('Pager_Plot','105')" class="PageButtons" style="margin-right:5px;">105</a><a class="PrevNextButton" href="javascript:__doPostBack('Pager_Plot','2')" style="margin-right:5px;">下一页</a><a class="FirstLastButtons" href="javascript:__doPostBack('Pager_Plot','105')" style="margin-right:5px;">尾页</a>&nbsp;&nbsp;<input type="text" value="1" name="Pager_Plot_input" id="Pager_Plot_input" onkeydown="ANP_keydown(event,'Pager_Plot_btn');" onkeyup="ANP_keyup('Pager_Plot_input');" style="width:30px;" /><input type="submit" value="go" name="Pager_Plot" id="Pager_Plot_btn" onclick="if(ANP_checkInput('Pager_Plot_input',105,'页索引超出范围！','页索引不是有效的数值！')){__doPostBack('Pager_Plot','')} else{return false}" />
			</div>
           </div>
	</div>
	<script type="text/javascript">
	//<![CDATA[
	var theForm = document.forms['form1'];
	if (!theForm) {
	    theForm = document.form1;
	}
	function __doPostBack(eventTarget, eventArgument) {
	    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
	        theForm.__EVENTTARGET.value = eventTarget;
	        theForm.__EVENTARGUMENT.value = eventArgument;
	        theForm.submit();
	    }
	}
	//]]>
	</script>
	<script type="text/javascript">
		$(function(){
			$("#btn_Search").click(function(){
            	$("#DataPlotList").children().remove();
            	loadPlantOperate();
            });
			loadPlantOperate();
		});
		
	    function loadPlantOperate(){
	    	$.ajax({
	    		type:"post",
	    		url:"${ctx}/Plant/getPLot.ajax",
	    		data:{
	    			"plantBaseName":$("#txt_PlotBasesName").val(),
        			"plotName":$("#txt_PlotName").val(),
	    			"page":1,
	    			"limit":10
	    		},
	    		success:function(data){
	    			if(data.success){
	        			composeGrid(data);
	    			}else if(data.message){
	    				alert(data.message);
	    			}
	    		}
	    	});
	    }
	    
	    function composeGrid(json){
			if(json.total == 0)return;
			//构造table布局
			var table = $("#DataPlotList");
			var row = json.data.length / 4 == 0 ? parseInt(json.data.length / 4) : parseInt(json.data.length / 4) + 1;
			for(var t = 0; t < row; t++){
				var tr = $("<tr>");
				var column = json.data.length - ((t + 1) * 4) >= 0 ? 4 : json.data.length - (t * 4);
				for (var i = 0; i < column; i++) {
					//console.log(json.data[t*4+i]);
					var td = $("<td>");
					var div1 = 0,span = 0,input2 = 0;
					if(json.data[t*4+i].STATE == '1'){
						div1 = $('<div class="platItem pla_used" data-state="1">');
						span = $('<span class="state_used">使用</span>');
						input2 = $('<input type="button" value="已种植作物"  onclick="plotChecked(\''+json.data[t*4+i].PLOT_ID+'\');" class="btnViewPlant" />');
					}else if(json.data[t*4+i].STATE == '2'){
						div1 = $('<div class="platItem pla_unused" data-state="0">');
						span = $('<span class="state_unused">未使用</span>');
						input2 = $('<input type="button" value="已种植作物" title="当前地块还没有种植作物" disabled="disabled" style=\'color:#747474;\' onclick="plotChecked(\'b76843a8-493e-44d1-806a-021402c2d9eb\');" class="btnViewPlant" />');
					}
					//var div1 = $('<div class="platItem pla_used" data-state="1">');
					var ul1 = $('<ul class="itemData">');
					var li1 = $('<li><span class="itemText">基地名称:</span>'+json.data[t*4+i].PLANTBASES_NAME+'</li>');
					var li2 = $('<li><span class="itemText">地块名称:</span>'+json.data[t*4+i].PLOT_NAME+'</li>');
					var li3 = $('<li><span class="itemText">区域面积:</span>'+json.data[t*4+i].AREAS+'亩</li>');
					var li4 = $('<li><span class="itemText">农户名称:</span>'+json.data[t*4+i].FARMER_NAME+'</li>');
					//var span = $('<span class="state_used">使用</span>');
					ul1.append(li1).append(li2).append(li3).append(li4);
					div1.append(ul1).append(span);
	                var dl = $('<dl class="toolsBtn">');
	                var dd1 = $('<dd>');
	                var label1 = $('<label class="lbel_AddPlant">');
	                var input1 = $('<input type="button" value="新增种植批次" onclick="AddPlantLot(\'b76843a8-493e-44d1-806a-021402c2d9eb\',0.60,\'东连栋西八档\',\'610403009-1577\');" class="btnAddPlant" />');
	                label1.append(input1);
	                dd1.append(label1);
	                var dd2 = $('<dd>');
	                var label2 = $('<label class="lbel_ViewPlant">');
	                //var input2 = $('<input type="button" value="已种植作物"  onclick="plotChecked(\'79d42682-69dd-4acc-8c4c-0241285ea73f\');" class="btnViewPlant" />');
	                label2.append(input2);
	                dd2.append(label2);
	                dl.append(dd1).append(dd2);
	                div1.append(dl);
	                td.append(div1);
	                tr.append(td);
				}
				table.append(tr);
			}
            $(".platItem").hover(function(){$(this).find(".toolsBtn").css("display","inline");},function(){
                $(this).find(".toolsBtn").css("display","none");
            });
			//构造分页信息
	    }
	</script>
</body>
</html>
