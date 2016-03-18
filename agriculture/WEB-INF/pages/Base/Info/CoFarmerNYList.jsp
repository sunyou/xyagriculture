<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>采购农药列表</title>
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
    	ligerWin(660, 360,"${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html?type=3&id="+id,"查看 " + name + "的采购详情——农药");
    }    
    
        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#gv_CoFarmerMaterial").createLigerGrid({
                header: [
                    { display: '农药采购时间', name: 'OperateDate',  type: 'date', format: 'yyyy-MM-dd' ,width: '100'},
                    { display: '采购的合作社名称', name: 'CoFarmer_Name',width:200 },
					{ display: '采购的农药名称/数量', render: function (rowdata, index, value) { 
							return "<a href='javascript:void(0)' class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['COMAT_UID'] +"\", \""+  rowdata['OBJECT_NAME']  +"\")'>"+ rowdata['OBJECT_NAME']+"/"+rowdata['QTY'] + "(" + rowdata['UNITNAME'] +")</a>"
						}, width: '250'
					},
                    
                    

					{ display: '农药生产商', name: 'Produce_Name', width: 200, align: 'left' },
                    {
                         display: '毒性', name: 'ToXicity', render: function (item) {
                             if (item.ToXicity == "") { return "<font color='#F6893D'>暂无数据</font>"; } else { return item.ToXicity; };

                         }
                     },
                    { display: '主要成分', name: 'MainComponent', align: 'left' },
                   
                    { display: '质询', render: function (rowdata, index, value) { return "<input type='button' class='rowSelectButton' value='发起质询' onclick=\"ligerWin(600,350,'${ctx}/Base/Material/InquiryEdit.html?Object_ID=" + rowdata['COMAT_UID'] + "&Type=1&CoFarmer_ID=" + rowdata['COFARMER_ID'] + "','质询');\" />"; } }
                ],
                param: { 'flag': 1,'TypeCode':2 },
                editor: {
                    width: 540,
                },
                leftBtns: {
                	show:false
                  
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "COMAT_UID",
                ajaxURL: "${ctx}/Base/Info/getVCoFarmerMaterialList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("Object_Name", $("#txt_Object_Name").val());
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
					<div class="rtxt left">农资名称：</div>
					<div class="sert left">
						<input type="text" name="txt_Object_Name" id="txt_Object_Name" class="serchInput" />
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
