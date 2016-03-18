<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8sgEHZr8vmTA3dSvnrzcsPNB"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>
    <script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
    <title>物流查询</title>
    <link href="${ctx}/content/css/index.css" rel="stylesheet" />
    <link href="${ctx}/content/css/map.css" rel="stylesheet" />
    <link href="${ctx}/content/js/poshytip/tip-yellow/tip-yellow.css" rel="stylesheet" />
    <script src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script src="${ctx}/content/js/poshytip/jquery.poshytip.min.js"></script>
    <script src="${ctx}/content/js/public.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#CarInfo').poshytip({
                className: 'tip-yellow',
                content: $('#cartip').html()
            });
            $('input[name=no]').focus(function () {
                if ($(this).val() == $(this).attr('data-msg'))
                    $(this).val('');
            });
            $('input[name=no]').blur(function () {
                if ($(this).val() == '')
                    $(this).val($(this).attr('data-msg'));
            });
            $('input[name=no]').focus();
            init();
        });

        function init() {
            var delNO = $('#hiddDeliverNo').val();
            if (delNO == '') {
                alert('没有找到相关的物流信息！请检查单号！');
            } else {
            	$.ajax({
                    type: "post",
                    url: "${ctx}/PostMap/getIgCarTranHisByGPSNOList.ajax",
                    data: { "deliverNo": delNO},
                    success: function (msg) {
                    	 //alert(JSON.stringify(msg));
                    	 if (!msg.success) {
                             alert(msg.message);
                             return false;
                         }
                         var data = msg.data;
                         if(data.length < 1){
                        	 alert("暂无物流轨迹");
                        	 return false;
                         }
                         var points = [];
                         for (var p in data) {
                             var sourceLatLng = new BMap.Point(data[p]['LON'], data[p]['LAT']);
                             //CoordinateConverter converter  = new CoordinateConverter();  
                             //converter.from(CoordType.GPS);  
                             //// sourceLatLng待转换坐标  
                             //converter.coord(sourceLatLng);  
                             //LatLng desLatLng = converter.convert();
                             points.push(sourceLatLng);
                         }
                         //followChk = document.getElementById("follow");
                         //playBtn = document.getElementById("play");
                         //pauseBtn = document.getElementById("pause");
                         //resetBtn = document.getElementById("reset");

                         //初始化地图,选取第一个点为起始点
                         map = new BMap.Map("container");
                         map.centerAndZoom(points[0], 15);
                         var Viewport = map.setViewport(points);
                         map.enableScrollWheelZoom();
                         map.addControl(new BMap.NavigationControl());
                         map.addControl(new BMap.ScaleControl());
                         map.addControl(new BMap.OverviewMapControl({ isOpen: true }));
                         //通过DrivingRoute获取一条路线的point
                         var driving = new BMap.DrivingRoute(map, {
                             onSearchComplete: function (results) {//检索完成后的回调函数DrivingRouteResult
                                 if (driving.getStatus() == BMAP_STATUS_SUCCESS) {
                                     //获取所有点的坐标
                                     endLoading();

                                     //得到路线上的所有point
                                     points = results.getPlan(0).getRoute(0).getPath();
                                     //画面移动到起点和终点的中间
                                     centerPoint = new BMap.Point((points[0].lng + points[points.length - 1].lng) / 2, (points[0].lat + points[points.length - 1].lat) / 2);
                                     map.panTo(centerPoint);
                                     //连接所有点
                                     map.addOverlay(new BMap.Polyline(points, { strokeColor: "#FC3035", strokeWeight: 5, strokeOpacity: 1 }));

                                     var mapicon = new BMap.Icon("${ctx}/images/car.gif", new BMap.Size(22, 22), { imageOffset: new BMap.Size(0, 0) });
                                     lushu = new BMapLib.LuShu(map, points, {
                                         //defaultContent: "车内温度 ℃ 湿度 %rh", //覆盖物中的内容 
                                         autoView: true, //是否开启自动视野调整，如果开启那么在运动过程中会根据视野自动调整
                                         icon: mapicon,
                                         speed: 1000,
                                         enableRotation: true, //是否设置marker随着道路的走向进行旋转
                                         landmarkPois: []
                                     });

                                     //(function refeshContent() {
                                     //    setTimeout(function () { refeshContent(); }, 200);
                                     //}());



                                     //显示小车子
                                     label = new BMap.Label("", { offset: new BMap.Size(-5, -5) });
                                     car = new BMap.Marker(points[0], { icon: mapicon });
                                     car.setLabel(label);
                                     map.addOverlay(car);
                                     //点亮操作按钮
                                     //playBtn.disabled = false;
                                     //resetBtn.disabled = false;
                                     lushu.start();
                                     if (car.map != null)
                                         map.removeOverlay(car);

                                 }
                             }
                         });
                         driving.search(points[0], points[points.length - 1]);
                    }
                });
            }
        }

        function MyCallMsg(msg) {
            alert(msg);
        }
    </script>
</head>
<body>
    <div id="top_info">
        <div class="warpcont">
            <form method="post" action="${ctx}/PostMap/IG_Tran.html" id="form1">
                <input type="hidden" name="hiddDeliverNo" id="hiddDeliverNo" value="${deliverNo }" />
                <div class="warp_left">
                    <div class="celleft"><span class="celtext">发货地:</span></div>
                    <div class="celleft">
                        <span class="celtext underline">
                            ${vigDeliverBean.deladd }</span>
                    </div>
                    <div class="celleft"><span class="celtext">收货地:</span></div>
                    <div class="celleft">
                        <span class="celtext underline">
                            ${vigDeliverBean.recadd }</span>
                    </div>
                    <div class="celleft"><span class="celtext">负责运输人:</span></div>
                    <div class="celleft">
                        <span class="celtext">${vigDeliverBean.name }</span>
                    </div>
                    <div class="celleft">
                        <span class="celtext"><a href="javascript:;" id="CarInfo">详情</a></span>
                    </div>
                    <div class="celleft">
                        <span class="celtext">
                            <div class="cellfmsb" style="width: 120px;">

                                <input type="button" value="查看物流轨迹" class="cel_f_sb" onclick="init();" />
                                <div class="cellfms2"></div>
                            </div>
                        </span>
                    </div>
                </div>
                <div class="warp_right">
                    <div class="celleft">
                        <div class="cellInput1">
                            <input name="no" type="text" value="${deliverNo}" id="no" class="cel_f_in" data-msg="请输入物流码" />
                            <div class="cellInput2"></div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="celleft">
                        <div class="cellfmsb">
                            <input type="submit" name="btnSearch" value="查询" id="btnSearch" class="cel_f_sb" />
                            <div class="cellfms2"></div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div id="cartip" style="display: none;">
                    <div class="outbox">
                        <div class="outbox_pic" style="background: url('${ctx}/${igDriverBean.photo}') no-repeat scroll center center;"></div>
                        <div class="outbox_car">
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">车型:</span></div>
                                <div class="celleft">
                                    <span class="celtext"><asia:write name="cartype" dictId="PostMap_CarType"></asia:write></span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">车牌:</span></div>
                                <div class="celleft">
                                    <span class="celtext">${igCarBean.carno }</span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">年龄:</span></div>
                                <div class="celleft">
                                    <span class="celtext">${igDriverBean.age }岁</span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">性别:</span></div>
                                <div class="celleft">
                                    <span class="celtext"><asia:write name="driverSex" dictId="driver_sex"></asia:write></span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">驾龄:</span></div>
                                <div class="celleft">
                                    <span class="celtext">${igDriverBean.driveage }年</span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="outbox_trans">
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">发货时间:</span></div>
                                <div class="celleft">
                                    <span class="celtext"><fmt:formatDate value="${vigDeliverBean.operatedate }" pattern="yyyy-MM-dd" /></span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="out_line">
                                <div class="celleft"><span class="celtext">发货总质量:</span></div>
                                <div class="celleft">
                                    <span class="celtext">${vigDeliverBean.delamount }kg</span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="out_line">
                                <div>
									<table cellspacing="0" rules="all" border="1" id="gridDelList" style="width:100%;border-collapse:collapse;">
										<tr class="GridViewHeaderStyle">
											<th scope="col">合作社</th>
											<th scope="col">作物名称</th>
											<th scope="col">质量</th>
										</tr>
										
										<c:forEach  items="${VIgDelDetailBeans}" var="item">
											<tr class="GridViewRowStyle">
												<td><c:out value="${item.cofarmerName}"></c:out></td>
												<td><c:out value="${item.goodsName}"></c:out></td>
												<td><c:out value="${item.amount}"></c:out></td>
											</tr>
									    </c:forEach>
									</table>
								</div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="container"></div>
</body>
</html>
