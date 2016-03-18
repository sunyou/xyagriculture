/*
*官方参考API:https://developers.google.com/maps/documentation/javascript/tutorial?hl=zh-CN
*time:2012-07-26
*author:yeml
*description:Google Maps 第 3 版;基于HTML5(<!doctype html>)
*兼容性:
*=============================================
*IE 7.0+ (Windows)
*Firefox 3.0+ （Windows、Mac OS X、Linux）
*Safari 4+（Mac OS X、iOS）
*Chrome 浏览器（Windows、Mac OS X、Linux）
*Android
*BlackBerry 6
*Dolfin 2.0+ (Samsung Bada)
*=============================================
*测试经纬度:[34.20365, 108.92062]
*/


var GmapPanel = Ext.define('iModel.map.mappanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.mappanel',
    /**
    *@displayField:显示名称
    *@LatitudeField:经度
    *@LongitudeField:纬度
    *@Zoom:地图缩放级别
    *@tableName:
    */
    requires: ['Ext.window.MessageBox'],
    initComponent: function() {
        Ext.applyIf(this, {
            plain: true,
            gmapType: 'Gmappanel',
            border: false,
            IsMarked: false//是否已经添加标记
        });
        this.callParent();
        if (!imodel.MapResourceLoaded) {
            LoadBmapResource(2);
            imodel.MapResourceLoaded = true;
        }
    },
    afterFirstLayout: function() {
        //获取标记
        this.editForm = this.up("form").getForm();
        var mks = [];
        //经纬度
        var lat = parseFloat(this.editForm.findField(this.LatitudeField).value); // parseFloat(datarow[this.LatitudeField]);
        var lng = parseFloat(this.editForm.findField(this.LongitudeField).value); // parseFloat(datarow[this.LongitudeField]);
        var des = this.editForm.findField(this.displayField).value; // datarow[this.displayField].toString();
        //缩放级别
        var GZoom = parseInt(this.editForm.findField(this.Zoom).value); //parseInt(datarow[this.Zoom]);
        if (isNaN(GZoom) || GZoom == 0) {
            GZoom = 13;
        }
        //中心点
        var GMapCenter = new google.maps.LatLng(34.270, 108.947);
        if (lat > 0) {
            GMapCenter = new google.maps.LatLng(lat, lng);
            var myLatlng = new google.maps.LatLng(lat, lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                title: des
            });
            mks.push(marker);
            this.IsMarked = true;
        }
        //合并对象
        var mapOptions = Ext.apply({ markers: mks }, {
            Zoom: GZoom,
            Center: GMapCenter
        })

        this.callParent();
        this.createMap(mapOptions);
    },
    //创建地图
    createMap: function(mks) {
        var me = this;
        var options = {
            //要指定地图的显示分辨率
            zoom: mks.Zoom,
            //标记对象
            center: mks.Center, //mks[0].position
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            /*
            *[缩放级别],系统支持以下类型:
            *ROADMAP，用于显示 Google Maps 默认的普通二维图块。
            *SATELLITE，用于显示拍摄的图块。
            *HYBRID，用于同时显示拍摄的图块和突出特征（道路、城市名）图块层。
            *TERRAIN，用于显示自然地形图块，自然地形图块中会显示高度和水体特征（山脉、河流等）。
            */
            mapTypeControl: true, // 可启用/停用“地图类型”控件，该控件允许用户在地图类型（如“地图”和“卫星”）之间切换。默认情况下，此控件将显示在地图右上角。
            mapTypeControlOptions: {
                /**
                *google.maps.MapTypeControlStyle.HORIZONTAL_BAR，用于在水平栏中将一组控件显示为如 Google Maps 中所示按钮。
                *google.maps.MapTypeControlStyle.DROPDOWN_MENU，用于显示单个按钮控件，以便您从下拉菜单中选择地图类型。
                *google.maps.MapTypeControlStyle.DEFAULT，用于显示“默认”的行为，该行为取决于屏幕尺寸，并且可能会在 API 以后的版本中有所变化。
                */
                style: google.maps.MapTypeControlStyle.DEFAULT
            },
            zoomControl: true,
            zoomControlOptions: {
                /**
                *google.maps.ZoomControlStyle.SMALL，用于显示迷你缩放控件，其中仅限 ＋ 和 － 按钮。此样式适用于小型地图。在触摸设备上，该控件显示为可响应触摸事件的 + 和 - 按钮。
                *google.maps.ZoomControlStyle.LARGE 用于显示标准缩放滑块控件。在触摸设备上，该控件显示为可响应触摸事件的 + 和 - 按钮。
                *google.maps.ZoomControlStyle.DEFAULT 会按照地图大小和运行地图的设备来挑选合适的缩放控件。
                */
                style: google.maps.ZoomControlStyle.DEFAULT
            }
        };

        //创建地图google.maps.Map - 基本对象
        this.gmap = new google.maps.Map(this.body.dom, options);
        var map = this.gmap;


        //地图右键click
        google.maps.event.addListener(map, "rightclick", function(event) {
            if (!me.IsMarked) {
                var markTit;
                if (me.editForm.findField(me.displayField) != null) {
                    markTit = me.editForm.findField(me.displayField).value;
                }
                var marker = new google.maps.Marker({
                    position: event.latLng,
                    title: markTit
                });
                me.addMarker(marker);
                me.IsMarked = true;
                me.updatePostion(event.latLng, map.getZoom());
            }
        });

        //地图分辨率更改触发
        google.maps.event.addListener(map, "zoom_changed", function() {
            me.updateOption(map.getZoom());
        });



        //添加标记到地图
        Ext.each(mks.markers, this.addMarker, this);
        /*绘画连接线
        var flightPlanCoordinates=[];
        Ext.Array.each(mks, function(mk) {
        flightPlanCoordinates.push(new google.maps.LatLng(mk.lat, mk.lng));
        })
        var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        strokeColor: "#FF0000",
        strokeOpacity: 1.0,
        strokeWeight: 2
        });
        flightPath.setMap(this.gmap);
        */

    },
    addMarker: function(mk) {
        //	Object { xtype="gmappanel"}
        var me = this;
        //标记添加到地图
        mk.setOptions({ icon: "/Content/Marker/Gmap-marker-blue.png", draggable: true, map: me.gmap });
        //创建消息显示框
        var infowindow = new google.maps.InfoWindow({
            content: mk.title,
            position: mk.position,
            size: new google.maps.Size(50, 50)
        });
        //单击显示详细(气泡)
        google.maps.event.addListener(mk, 'click', function() {
            infowindow.open(mk.map, mk);
        });
        //拖拽前
        var OldLatLng;
        google.maps.event.addListener(mk, 'dragstart', function(event) {
            OldLatLng = mk.getPosition();
        });
        //拖拽后
        google.maps.event.addListener(mk, 'dragend', function(event) {
            var NewLatLng = event.latLng;
            mk.setPosition(NewLatLng);
            /* Ext.Msg.confirm("确定更新到目标经纬度？", "经度:" + NewLatLng.lat() + "纬度:" + NewLatLng.lng(), function(optional) {
            if (optional == "no") {
            //修改数据
            o.setPosition(OldLatLng);
            return;
            }*/
            //更新表单的store数据
            me.updatePostion(event.latLng, me.gmap.getZoom());

            /* });*/

        });

        //右键菜单展示移除标记
        google.maps.event.addListener(mk, 'rightclick', function(event) {
            var r = confirm("确定删除当前标记?");
            if (r) {
                me.IsMarked = false;
                mk.setMap(null);
                var myLatlng = new google.maps.LatLng(0, 0);
                me.updatePostion(myLatlng, me.gmap.getZoom());
            }
        });


    },
    updatePostion: function(latlng, zoom) {
        var me = this;
        //lat
        if (me.editForm.findField(me.LatitudeField) != null) {
            me.editForm.findField(me.LatitudeField).setValue(latlng.lat());
        }
        if (me.editForm.findField(me.LongitudeField) != null) {
            me.editForm.findField(me.LongitudeField).setValue(latlng.lng());
        }
        me.updateOption(zoom);
    },
    updateOption: function(zoom) {
        var ZoomField = this.editForm.findField(this.Zoom);
        if (ZoomField != null) {
            ZoomField.setValue(parseInt(zoom));
        }
    },
    redraw: function() {
        var map = this.gmap;
        if (map) {
            google.maps.event.trigger(map, 'resize');
        }
    }
});
