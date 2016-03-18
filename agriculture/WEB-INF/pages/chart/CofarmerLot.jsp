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
    <script src="${ctx}/content/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/highcharts.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/highcharts-more.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/themes/grid-light.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/highcharts/modules/exporting.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/publicchart.js?v=2015081410080444"></script>
    <script type="text/javascript">
        //OnReady
        $(document).ready(function () {
            $("#layout1").ligerLayout({ rightWidth: 250, space: 4, isRightCollapse: true, allowLeftCollapse: true, allowTopResize: false, topHeight: 40 });
            //创建报表
            Search();
        });

        function Search() {
            ChartConfig.ShowPoint.Label = "COFARMER_NAME";
            ChartConfig.ShowPoint.Values = "AREAS";
            var char = { Title: "生产者种植面积统计", RenderTo: "container", unit: '亩' }, grid = { Header: [{ display: '生产者名称', name: ChartConfig.ShowPoint.Label, align: 'left', width: 150 }, { display: '种植面积(亩)', name: ChartConfig.ShowPoint.Values, width:80 }], ID: "maingrid4" };
            CreateChart(char, grid, { flag: "2", CoFarmer_ID: $("#ColfarmerControl_ddlPlot").val() });
        }
    </script>
    <style type="text/css">
        .l-layout-left,.l-layout-content,.l-tree {
            overflow-y:auto;
        }

    </style>
</head>
<body>
    <form method="post" action="cofarmerLotChart.ajax" id="form1">
        <div id="layout1">
            <div position="top" style="padding: 5px 0px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td width="100">请选择生产者:
                        </td>
                        <td width="300">
                            <select name="ColfarmerControl$ddlPlot" id="ColfarmerControl_ddlPlot">
								<option value="">请选择</option>
								<c:forEach var="bean"  items="${coFarmerBeans }">
									<option value="${bean.cofarmerId }">${bean.cofarmerName }</option>
								</c:forEach>
							</select>
                        </td>
                        <td width="100">
                            <input type="button" value="查询" class="serchButton" onclick="Search();" />
                        </td>
                    </tr>
                </table>
            </div>
            <div position="center" title="报表视图">
                <div id="container" class="ChartView" style="width: 100%; height: 100%; margin: 0px; padding: 0px;"></div>
            </div>
            <div position="right" title="数据视图">
                <div id="maingrid4" style="margin: 0; padding: 0"></div>
            </div>
        </div>
    </form>
</body>
</html>
