<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据综合统计</title>
    <script type="text/javascript" src="${ctx}/content/js/charts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/charts/highcharts.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/charts/data.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/charts/exporting.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/report.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/publicchart.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    
    <script type="text/javascript">     
        var grid;
        $(document).ready(function () { 
            $("#layout1").ligerLayout({ 
                leftWidth: 150, rightWidth: 250, 
                space: 4, isRightCollapse: true, 
                allowLeftCollapse: true, allowTopResize: false, 
                topHeight: 40 });
            var AreaID ='${areaId}';
            //var url='/areas/getAreasTree/'+AreaID.toString()+'/3';         
            var url="${ctx}/chart/getAreasbyParentId.ajax";         
            MyLoading(true,".l-layout-left");
            getAjax(url,{parentId: AreaID},function(data){
                MyLoading(false);
                $("#tree1").ligerTree({ 
                    nodeWidth: 200,
                    data : JSON.parse(data.data),
                    checkbox: false,
                    idFieldName: 'areaId', 
                    textFieldName:'areaName',
                    isExpand: false, 
                    slide: false,
                    onSelect:function(node,e){
                        CoFarmerQty=0;
                        FarmerQty=0;
                        AreasQty=0;
                        grid.setParm("parentId", node.data["areaId"]);
                        grid.reload()
                    }
                });
            });
            
            grid =  $("#maingrid4").createLigerGrid({
                header: [
                    {display:'地区',name:'AREA_NAME'},
                    { display: '合作社数量(个)', name: 'COFARMERNUM' },
                    { display: '农户数量(户)', name: 'FARMERNUM' },
                    {display:'土地面积(亩)',name:'PLOTAREAS'}
                ],
                leftBtns:{show:false},
                ID: "maingrid4",
                param: { parentId: "${areaId}"},
                ajaxURL: "${ctx}/chart/getCofarmerChart.ajax",
                onLoaded: function () {
                    DrawChart(type);
                }
            });                        
        });
        var CoFarmerQty=0,FarmerQty=0,AreasQty=0;   
        function DrawChart(type) {
            try {
                CoFarmerQty=0;
                FarmerQty=0;
                AreasQty=0;
                if (grid.data.data.length > 0) {
                    var Ydatas = [],Ydatas2=[],Ydatas3=[], 
                        xlabels = [], 
                        jdatas = grid.data.data   
                    ;
                    for (var p in jdatas) {
                        if (jdatas[p] && jdatas[p] != undefined) {
                            Ydatas.push({ name: jdatas[p]["AREA_NAME"], y: Number(jdatas[p]["COFARMERCOUNT"]) });
                            CoFarmerQty+=Number(jdatas[p]["COFARMERCOUNT"])
                            Ydatas2.push({ name: jdatas[p]["AREA_NAME"], y: Number(jdatas[p]["FARMERCOUNT"]) });
                            FarmerQty+=Number(jdatas[p]["FARMERCOUNT"]);
                            Ydatas3.push({ name: jdatas[p]["AREA_NAME"], y: Number(jdatas[p]["PLOTCOUNT"]) });
                            var qtyNum=Number(jdatas[p]["PLOTCOUNT"]);
                            AreasQty=Number((AreasQty+qtyNum).toFixed(2));
                            xlabels.push(jdatas[p]["AREA_NAME"]);
                        }
                    }                       
                }
                chart=$('#container').highcharts({
                    chart: {
                        type: type
                    },
                    title: {
                        text: '数据综合统计'
                    },
                    subtitle:{
                        text:"合作社总计："+CoFarmerQty+"个<br/>农户总计："+FarmerQty+"户<br/>土地面积总计："+AreasQty+"亩"
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
                            text: '合作社(个)'
                        }
                    }, {
                        allowDecimals: false,
                        opposite:true,
                        lineWidth:2,
                        lineColor:"#AA4643",
                        title: {
                            text: '农户(户)'
                        }
                    }, {
                        allowDecimals: true,
                        opposite:true,
                        lineWidth:2,
                        lineColor:"#89A54E",
                        title: {
                            text: '土地面积(亩)'
                        },
                        labels: {
                            formatter: function() {
                                return this.value ;
                            }
                        }
                    }],
                    tooltip: {
                        formatter: function () {
                            return '<b>' +this.x+'</b><br/>' +
                             this.series.name + ':' +this.y;
                        }
                    },
                    series: [{
                        name: '合作社(个)',
                        step: 'right',
                        yAxis: 0,
                        color: '#4572A7',
                        data: Ydatas
                    }, {
                        name: '农户(户)',
                        step: 'center',
                        yAxis: 1,
                        color: '#AA4643' ,
                        data: Ydatas2
                    }, {
                        name: '土地面积(亩)',
                        step: 'left',
                        yAxis: 2,
                        color: '#89A54E'  ,
                        data: Ydatas3
                    }]
                });
            } catch (ex) {
                console.log(ex.message);
            }
        }    
        var type='column'
        function ChartChange(t){
            type=t;
            DrawChart(type);
        }
    </script>
    <style type="text/css">
        #ddlTown {
            display: none;
        }
        .l-layout-left,.l-layout-content,.l-tree {
            overflow-y:auto;
        }

    </style>
</head>
<body>
    <form method="post" action="CoFarmerChart.aspx" id="form2">
        <div id="layout1">
            <div id="leftTree" position="left" title="区县">
                <div id="tree1" style="margin: 0; padding: 0"></div>
            </div>
            <div position="center" title="报表视图">
                <div style="float:left;width:100%;height:35px;">
                    <span class='liger-button l-button' id='Type_column' style='float: left; margin-left: 3px;' onclick="ChartChange('column')">柱状图</span><span class='liger-button l-button' id='Type_line' style='float: left; margin-left: 3px;' onclick="ChartChange('line')">折现图</span>
                    <span class='liger-button l-button' id='Type_spline' style='float: left; margin-left: 3px;' onclick="ChartChange('spline')">曲线图</span>
                </div>
                <div id="container" class="ChartView" style="width: 100%; height: 85%; margin: 0px; padding: 0px;float:left;">
                </div>
                <div style="width: 100%; height: 16%; position: absolute; bottom: 3px; z-index: 9999;" id="ChartQty"></div>
            </div>
            <div position="right" title="数据视图">
                <div id="maingrid4" style="margin: 0; padding: 0"></div>
            </div>

        </div>
    </form>
</body>
</html>
