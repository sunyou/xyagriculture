<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>生产者种植面积统计</title>
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
        var grid=null,chart=null;
        $(document).ready(function () {
            $('#layout').ligerLayout({
                rightWidth: 250, space: 4, isRightCollapse: true, allowLeftCollapse: true, allowTopResize: false, topHeight: 40
            });
            var AreaID ='${areaId}';
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
                    slide: false,
                    isExpand: false, 
                    onSelect:function(node,e){
                        grid.setParm("parentId", node.data["areaId"]);
                        grid.setParm("coFarmerID", $("#ColfarmerControl_ddlPlot").val());
                        grid.reload()
                    }
                });
            });
            grid = $("#maingrid4").createLigerGrid({
                header: [
                    { display: '农作物', name: 'GOODS_NAME' },
                    { display: '种植面积', name: 'AREAS' }
                ],
                pageSize: 15,
                param: { 'carentID': '-1',"coFarmerID":$("#ColfarmerControl_ddlPlot").val(),"needPage":"true", parentId:'${areaId}' },
                leftBtns:{show:false},
                ID: "maingrid4",
                ajaxURL: "${ctx}/chart/areasPlotChart.ajax",
                onLoaded: function () {
                    DrawChartThis(type);
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

        function Search(needPage){
            var CoFarmerID=$("#ColfarmerControl_ddlPlot").val();
            grid.setParm("parentID", "${areaId}");
            grid.setParm("coFarmerID", CoFarmerID);
            grid.setParm("needPage",needPage);
            grid.reload()
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
                            Ydatas.push({ name: jdatas[p]["GOODS_NAME"], y: Number(jdatas[p]["AREAS"]) });                          
                            xlabels.push(jdatas[p]["GOODS_NAME"]);
                        }
                    }                       
                }
                chart=$('#container').highcharts({
                    chart: {
                        type: type
                    },
                    title: {
                        text: '农作物种植面积统计'
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
                        name: '作物品种',
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
        var type='column';
        function ChartChange(t){
            type=t;
            DrawChartThis(type);
        }
    </script>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }

        .l-layout-left, .l-layout-content, .l-tree {
            overflow-y: auto;
        }

        #container, .highcharts-container {
            overflow: auto !important;
        }
    </style>
</head>
<body>
    <form method="post" action="AreasPlot.aspx?type=1" id="form1">
        <div id="layout">
            <div position="top">
                <div class="rtittab">
                    <div class="rtitbg2">
                        <div class="rtxt left">请选择生产者:</div>
                        <div class="sert left">
                            <select name="ColfarmerControl$ddlPlot" id="ColfarmerControl_ddlPlot">
								<option value="">请选择</option>
								<c:forEach var="bean"  items="${coFarmerBeans }">
									<option value="${bean.cofarmerId }">${bean.cofarmerName }</option>
								</c:forEach>
							</select>
                        </div>
                        <div class="sert left">
                            <label class="retbtnleft">
                                <label class="retbtnright">
                                    <span class="icon_search"></span>
                                    <button type="button" class="retbutton" onclick="Search('true');">分页查询</button>
                                </label>
                            </label>
                            <div class="clearfix"></div>
                        </div>
                        <div class="rtxt left">
                            <label class="retbtnleft">
                                <label class="retbtnright">
                                    <span class="icon_search"></span>
                                    <button type="button" class="retbutton" onclick="Search('false');">全部查询</button>
                                </label>
                            </label>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div id="leftTree" position="left" title="区县">
                <div id="tree1" style="margin: 0; padding: 0;"></div>
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
    </form>
</body>
</html>
