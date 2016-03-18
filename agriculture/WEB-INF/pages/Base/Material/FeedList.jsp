<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农用物资- 饲料列表</title>
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
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });

            $("#btn_Add").hide();
            
			$("#grid").ligerGrid({
                columns: [
                    { display: '饲料名称', name: 'field1',width: 120 },
                    { display: '生产许可证号', name: 'field2', width: 200 },
                    { display: '产品执行标准', name: 'field3',width: 120 },
                    { display: '产品批准文号', name: 'field4', width: 200 },
                    { display: '净重', name: 'field5', width: 200 },
                    { display: '生产单位', name: 'field6', width: 200 },
                    { display: '有效成分', name: 'field7', width: 200 },
                    { display: '功能', name: 'field8', width: 200 },
                    { display: '使用对象', name: 'field9', width: 200 },
                    { display: '生产日期', name: 'field10',width: 120 }
                 ],  
				 pageSize:20,
                 data: {
					Rows:[
					{'field1':'正大牛羊舔砖','field2':'QS1310 1301 0009','field3':'GB 14881','field4':'143764','field5':'20kg/袋','field6':'原阳县正大饲料有限公司','field7':'蛋白质、氨基酸、食盐、钙、锌、铜、磷、锰、镁、铁、碘等多微量元素','field8':'促进猪只健康及抗应激能力，改善肌肉色泽','field9':'饲养牛羊群','field10':'2015年3月12日'},
					{'field1':'5%母羊用复合预混料','field2':'QS1310 1301 0009','field3':'GB 14881','field4':'143764','field5':'25kg/袋','field6':'原阳县正大饲料有限公司','field7':'多种维生素、微量元素、微生态制剂、酶制剂、调味剂、酸碱调节剂、氧化镁、抗氧化剂、磷酸氢钙、石粉、小苏打、食盐、载体','field8':'促进猪只健康及抗应激能力，改善肌肉色泽','field9':'饲养牛羊群','field10':'2015年3月12日'},
					{'field1':'羔羊人工乳 羔羊颗粒料','field2':'QS1310 1301 0009','field3':'GB 14881','field4':'143764','field5':'30kg','field6':'原阳县正大饲料有限公司','field7':'富含羔羊各阶段所需维生素、氨基酸、矿物质、微量元素及反刍动物未知生长因子','field8':'能充分满足机体的生长和发育，长势快，羔羊肥育效果明显，增重块','field9':'饲养牛羊群','field10':'2015年3月16日'},
					{'field1':'正大代乳宝猪用预混料猪饲料全价料乳猪饲料','field2':'QS1310 1301 0009','field3':'GB 14881','field4':'143764','field5':'20.5kg','field6':'原阳县正大饲料有限公司','field7':'氨基酸平衡，显著提高仔猪生长速度和饲料转化率','field8':'提高小猪免疫力，同时猪只皮毛光亮','field9':'乳猪','field10':'2015年4月18日'}
				]}, 
                 height:'100%'
             });
			
			/*
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '饲料名称', name: 'Produce_No' },
                    { display: '生产许可证号', name: 'Material_Name', width: 200 },
                    { display: '产品执行标准', name: 'Producer' },
                    { display: '产品批准文号', name: 'MainComponent', width: 200 },
                    { display: '净重', name: 'HanLiang', width: 200 },
                    { display: '生产单位', name: 'HanLiang', width: 200 },
                    { display: '有效成分', name: 'HanLiang', width: 200 },
                    { display: '功能', name: 'HanLiang', width: 200 },
                    { display: '使用对象', name: 'HanLiang', width: 200 },
                    { display: '生产日期', name: 'ToXicity' }
                ],
				data:[
				
				],
                param: { 'flag': 1, MaterialType_Code: 2 },
                editor: {
                    width: 460,
                    height: 650
                },
                leftBtns: {
                    showDelete: {
                        show:false,
                    },                    
                    showDetail: {
                        show:false,
                        url: "MaterialDet.aspx",
                        width:500,
                        height: 200
                    },
                    showEdit: {
                        show:false,
                    }
                },
                onLoaded: function () {
                    var isSearch = false;
                    var html = '<b>符合条件';
                    if (ZongHe) {
                        html += " 综合查询=‘" + $("#txt_ZongHe").val() + "’ ";
                    } else {                        
                        if ($("#txt_PlotName").val()) {
                            isSearch = true;
                            html += " 饲料名称='" + $("#txt_PlotName").val() + "' ";
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
                keyID: "",
                ajaxURL: ""
            });
           

        */

            $("#btn_Search").click(function () {
                ZongHe = false;
                grid.setParm("name", $("#txt_PlotName").val());
                grid.setParm("Producer", $("#txt_Producer").val());
                grid.setParm("ProduceNo", $("#txt_ProduceNo").val());
                grid.setParm("UsabelRange", $("#txt_UsabelRange").val());
                grid.reload();
            });
            $("#btnSearchZH").click(function () {
                ZongHe = true;
                grid.setParm("values", $("#txt_ZongHe").val());
                grid.reload();
            });
            $("#btn_Add").click(function () {
                ligerWin(470, 470, 'PesticidesEdit.aspx?Type=1', '新增饲料');
            });

        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">饲料名称：</div>
					<div class="sert left">
						<input type="text" name="txt_PlotName" id="txt_PlotName" class="serchInput" />
					</div>
					<div class="rtxt left">生产厂家：</div>
					<div class="sert left">
						<input type="text"  name="txt_Producer" id="txt_Producer" class="serchInput" />
					</div>
					<div class="rtxt left">登记证号：</div>
					<div class="sert left">
						<input type="text" name="txt_ProduceNo" id="txt_ProduceNo" class="serchInput" />
					</div>
					<div class="rtxt left">适用对象：</div>
					<div class="sert left">
						<input type="text" name="txt_UsabelRange" id="txt_UsabelRange" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					<div class="clear"></div>
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

