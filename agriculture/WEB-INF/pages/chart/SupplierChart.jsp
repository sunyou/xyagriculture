<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农资经销商统计</title>
    <script src="${ctx}../../content/js/charts/jquery-1.8.3.min.js"></script>
    <script src="${ctx}../../content/js/charts/highcharts.js"></script>
    <script src="${ctx}../../content/js/charts/data.js"></script>
    <script src="${ctx}../../content/js/charts/exporting.js"></script>

    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/report.css" />
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/plugins/ligerComboBox.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/plugins/ligerTree.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/plugins/ligerResizable.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/publicchart.js?v=2015081410080444"></script>




    <script>        
        var grid;
        $(document).ready(function () { 
            $("#layout1").ligerLayout({ 
                leftWidth: 150, rightWidth: 250, 
                space: 4, isRightCollapse: true, 
                allowLeftCollapse: true, allowTopResize: false, 
                topHeight: 40 });

            var AreaID =610403;
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
                        CoFarmerQty=0;
                        FarmerQty=0;
                        AreasQty=0;
                        grid.setParm("ParentID", node.data["Area_ID"]);
                        grid.reload()
                    }
                });
            });
            
            grid =  $("#maingrid4").createLigerGrid({
                header: [
                    {display:'地区',name:'Area_Name'},
                    { display: '农资经销商数量(个)', name: 'SupplierNum' },
                    { display: '肥料数量', name: 'FeiLiaoNum' },
                    {display:'农药数量',name:'NongYaoNum'},
                    {display:'其他农资数量',name:'OtherNum'},
                    {display:'种苗数量',name:'GoodVarietyNum'}
                ],
                leftBtns:{show:false},
                ID: "maingrid4",
                ajaxURL: "/Chart/getSupplierChart",
                onLoaded: function () {
                    DrawChart(type);
                }
            });                        
        });
        var SupplierQty=0,NongYaoQty=0,FeiLiaoQty=0,OtherQty=0,GoodVarietyQty=0;   
        function DrawChart(type) {
            try {
                if (grid.data.data.length > 0) {
                    var Ydatas = [],Ydatas2=[],Ydatas3=[], Ydatas4=[],Ydatas5=[]
                        xlabels = [], 
                        jdatas = grid.data.data                    
                    ;
                    for (var p in jdatas) {
                        if (jdatas[p] && jdatas[p] != undefined) {
                            Ydatas.push({ name: jdatas[p]["Area_Name"], y: Number(jdatas[p]["SupplierNum"]) });
                            SupplierQty+=Number(jdatas[p]["SupplierNum"])
                            Ydatas2.push({ name: jdatas[p]["Area_Name"], y: Number(jdatas[p]["FeiLiaoNum"]) });
                            FeiLiaoQty+=Number(jdatas[p]["FeiLiaoNum"]);
                            Ydatas3.push({ name: jdatas[p]["Area_Name"], y: Number(jdatas[p]["NongYaoNum"]) });
                            NongYaoQty+=Number(jdatas[p]["NongYaoNum"]);
                            Ydatas4.push({ name: jdatas[p]["Area_Name"], y: Number(jdatas[p]["OtherNum"]) });
                            OtherQty+=Number(jdatas[p]["OtherNum"]);
                            Ydatas5.push({ name: jdatas[p]["Area_Name"], y: Number(jdatas[p]["GoodVarietyNum"]) });
                            GoodVarietyQty+=Number(jdatas[p]["GoodVarietyNum"]);
                            xlabels.push(jdatas[p]["Area_Name"]);
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
                        text:"农资经销商："+SupplierQty+"个； 肥料："+FeiLiaoQty+"种； 农药"+NongYaoQty+"种； 其他农资"+OtherQty+"种； 种苗"+GoodVarietyQty+"种"
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
                            text: '经销商(个)'
                        }
                    }, {
                        allowDecimals: false,
                        opposite:true,
                        lineWidth:2,
                        lineColor:"#AA4643",
                        title: {
                            text: '肥料(种)'
                        }
                    }, {
                        allowDecimals: false,
                        opposite:true,
                        lineWidth:2,
                        lineColor:"#AA4643",
                        title: {
                            text: '农药(种)'
                        }
                    }, {
                        allowDecimals: false,
                        opposite:true,
                        lineWidth:2,
                        lineColor:"#AA4643",
                        title: {
                            text: '其他(种)'
                        }
                    }, {
                        allowDecimals: true,
                        opposite:true,
                        lineWidth:2,
                        lineColor:"#89A54E",
                        title: {
                            text: '种苗(种)'
                        }
                    }],
                    tooltip: {
                        formatter: function () {
                            return '<b>' +this.x+'</b><br/>' +
                             this.series.name + ':' +this.y;
                        }
                    },
                    series: [{
                        name: '经销商(个)',
                        step: 'right',
                        yAxis: 0,
                        color: '#4572A7',
                        data: Ydatas
                    }, {
                        name: '肥料(种)',
                        step: 'center',
                        yAxis: 1,
                        color: '#AA4643' ,
                        data: Ydatas2
                    }, {
                        name: '农药(种)',
                        step: 'center',
                        yAxis: 1,
                        color: '#AA4643' ,
                        data: Ydatas3
                    }, {
                        name: '其他(种)',
                        step: 'center',
                        yAxis: 1,
                        color: '#AA4643' ,
                        data: Ydatas4
                    }, {
                        name: '种苗(种)',
                        step: 'left',
                        yAxis: 2,
                        color: '#89A54E'  ,
                        data: Ydatas5
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
    </style>
</head>
<body>
    <form method="post" action="SupplierChart.aspx" id="form2">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJNTMzODI4MzEzZGSrn9haU/AA0j+XB0Hv3boZ2seYQmstEI0z9X/EA1x/Hg==" />
</div>

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
