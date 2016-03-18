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
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/content/js/poshytip/tip-darkgray/tip-darkgray.css" rel="stylesheet" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/poshytip/jquery.poshytip.min.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        function selecCheck(obj) {
            art.dialog.opener.setSelectValue(obj);
            art.dialog.close();
        }
        
        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            aspnetForm.txt_FarmerName.value = obj["name"]; //将对象的值赋给表单
            aspnetForm.GoodsID.value = obj["no"];
        }
        $(document).ready(function(){
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });

        });

        function showCotrl(title,id){
            parent.f_addTab(null,"查看"+title+"的种植档案","${ctx}/Plant/Archives/PlantLot_Related.html?plotId="+id);
        
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
						<input type="button" name="Button2" value="查找" id="Button2" class="serchButton" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
        <div position="center" style="overflow-y:scroll;">
            <table id="DataPlotList" cellspacing="0" style="height:104px;border-collapse:collapse;">
				<!-- <tr>
					<td>
                     <div class="platItem">
                         <ul class="itemData">
                             <li><span class="itemText">基地名称:</span>葡萄基地</li>
                             <li><span class="itemText">地块名称:</span>一号地块</li>
                             <li><span class="itemText">区域面积:</span>10.00亩</li>
                             <li><span class="itemText">农户名称:</span>**</li>
                             <div class="hoverInfo" style="display: none">
                                 <ul>
                                     <li><font color="#040404">生产者:</font><font color='#FB5B0A'>运城市向阳富民专业合作社</font></li>
                                     <li><font color="#040404">种植作物:</font><font color='#518F2C'>葡萄(夏黑)</font></li>
                                 </ul>
                             </div>
                         </ul>
                         <div class="itemHead">
                             <input type="button" class="showDetail" value="查看种植档案"
                                 onclick="showCotrl('葡萄基地    ','339df95e-cf6b-4003-a70c-9b586110787a');" />
                         </div>
                     </div>
                	</td>
				</tr> -->
			</table>
            <input type="hidden" name="GoodsID" id="GoodsID" />
            <input type="hidden" name="__CurrentPage" id="__CurrentPage" value="1" />
            <input type="hidden" name="__PageCount" id="__PageCount" value="0" />
            <input type="hidden" name="HDCofarmer" id="HDCofarmer" />
        </div>
        <div position="bottom">
			<div id="Pager_PlantClear" class="MyNetPage">
				<a class="FirstLastButtons" disabled="disabled" style="margin-right:5px;">首页</a><a class="PrevNextButton" disabled="disabled" style="margin-right:5px;">上一页</a>
				<span class="CurrentPageButton" style="margin-right:5px;">1</span>
				<a href="javascript:__doPostBack('Pager_PlantClear','2')" class="PageButtons" style="margin-right:5px;">2</a>
				<a href="javascript:__doPostBack('Pager_PlantClear','3')" class="PageButtons" style="margin-right:5px;">3</a>
				<a href="javascript:__doPostBack('Pager_PlantClear','4')" class="PageButtons" style="margin-right:5px;">4</a>
				<a href="javascript:__doPostBack('Pager_PlantClear','5')" class="PageButtons" style="margin-right:5px;">5</a>
				<a class="PageButtons" href="javascript:__doPostBack('Pager_PlantClear','6')" style="margin-right:5px;">...</a>
				<a href="javascript:__doPostBack('Pager_PlantClear','105')" class="PageButtons" style="margin-right:5px;">105</a>
				<a class="PrevNextButton" href="javascript:__doPostBack('Pager_PlantClear','2')" style="margin-right:5px;">下一页</a>
				<a class="FirstLastButtons" href="javascript:__doPostBack('Pager_PlantClear','105')" style="margin-right:5px;">尾页</a>&nbsp;&nbsp;
				<input type="text" value="1" name="Pager_PlantClear_input" id="Pager_PlantClear_input" onkeydown="ANP_keydown(event,'Pager_PlantClear_btn');" onkeyup="ANP_keyup('Pager_PlantClear_input');" style="width:30px;" />
				<input type="submit" value="go" name="Pager_PlantClear" id="Pager_PlantClear_btn" class="PageButtons" onclick="if(ANP_checkInput('Pager_PlantClear_input',105,'页索引超出范围！','页索引不是有效的数值！')){__doPostBack('Pager_PlantClear','')} else{return false}" />
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
    <script>
        $(document).ready(function() {
            $(".platItem").hover(function() {
                $(this).addClass("platItemHover");
            }, function() {
                $(this).removeClass("platItemHover");
            });
            
            $("#Button2").click(function(){
            	$("#DataPlotList").children().remove();
            	loadPlotArchives();
            });
            //
            loadPlotArchives();
        });
        
        function loadPlotArchives(){
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
        			//console.log(data);
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
			var row = json.data.length / 4 == 0 ? json.data.length / 4 : json.data.length / 4 + 1;
			for(var t = 0; t < row; t++){
				var tr = $("<tr>");
				var column = json.data.length - ((t + 1) * 4) >= 0 ? 4 : json.data.length - (t * 4);
				for (var i = 0; i < column; i++) {
					var td = $("<td>");
					var div1 = $('<div class="platItem">');
					var ul1 = $('<ul class="itemData">');
					var li1 = $('<li><span class="itemText">基地名称:</span>'+json.data[t*4+i].PLANTBASES_NAME+'</li>');
					var li2 = $('<li><span class="itemText">地块名称:</span>'+json.data[t*4+i].PLOT_NAME+'</li>');
					var li3 = $('<li><span class="itemText">区域面积:</span>'+json.data[t*4+i].AREAS+'</li>');
					var li4 = $('<li><span class="itemText">农户名称:</span>'+json.data[t*4+i].FARMER_NAME+'</li>');
					var div2 = $('<div class="hoverInfo" style="display: none">');
					var ul2 = $('<ul>');
					var li21 = $('<li><font color="#040404">生产者:</font><font color="#FB5B0A">'+json.data[t*4+i].COFARMER_NAME+'</font></li>');
					var li22 = $('<li><font color="#040404">种植作物:</font><font color="#518F2C">'+((json.data[t*4+i].GOODSVALUE+'') == 'undefined' ? '' : json.data[t*4+i].GOODSVALUE) +'</font></li>');
					ul2.append(li21).append(li22);
					div2.append(ul2);
					ul1.append(li1).append(li2).append(li3).append(li4).append(div2);
					var div3 = $('<div class="itemHead">');
					var input = $('<input type="button" class="showDetail" value="查看种植档案" onclick="showCotrl(\''+json.data[t*4+i].PLANTBASES_NAME+'\',\''+json.data[t*4+i].PLOT_ID+'\');" />');
					div3.append(input);
					div1.append(ul1).append(div3);
					td.append(div1);
					tr.append(td);
				}
				table.append(tr);
			}
			//构造分页信息
			
			//渲染
            $('.platItem').poshytip({
                className: 'tip-darkgray',
                content: function(){return $(this).find('.hoverInfo').html();},
                //content: 'hello',
                alignTo: 'target',
                alignX: 'center',
                alignY: 'center',
                offsetX: 0,
                showTimeout: 100
            });
        }
    </script>

</body>
</html>
