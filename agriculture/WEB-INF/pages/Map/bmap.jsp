<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        body, html, #allmap {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
        }
        .tishi {
        position:absolute;top:0px;left:0px;z-index:999999;background:#FFCA83;
        }
    </style>

    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/fancyBox/jquery.fancybox.js"></script>
    <!--map地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8sgEHZr8vmTA3dSvnrzcsPNB"></script>
    <script type="text/javascript">
        /**
        *==================================
        *status	Int	返回结果状态值， 成功返回0
        *location	object	经纬度坐标{lat	float	纬度值lng	float	经度值}
        *==================================
        */
        var points=points || {};
        function showLocation(data) {
            if (data.status == 0) {
                points = { lng: data.result.location.lng, lat: data.result.location.lat, z: 12, n: "" };
            }

        }
    </script>
    
    <script type='text/javascript'>var IP_INFO=false,IsEdit=false,NoPoint=false;var IP_INFO={"address":"CN|\u5409\u6797|\u957f\u6625|None|CERNET|0|0","content":{"address":"\u5409\u6797\u7701\u957f\u6625\u5e02","address_detail":{"city":"\u957f\u6625\u5e02","city_code":53,"district":"","province":"\u5409\u6797\u7701","street":"","street_number":""},"point":{"x":"125.31364243","y":"43.89833761"}},"status":0}; points={lng:${lng},lat:${lat},z:9,n:"${cofarmername}"};</script>
    
</head>
<body>   
    
    <div id="allmap"></div>
    <script type="text/javascript">
        //加载多个坐标点，修改坐标点
        var map = new BMap.Map("allmap");
        if (points != undefined) {
            var point = new BMap.Point(points.lng, points.lat);
            map.centerAndZoom(point, points.z);
            map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
            map.enableDragging();//启用地图拖拽，默认启用。
            //标记点
            var myIcon = new BMap.Icon("${ctx}/images/Gmap-marker-blue.png", new BMap.Size(23, 25));
            var marker = new BMap.Marker(point, {
                icon: myIcon,
                enableDragging: true,
                enableClicking: true,
                raiseOnDrag: true,
                title: points.n
            });

            marker.addEventListener("click", function () {
                //alert("您点击了标注");  
                var opts = {
                    width: 250,     // 信息窗口宽度    
                    height: 100,     // 信息窗口高度    
                    title: ""  // 信息窗口标题   
                }
                var infoWindow = new BMap.InfoWindow(this.z.title, opts);  // 创建信息窗口对象    
                map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
            });
            marker.disableDragging();


            setTimeout(function () {
                if (typeof (parent.updatePoint) != "undefined")
                parent.updatePoint({ "lng": points.lng, "lat": points.lat, "zoom": map.getZoom() });
            }, 200);
        }

        if (IsEdit) {

            marker.enableDragging();

            marker.addEventListener("dragstart", function (e) {
                $("#beforeValue").data("beforePoint", new BMap.Point(e.point.lng, e.point.lat));
            });

            marker.addEventListener("dragend", function (e) {
                art.dialog.confirm("确定更新到当前坐标吗？", function () {
                    point = new BMap.Point(e.point.lng, e.point.lat);
                    parent.updatePoint({ "lng": e.point.lng, "lat": e.point.lat, "zoom": map.getZoom() });
                }, function () {
                    marker.setPosition($("#beforeValue").data("beforePoint"));

                });
            });
            //
            map.addEventListener("zoomend", function () {
                parent.updatePoint({ "lng": point.lng, "lat": point.lat, "zoom": map.getZoom() });
            });

        }
        map.addOverlay(marker);

    </script>
    <input id="beforeValue" type="hidden" value="" />
    <input id="newValue" type="hidden" value="" />
</body>
</html>
