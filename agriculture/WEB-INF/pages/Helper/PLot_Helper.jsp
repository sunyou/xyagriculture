<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植批次--选择帮助界面</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var grid2 = null;
        $(document).ready(function () {
        	if (grid2 == null) {
                grid2 = $("#grid").createLigerGrid({
                    header: [
					{display:'选择',width:'50',render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
					{ display: '基地名称', name: 'PlantBases_Name',width:'150' },
                    { display: '地块编号', name: 'Plot_No',width:170},
                    { display: '地块名称', name: 'Plot_Name',width:200},
                    { display: '地块面积(亩)', name: 'Areas', type: 'double', format: '0.00' },
                    { display: '生产责任人', name: 'Farmer_Name' },
                    { display: '土地状态', name: 'State', render: function (rowdata, index, value) { if (value == '1') { return "<font color='#FF5500'>已使用</font>"; } else { return "<font color='#0063DC'>未使用</font>"; } } }
                    ],
                    param: {'plantBaseName': $("#PlantBasesName").val(),'plotName':$("#plotName").val() },
                    editor: {
                        width: 599
                    },
                    height:'390px',
                    title:'地块列表',
                    leftBtns: {
                    	show:false
                    },
                    onSelectRow:function(rowdata, rowid, rowobj){
    					$(rowobj).find("input[type='radio']").attr("checked","checked");
    				},
                    delayLoad: false,
                    keyID: "PLOT_ID",
                    ajaxURL: "${ctx}/Plot/v2/getPlot.ajax"
                });
            } else {
                grid2.setParm('plantBaseName', $("#PlantBasesName").val());
                grid2.setParm('plotName', $("#plotName").val());
                grid2.reload();
            }

            $("#btn_Search").click(function () {
            	grid2.setParm('plantBaseName', $("#PlantBasesName").val());
                grid2.setParm('plotName', $("#plotName").val());
                grid2.reload();
            });
        });
    </script>
</head>
<body>
     <table>
         <tr>
             <td>
                 <div class="rtxt left">基地：</div>
		<div class="sert left">
			<input type="text" id="PlantBasesName" class="serchInput" />
		</div>
		<div class="rtxt left">地块：</div>
		<div class="sert left">
			<input type="text" id="plotName" class="serchInput" />
		</div>
             </td>
             <td>
                 <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
             </td>
         </tr>
     </table>
     <div id="grid"></div>       
</body>
</html>

