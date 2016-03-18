<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>单一农作物种植面积统计</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/report.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=opera"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/highcharts.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/highcharts-more.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/themes/grid-light.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/modules/exporting.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/publicchart.js?v=2015081410080444"></script>
    <style type="text/css">
        .l-layout-left, #leftTree, #tree1 {
            overflow-y: auto;
        }
    </style>
    <script type="text/javascript">
        var grid = null, chart = null, GoodsGrid = null;
        var AreaID =610403;
        var GoodsID='0';
        $(document).ready(function () {

            $("#layout1").ligerLayout({
                rightWidth: 250, space: 4, isRightCollapse: true, allowLeftCollapse: true, allowTopResize: false, topHeight: 40
            });
            var url='/areas/getAreasTree/'+AreaID.toString()+'/3';         
            MyLoading(true,".l-layout-left");
            getAjax(url,null,function(data){
                MyLoading(false);
                $("#tree1").ligerTree({ 
                    nodeWidth: 200,
                    data : data,
                    checkbox: false,
                    idFieldName: 'Area_ID', 
                    textFieldName:'Area_Name',
                    isExpand: false, 
                    slide: false,
                    onSelect:function(node,e){
                        grid.setParm("ParentID", node.data["Area_ID"]);
                        grid.setParm("Goods_ID", $("#hd_GoodsID").val());
                        grid.reload()
                    }
                });
            });
            
            $("#txt_Goodss").ligerComboBox({
                selectBoxWidth: 0,
                selectBoxHeight: 0,
                onBeforeOpen: f_selectContact, valueFieldID: 'hd_GoodsID',width:300
            });

            grid = $("#maingrid4").createLigerGrid({
                header: [
                    { display: '地区', name: 'Area_Name' },
                    { display: '种植面积', name: 'Areas' }
                ],
                pageSize: 15,
                param: { 'ParentID': AreaID},
                leftBtns:{show:false},
                ID: "maingrid4",
                ajaxURL: "/Chart/getSingleGoodsAreas",
                onLoaded: function () {
                    DrawChartThis(type,GoodsID);
                }
            });

            $.each([{ name: 'line', key: '折线' }, { name: 'column', key: '数据列' }, { name: 'spline', key: '曲线' }, { name: 'area', key: '面积' }, { name: 'areaspline', key: '曲线面积' }, { name: 'scatter', key: '分布点' }, { name: 'pie', key: '饼图' }], function (i, type) {
                var button = document.createElement("div");
                button.innerHTML = "<span class='liger-button l-button' id='" + type.name + "' style='float:left;margin-left:3px;'>" + type.key + "</span>";
                var view = document.getElementById('div_ChartType');
                view.appendChild(button.firstChild);

                $('#' + type.name).bind("click", function () {
                    ChartChange(type.name);
                });
            });


        });


        function f_selectContact(){
            if(!GoodsGrid){
                GoodsGrid=$("#gv_Goods").createLigerGrid({
                    header: [
                        { display: '编号', name: 'GoodsSTD_No' },
                        { display: '名称', name: 'Goods_Name' },
                        { display: '类别', name: 'GoodsType_Name' }
                    ],
                    width:360,
                    height:330,
                    param: { 'flag': 1 },                    
                    leftBtns: {show:false},
                    keyID: "Goods_ID",
                    ajaxURL: "/Goods/GetGoods"
                });
            }

            $.ligerDialog.open({
                target: document.getElementById("gv_Goods"),
                width:400,
                height:400,
                buttons:[
                    { text: '确定', onclick: function (item, dialog) { 
                        var obj=GoodsGrid.getSelectedRow();
                        if(obj){
                            $("#txt_Goods").val(obj["Goods_Name"]);
                            $("#hd_GoodsID").val(obj["Goods_ID"]);
                            dialog.hidden();
                        }else{
                            alter('请选择');
                        }
                    } 
                    },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
        }


        function Search(){
            var GoodsID=$("#hd_GoodsID").val();
            if(GoodsID==undefined||GoodsID==''){
                artd.alter("请选择农作物");                
            }else{
                grid.setParm("ParentID", AreaID);
                grid.setParm("Goods_ID",GoodsID);
                grid.reload()
            }
        }
       

        function DrawChartThis(type) {
            try {
                if (grid.data.data.length > 0) {
                    var Ydatas = [],
                        xlabels = [], 
                        jdatas = grid.data.data                    
                    ;
                    for (var p in jdatas) {
                        if (jdatas[p] && jdatas[p] != undefined) {
                            Ydatas.push({ name: jdatas[p]["Area_Name"], y: Number(jdatas[p]["Areas"]) });                          
                            xlabels.push(jdatas[p]["Area_Name"]);
                        }
                    }                       
                }
                chart=$('#container').highcharts({
                    chart: {
                        type: type
                    },
                    title: {
                        text: '单一农作物种植面积统计'
                    },
                    xAxis: {
                        lineWidth: 3,
                        categories: xlabels,
                        labels: {
                            rotation: -45,
                            align: 'right',
                            style: {
                                font: 'normal 13px Verdana, sans-serif'
                            }
                        }
                    },
                    yAxis: [{
                        allowDecimals: false,
                        lineWidth:2,
                        lineColor:"#5E8BC0",
                        title: {
                            text: '面积(亩)'
                        }
                    }],
                    tooltip: {
                        formatter: function () {
                            return '<b>' +this.key+'</b><br/>' +this.y+'亩';
                        }
                    },
                    series: [{
                        name: '地区',
                        step: 'right',
                        yAxis: 0,
                        color: '#4572A7',
                        data: Ydatas
                    }]
                });
                
            } catch (ex) {
                console.log(ex.message);
            }
        }  
        

        var type='column'
        function ChartChange(t){
            type=t;
            DrawChartThis(type);
        }

        


    </script>
    <style type="text/css">
        .l-layout-left,.l-layout-content,.l-tree {
            overflow-y:auto;
        }

    </style>
</head>
<body>
    <form method="post" action="SingleGoodsPlantChart.aspx" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJOTIwMDM5MDUyZGTFpDL3Ry5tbKN7oDOHJzjHFuR48TRbDr26nLI4ryzXLQ==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWAgL1lcrgCALtl8PCBXyLLMXXwE5kTaVLyGhkB9fg0J4KY+dMox+Mi7ewCmyD" />
</div>
        <div id="layout1">
            <div position="top" style="padding: 5px 0px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td width="100"><font color="black">请选择农作物:</font>
                        </td>
                        <td width="300">
                           <input name="txt_Goods" type="text" id="txt_Goods" class="inw" onclick="openHelper('/Pages/Helper/Goods_Helper.aspx', { id: 'txt_Goods,hd_GoodsID', key: 'Goods_Name,Goods_ID' }, '农作物--选择帮助界面', 500, 400);" /><input id="hd_GoodsID" type="hidden" value="0" />
                        </td>
                        <td width="100">
                            <input type="button" value="分页查询" title="分页查询" class="serchButton" onclick="Search();" />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="leftTree" position="left" title="区县">
                <div id="tree1" style="margin: 0; padding: 0"></div>
            </div>
            <div position="center" title="报表视图">
                <div style="float: left; width: 100%; height: 35px;" id="div_ChartType">
                </div>
                <div id="container" class="ChartView" style="width: 100%; height: 100%; margin: 0px; padding: 0px;">
                </div>
            </div>
            <div position="right" title="数据视图">
                <div id="maingrid4" style="margin: 0; padding: 0"></div>
            </div>
        </div>
        <div id="SearchGoods">

            
        </div>

    </form>
</body>
</html>
