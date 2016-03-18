<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>采购肥料列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
    
    function showDetail(id, name){
    	ligerWin(660, 360,"${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html?type=3&id="+id,"查看 " + name + " 的采购详情——肥料");
    }
        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#gv_CoFarmerMaterial").createLigerGrid({
                header: [
                    { display: '化肥采购时间', name: 'OperateDate',  type: 'date', format: 'yyyy-MM-dd' },
					{ display: '采购的合作社名称', name: 'CoFarmer_Name', width: "200" },
					{ display: '采购的化肥名称/数量', render: function (rowdata, index, value) { 
							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['COMAT_UID'] +"\", \""+  rowdata['OBJECT_NAME']  +"\")'>"+ rowdata['OBJECT_NAME'] + "/"+rowdata['QTY'] + "(" + rowdata['UNITNAME']+")</a>"
						}, width: '250'
					},
			 
					{ display: '化肥生产商', name: 'Produce_Name' ,width: 200 }, 
                    { display: '化肥的毒性', name: 'ToXicity' },
                    { display: '化肥主要成分', name: 'MainComponent' }, 
                { display: '质询', render: function (rowdata, index, value) { return "<input type='button' class='rowSelectButton'  value='发起质询' onclick=\"ligerWin(600,350,'${ctx}/Base/Material/InquiryEdit.html?Object_ID=" + rowdata['COMAT_UID'] + "&Type=2&CoFarmer_ID=" + rowdata['COFARMER_ID'] + "','质询');\" />"; } }
                ],
                param: { 'flag': 1, 'TypeCode': 1},
                editor: {
                    width: 540,
                },
                leftBtns: {
                	show:false
                	/**
                    width: 160,                    
                    showDetail: {
                        show:true,
                        url: "${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html",
                        height: 250
                    },
                    showEdit: {
                        show:false,
                        url: "${ctx}/CoFarmerMaterialV/UpdateCoFarmerMaterialEdit.html",
                        height: 400
                    },                    
                    showDelete: {
                        show:false,
                        url: "${ctx}/CoFarmerMaterialV/CoFarmerMaterialDel.ajax",
                        close: function () {
                            grid.reload();
                        }
                    }**/
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "COMAT_UID",
                ajaxURL: "${ctx}/Base/Info/getVCoFarmerMaterialList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("CoFarmerName", $("#txt_CoFarmer_Name").val());
                grid.reload()
            }
            ); 
        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">生产者：</div>
					<div class="sert left">
						<input type="text" name="txt_CoFarmer_Name" id="txt_CoFarmer_Name" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					 <div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_CoFarmerMaterial"></div>
		</div>
	</div>
</body>
</html>
