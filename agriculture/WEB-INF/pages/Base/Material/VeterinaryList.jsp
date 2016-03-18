<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农用物资- 兽药列表</title>
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
        $(document).ready(function () {           

            $("#btn_Add").hide();
            
            $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });

            $("#grid").ligerGrid({
                columns: [
                    { display: '商品名', name: 'field1', width: 200 },
                    { display: '通用名', name: 'field2', width: 200 },
                    { display: '生产商', name: 'field3', width: 200 },
                    { display: '证书编号', name: 'field4', width: 200 },
                    { display: '批准文号', name: 'field5', width: 200 },
                    { display: '主要成分', name: 'field6', width: 200 },
                    { display: '药理作用', name: 'field7', width: 200 },
                    { display: '性状', name: 'field8', width: 200 },
                    { display: '适应症', name: 'field9', width: 200 },
                    { display: '用法用量', name: 'field10',width: 120 },
                    { display: '停药期', name: 'field11',width: 120 },
                    { display: '规格', name: 'field12',width: 120 },
                    { display: '包装', name: 'field13',width: 120 }
                ],  
                pageSize:20,
                data: {
                    Rows:[
					{'field1':'微粉窝崽旺','field2':'微粉窝崽旺','field3':'潍坊富邦药业有限公司','field4':'','field5':'鲁饲预字（2013）374004','field6':'龙胆、黄连、白头翁、黄芩、白术等。','field7':'解除抑制、提升免疫、净化肠道、解毒排毒、改善奶水、阻断腹泻','field8':'','field9':'饲养牛羊群','field10':'','field11':'','field12':'1000g/袋','field13':'1000g/袋×15袋/箱'},
					{'field1':'微粉龙胆泻肝散','field2':'微粉龙胆泻肝散','field3':'潍坊富邦药业有限公司','field4':'','field5':'兽药字（2011）152595057','field6':'龙胆、车前子、柴胡、当归、栀子等。','field7':'泻肝胆实火，清三焦湿热，疏肝利胆，通肾利尿，活血化瘀，保肝解毒。','field8':'','field9':'饲养牛羊群','field10':'马、牛250～350g；羊、猪30～60g。也可按每袋饲喂4头牛,30只羊。按本品1000g拌精料500斤，每次连用5～7天','field11':'','field12':'1000g/袋','field13':'1000g/袋×15袋/箱'},
					{'field1':'微粉升力康','field2':'补中益气散','field3':'潍坊富邦药业有限公司','field4':'','field5':'兽药字（2014）152595082','field6':'龙胆、车前子、柴胡、当归、栀子等。','field7':'提升抗体、加强免疫、补中益气、升阳举陷。','field8':'','field9':'饲养牛羊群','field10':'牛羊治疗用量：马、牛250～400g；羊、猪45～60 g；小鸡0.5g，中鸡1g，大鸡1.5g调糊后灌服','field11':'','field12':'1000g/袋','field13':'1000g/袋×15袋/箱'},
                    {'field1':'一撒窝崽旺','field2':'乌梅散','field3':'潍坊富邦药业有限公司','field4':'','field5':'兽药字（2011）152595023','field6':'乌梅、黄连、姜黄、柯子、柿饼。','field7':'清热解毒、燥湿止泻、肠黄湿热泻痢。','field8':'','field9':'饲养牛羊群','field10':'保健用法：自初生仔猪出生后的第二天起，在猪栏中乳仔猪睡觉的地方，把药粉撒在乳猪身上，不管多少头乳仔猪每窝每次一小包，即100g，隔日一次，连用5次。','field11':'','field12':'1000g/袋','field13':'1000g/袋×15袋/箱'}


                    ]}, 
                height:'100%'
            });

            /*
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '证书编号', name: 'Produce_No' },
                    { display: '商品名', name: 'Material_Name', width: '200' },
                    { display: '生产商', name: 'Producer' },
                    { display: '主要成分', name: 'JSBZ', width: '200' },
                    { display: '剂型', name: 'DosyType' }
                ],
                param: { 'flag': 1, MaterialType_Code: 1 },
                editor: {
                    width: 430,
                    height: 600
                },
                leftBtns: {
                    showDelete: {
                        show:false,
                    },
                    showDetail: {
                        show:false,
                        url: "MaterialDet.aspx",
                        width: 550,
                        height: 200
                    },
                    showEdit: {
                        show:false,
                    }
                },
                onLoaded: function () {
                    var isSearch = false;
                    var html = '<b>符合条件';
                    if ($("#txt_ZongHe").val().length>0) {
                        html += " 综合查询=‘" + $("#txt_ZongHe").val() + "’ ";
                    } else {
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
                keyID: "Material_ID",
                ajaxURL: "/MaterialFL/GetMaterial"
            });
        */
            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_PlotName").val());
                grid.setParm("Producer", $("#txt_Producer").val());
                grid.setParm("ProduceNo", $("#txt_ProduceNo").val());
                grid.setParm("UsabelRange", $("#txt_UsabelRange").val());
                grid.setParm("values", $("#txt_ZongHe").val());
                grid.reload();
            });

            $("#btn_Add").click(function () {
                ligerWin(430, 420, 'FertilizerEidt.aspx?Type=1', '新增化肥');
            });
        });
    </script>
</head>
<body>
    <div id="layout">
        <div position="top">
            <div class="rtittab">
                <div class="rtitbg2">
                    <div class="rtxt left">兽药名称：</div>
                    <div class="sert left">
                        <input type="text" name="txt_PlotName" id="txt_PlotName" class="serchInput" />
                    </div>
                    <div class="rtxt left">生产厂家：</div>
                    <div class="sert left">
                        <input type="text" name="txt_Producer" id="txt_Producer" class="serchInput" />
                    </div>
                    <div class="rtxt left">证书编号：</div>
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

