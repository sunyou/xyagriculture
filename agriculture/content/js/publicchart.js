/**
 * 报表展示
 * 
 * Licensed under the GPL terms
 * To use it on other terms please contact us
 *author:MinglongYe
 * Copyright(c) 20013-2014 stworthy [ ye583025823@126.com ] 
 * 
 */

/**
*==============================================
*报表控件配置
*==============================================
*/

var JhrzChart = null, ChartConfig = {
    ChartRequestURL: basePath + "/chart/cofarmerLotChart.ajax",
    ShowLimit: 20,
    unit:'亩',
    ShowPoint: { "Label": "GOODS_NAME", "Values": "AREAS" },
    chart: {
        margin: [50, 20, 150, 60],
        zoomType: "x, y",
        renderTo: "container",
        reflow: true,
        events: {
            load: function () {
                if ($("#" + ChartConfig.chart.renderTo).data("tools") == null) {
                    var _div = document.createElement("div");
                    var _id = "JhrzChartTools" + (new Date()).getTime().toString(36);
                    $("#" + ChartConfig.chart.renderTo).data("tools", _id);
                    _div.innerHTML = "<div id='" + _id + "' style='width:100%;clear:both;height:30px;padding-top:3px;'></div>";
                    var view = document.getElementById(ChartConfig.chart.renderTo);
                    view.parentNode.insertBefore(_div.firstChild, view);

                    //创建完成事件
                    // Set type
                    $.each([{ name: 'line', key: '折线' }, { name: 'column', key: '数据列' }, { name: 'spline', key: '曲线' }, { name: 'area', key: '面积' }, { name: 'areaspline', key: '曲线面积' }, { name: 'scatter', key: '分布点' }, { name: 'pie', key: '饼图' }], function (i, type) {
                        var button = document.createElement("div");
                        button.innerHTML = "<span class='liger-button l-button' id='" + type.name + "' style='float:left;margin-left:3px;'>" + type.key + "</span>";
                        var view = document.getElementById(_id);
                        view.appendChild(button.firstChild);

                        $('#' + type.name).bind("click", function () {
                            JhrzChart.series[0].update({
                                type: type.name
                            });
                        });
                    });
                }
            }
        }
    },
    title: {
        text: ""
    },
    xAxis: {
        lineWidth: 3,
        categories: [],
        labels: {
            rotation: -45,
            align: 'right',
            style: {
                font: 'normal 13px Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        lineWidth: 3,
        title: {
            text: ''
        },
        labels: {
            formatter: function () {
                return this.value + ChartConfig.unit;
            }
        }
    }
    ,
    tooltip: {
        formatter: function () {
            return this.key + ":" + this.y + ChartConfig.unit;
        }
    },
    series: [{
        name: 'Population',
        data: []
    }],
    legend: {
        enabled: false
    }
}
/**
*全局配置
*
*
*/
Highcharts.setOptions({
    lang: {
        months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
			 '10月', '11月', '12月'],
        weekdays: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
        contextButtonTitle: "选项",
        downloadJPEG: '保存报表JPG图片',
        downloadPDF: '保存报表PDF',
        downloadPNG: '保存报表PNG图片',
        downloadSVG: '',
        loading: '正在载入数据.....',
        printChart: '打印当前报表',
        resetZoom: '重置缩放',
        resetZoomTitle: '重置缩放级别1:1'
    }
});
/**
*==============================================
*创建报表
*@ChartObjet 报表配置{}
*@GridObjet grid配置{}
*@param 请求参数
*==============================================
*id, chartid, chartTitle
*/
function CreateChart(CharOpt, GridObjet, AjaxPara) {
    var ChartObjet = $.extend(true, { Title: "", RenderTo: "" }, CharOpt),
    param = $.extend({}, AjaxPara);
    ChartConfig.chart.renderTo = ChartObjet.RenderTo;
    if (GridObjet) {
        GridObjet = $.extend({ Header: [], ID: "" }, GridObjet);
        try {
            var Grid = $("#" + GridObjet.ID).ligerGrid({
                columns: GridObjet.Header,
                pageSize: ChartConfig.ShowLimit,
                method: "get",
                url: ChartConfig.ChartRequestURL,
                root: "data",
                record: "total",
                width: '100%',
                height: '90%',
                pagesizeParmName: "limit",
                heightDiff: -10,
                usePager:true,
                enabledSort: false,
                parms: param,
                pageSizeOptions: [5, 10, 15, 20,30,50,100,500,1000,1500,3000,5000,8000,10000],
                onLoaded: function (grid) {
                    DrawChart(ChartObjet, $("#" + GridObjet.ID).data("request_data"));
                    grid.toggleLoading(false);
                },
                onSuccess: function (data, grid) {
                    $("#" + GridObjet.ID).data("request_data", data);

                },
                onError: function (XMLHttpRequest, textStatus, errorThrown) {

                    $.ligerDialog.warn("数据加载错误");

                }
            });

        } catch (ex) {
            console.log(ex.message);
        }
    }
}


/**
*创建报表视图
*@cofig 报表配置
*@data 数据
*/
function DrawChart(ChartObjet, data) {
    try {
        if (data.data.length > 0) {
            var datas = [], xlabels = [], jdatas = data.data;
            for (var p in jdatas) {
                if (jdatas[p] && jdatas[p] != undefined) {
                    datas.push({ name: jdatas[p][ChartConfig.ShowPoint.Label], y: Number(jdatas[p][ChartConfig.ShowPoint.Values]) });
                    xlabels.push(jdatas[p][ChartConfig.ShowPoint.Label]);
                }
            }
            ChartConfig.series[0].data = datas;
            if (ChartObjet.unit)
            ChartConfig.unit = ChartObjet.unit;
            ChartConfig.xAxis.categories = xlabels;
            JhrzChart = new Highcharts.Chart(ChartConfig);
            JhrzChart.setTitle({ text: ChartObjet.Title, style: { color: 'red' } }, { /*text: ChartObjet.Title*/ }, false);

        }
    } catch (ex) {
        console.log(ex.message);
    }

}



