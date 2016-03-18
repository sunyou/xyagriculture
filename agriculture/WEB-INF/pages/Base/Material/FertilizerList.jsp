<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-Type" content="text/html; charset=utf-8" />
    <title>农用物资-肥料列表</title>
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
        var grid = null;
        var ZongHe = false;
        function showDetail(id, name){
        	ligerWin(660, 360,"${ctx}/Base/Material/MaterialFLDet.html?type=3&id="+id,"查看 " + name + " 的详情");
        }
        
        $(document).ready(function () {
            

			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
					{ display: '登记证号', render: function (rowdata, index, value) { 
							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['MATERIAL_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['PRODUCE_NO'] +"</a>"
						}, width: '250'
					},
					{ display: '肥料名称', render: function (rowdata, index, value) { 
							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['MATERIAL_ID'] +"\", \""+  rowdata['MATERIAL_NAME']  +"\")'>"+ rowdata['MATERIAL_NAME'] +"</a>"
						}, width: '250'
					},
                    { display: '生产厂家', name: 'Producer'  , width:"250"},
                    { display: '技术指标', name: 'JSBZ', width: '230' },
                    { display: '剂型', name: 'DosyType' }
                ],
                param: { 'flag': 1, MaterialType_Code: 1 },
                editor: {
                    width: 660,
                    height: 360
                },
                leftBtns: {
                	show:false,
                    /**showDelete: {
                    	show:false,
                    	url: "${ctx}/Base/Material/delMaterialFLById.ajax",
                        close: function () {grid.reload(); }
                    },
                    showDetail: {
                    	show:false,
                        url: "${ctx}/Base/Material/MaterialFLDet.html",
                        width: 660,
                        height: 360
                    },
                    showEdit: {
                    	show:false,
                        url: "${ctx}/Base/Material/FertilizerEidt.html",
                        width:660,
                        height: 360
                    }**/
                },
                onLoaded: function () {
                    var isSearch = false;
                    var html = '<b>符合条件';
                    
                    var isSearch = false;
                    var html = '<b>符合条件';
                    if (ZongHe) {
                        html += " 综合查询=‘" + $("#txt_ZongHe").val() + "’ ";
                    } else {
                    
                    
                    /* if ($("#txt_ZongHe").val().length>0) {
                        html += " 综合查询=‘" + $("#txt_ZongHe").val() + "’ ";
                    } else { */
                        if ($("#txt_PlotName").val()) {
                            isSearch = true;
                            html += " 农药名称='" + $("#txt_PlotName").val() + "' ";
                        }
                        if ($("#txt_Producer").val()) {
                            isSearch = true;
                            html += " 生产厂家='" + $("#txt_Producer").val() + "' ";
                        }
                        if ($("#txt_ProduceNo").val()) {
                            isSearch = true;
                            html += " 登记证号='" + $("#txt_ProduceNo").val() + "' ";
                        }
                        if ($("#txt_UsabelRange").val()) {
                            isSearch = true;
                            html += " 适用作物='" + $("#txt_UsabelRange").val() + "' ";
                        }
                    }
                    if (isSearch) {
                        html += "的数据共有" + grid.data.total + "笔</b>";
                    } else {
                        html = "<b>共有" + grid.data.total + "笔数据</b>";
                    }
                    $("#SearchResult").html(html);
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "MATERIAL_ID",
                ajaxURL: "${ctx}/Base/Material/GetMaterialFL.ajax"
            });

            $("#btn_Search").click(function () {
            	ZongHe = false;
                grid.setParm("name", $("#txt_PlotName").val());
                grid.setParm("Producer", $("#txt_Producer").val());
                grid.setParm("ProduceNo", $("#txt_ProduceNo").val());
                //grid.setParm("UsabelRange", $("#txt_UsabelRange").val());
                grid.setParm("values", $("#txt_ZongHe").val());
                grid.reload();
            });

            //$("#btn_Add").click(function () {
            //   ligerWin(430, 420, '${ctx}/Base/Material/FertilizerEidt.html?type=1', '新增化肥');
            //});
        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">肥料名称：</div>
					<div class="sert left">
						<input type="text" name="txt_PlotName" id="txt_PlotName" class="serchInput" />
					</div>
					<div class="rtxt left">生产厂家：</div>
					<div class="sert left">
						<input type="text" name="txt_Producer" id="txt_Producer" class="serchInput" />
					</div>
					<div class="rtxt left">登记证号：</div>
					<div class="sert left">
						<input type="text" name="txt_ProduceNo" id="txt_ProduceNo" class="serchInput" />
					</div>
					<%--<div class="rtxt left">适用作物：</div>
					<div class="sert left">
						<input type="text" name="txt_UsabelRange" id="txt_UsabelRange" class="serchInput" />
					</div>
					--%><div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<%--<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					--%><div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="SearchResult"></div>
			<div id="grid"></div>
		</div>
	</div>
</body>
</html>
