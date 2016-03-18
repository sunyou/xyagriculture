<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>生产者</title>
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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8sgEHZr8vmTA3dSvnrzcsPNB"></script>
    <script type="text/javascript">
        /**
        *======================================================================================
        *创建地图
        *添加一个或者多个坐标点，当坐标点有多个时，返回最适合的zoom和中心区域视图。
        *======================================================================================
        */
        var createMap = {
            map: null,
            render: function (elementid) {//初始化地图
                this.map = new BMap.Map(elementid);
                this.map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
                this.map.enableDragging();//启用地图拖拽，默认启用。
                return this.map;
            },//添加坐标点
            addPoints: function (pos) {//添加到所有的坐标点到地图

                var p = this.crtePoint(pos.lng, pos.lat);
                if (!this.hasCenter) {
                    this.map.centerAndZoom(p, pos.zoom);
                    this.hasCenter = true;

                }

                var myIcon = new BMap.Icon("${ctx}/images/Gmap-marker-blue.png", new BMap.Size(23, 25));
                var marker = new BMap.Marker(p, {
                    icon: myIcon,
                    enableDragging: false,
                    enableClicking: true,
                    raiseOnDrag: true,
                    title: pos.name
                });
                this.map.addOverlay(marker);

            },
            crtePoint: function (lng, lat) {// 创建点坐标 
                var point = new BMap.Point(lng, lat);
                return point;
            }
        };

        $(document).ready(function () {



            $("#btn_Add").hide();
            

            $('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            var grid = $("#gv_CoFarmer").createLigerGrid({
                header: [
                    { display: '生产者编号', name: 'CoFarmer_No' },
                    { display: '生产者名称', name: 'CoFarmer_Name' },
                    { display: '生产者法人', name: 'Legal_Represent' },
                    { display: '联系电话', name: 'Tel' },
                    {
                        display: '邮箱', name: 'Email', render: function (rowdata, rowid, rowobj) {
                            var _ln = parseFloat(rowdata["LONGITUDE"]), _la = parseFloat(rowdata["LATITUDE"]), _zom = parseInt(rowdata["ZOOM"]);
                            if (!isNaN(_ln) || !isNaN(_la) || !isNaN(_zom)) {
                                var po = { lng: _ln, lat: _la, zoom: _zom, name: rowdata["COFARMER_NAME"] };
                                createMap.addPoints(po);
                            }
                            return rowdata["EMAIL"];
                        }
                    }
                ],
                param: { 'flag': 1 },
                editor: {
                    url: "/Pages/Base/Info/CoFarmerDet.aspx",
                    para: ["CoFarmer_ID"],
                    width: 560,
                    height: 300
                },
                leftBtns: {
                    
                    showDetail: {
                        show:false,
                        url: "/Pages/Base/Info/CoFarmerDet.aspx"
                    },
                    showEdit: {
                        show:false
                        },
                    showDelete: {
                        show:false
                        }
                },
                height: 300,
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "COFARMER_ID",
                ajaxURL: "${ctx}/CoFarmer/GetCoFarmer.ajax",
                success: function (data, grid) {
                    if (createMap.map != null) {
                        createMap.map.clearOverlays();
                        createMap.hasCenter = false;
                    } else
                        createMap.render("map_view");

                }
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_CoFarmerName").val());
                grid.reload()
            });



        });
    </script>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        html, body, form {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">生产者名称：</div>
					<div class="sert left">
						<input type="text" id="txt_CoFarmerName" class="serchInput" />
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
		<div position="center" style="height: 400px;">
			<div id="gv_CoFarmer"></div>
			<div id="map_view" style="height: 100%;" class="l-panel-content">
            </div>
		</div>
	</div>
</body>
</html>
