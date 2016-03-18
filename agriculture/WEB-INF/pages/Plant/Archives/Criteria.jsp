<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植标准</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var show =false;
		var grid = null;
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '种植规范和标准名称', name: 'CritereriaDoc_Name', align: 'left', width: '200',render: function (rowdata, index, value) {
                    	return "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showCriterialDocDet('"+rowdata["CRITERIADOC_ID"]+"');\">"+value+"</a>";
                    }},
                    { display: '农作物', name: 'Goods_Names', align: 'left' },
                    { display: '种植方式', name: 'CRITERIA_LEVEL', align: 'left' },
                    { display: '标准制作者', name: 'Criteria_Maker', align: 'left' },
                    { display: '标准类型', name: 'CriteriaType'},
                    { display: '下载', 
                    	render: function (rowdata, index, value) { 
                    		if((rowdata["DOCFILEPATH"]+'') === "undefined" || rowdata["DOCFILEPATH"] === undefined){
                    			return '';
                    		}else{
                    			return "<input value='下载文档' type=button class='rowEditButton'  onclick='window.open(\"${ctx}/Download?filePath=" + rowdata["DOCFILEPATH"] + "\")' >"; 
                    		}
                    	} 
                    }
                ],
                param: { 'docType':$("#docType").val(),'criteriaName': $("#txt_CritereriaDoc_Name").val()
                },
				editor: {
				    width: 450,
                    height: 420
                },
				leftBtns: {
					show:false
					<shiro:hasPermission name="1604:Criteria.edit"> 
						,show:true,    
					    width: 160,
					    showDelete: {
					        url: "${ctx}/Plant/delCriteriaDoc.ajax",
					        close: function () {
					            grid.reload();
					        },
					        show: true
					    },
					    showDetail: {
					    	show: false,
					        url: "${ctx}/Plant/Archives/CriteriaDet.html",
	                        height:360,
	                        width:660
					    },
					    showEdit: {
					        url: "${ctx}/Plant/Archives/CriteriaEdit.html",
	                        height:360,
	                        width:660,
	                        close: function () {
					            grid.reload();
					        },
	                        title:'修改种植规程和标准'
					    }
					</shiro:hasPermission>
				},
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "CRITERIADOC_ID",
                ajaxURL: "${ctx}/Plant/GetCriteria.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("docType", $("#docType").val());
                grid.setParm("criteriaName", $("#txt_CritereriaDoc_Name").val());
                grid.reload();
            });
			
			$("#btn_Add").click(function () {
				var title = '新增标准文档';
				var docType = $("#docType").val();
				if(docType === '1'){
					title = '新增农作物种植标准';
				}else if(docType === '2'){
					title = '新增无公害生产标准';
				}else if(docType === '3'){
					title = '新增农资使用标准';
				}
			    ligerWin(660, 360, '${ctx}/Plant/Archives/CriteriaEdit.html?docType='+$("#docType").val(), title,
			    function(){
			    	grid.setParm("docType", $("#docType").val());
	                grid.reload();
			    });
            });
        });

		function showCriterialDocDet(id){
		    myopen("${ctx}/Plant/Archives/CriteriaDet.html?id="+id,"标准明细",660,360);
		}
    </script>
</head>
<body>
	<div id="layout">
		<input type="hidden" id="docType" name="docType" value="${docType }"/>
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">标准名称：</div>
					<div class="sert left">
						<input type="text" name="txt_CritereriaDoc_Name" id="txt_CritereriaDoc_Name" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
				<shiro:hasPermission name="1604:Criteria.edit"> 
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
				</shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="grid"></div>
		</div>
	</div>
</body>
</html>
