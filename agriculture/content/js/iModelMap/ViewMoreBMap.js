/*
*API:http://dev.baidu.com/wiki/map/index.php?title=%CA%D7%D2%B3
*官方示例:http://dev.baidu.com/wiki/static/map/API/examples/
*time:2012-07-26
*author:yeml
*description:Baidu Maps 第 1.3 版;基于HTML5(页面的html文档类型申明<!doctype html>)
*兼容性:
*=============================================
*IE 6.0+ (Windows)
*Firefox 3.6+ （Windows、Mac OS X、Linux）
*Safari 3.0+（Mac OS X、iOS）
*Chrome 浏览器（Windows、Mac OS X、Linux）
*Opear9.0+
*iPhone
*Android
*=============================================
*测试经纬度:[108.92062，34.20365]
*百度的经纬度在google里面是反过来的
*坐标转换:http://dev.baidu.com/wiki/static/map/API/examples/?v=1.3&0_6#0&6
*/


var GmapPanel = Ext.define('iModel.map.mapsetpanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.mapsetpanel',
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
            gmapType: 'mapsetpanel',
            border: false,
            IsMarked: false//是否已经添加标记
        });
        this.callParent();
        if (!imodel.MapResourceLoaded) {
            LoadBmapResource(1);
            imodel.MapResourceLoaded = true;
        }
    },
    afterFirstLayout: function() {
        this.gridForm = this.up("form");
        this.store = this.gridForm.entity.getTableByEName(this.tableName).store;
        this.store.addListener("load", this.StarMap, this)
    },
    StarMap: function() {
        var me = this;
        var mks = [];
        //默认坐标点
        var BMapCenter = new BMap.Point(108.947, 34.270);
        //缩放级别
        var BZooms = [];
        me.store.each(function(row, index) {
            //经纬度
            var lat = parseFloat(row.get(me.LatitudeField)); // parseFloat(datarow[this.LatitudeField]);
            var lng = parseFloat(row.get(me.LongitudeField)); // parseFloat(datarow[this.LongitudeField]);
            var des = row.get(me.displayField); // datarow[this.displayField].toString();
            if (lat > 0) {
                //缩放级别
                BZooms.push(parseInt(row.get(me.Zoom)));
                if (index == 0) {
                    BMapCenter = new BMap.Point(lng, lat);
                }
                var myLatlng = new BMap.Point(lng, lat);
                var marker = new BMap.Marker(myLatlng, { title: des });
                mks.push(marker);
                me.IsMarked = true;
            }
        })
        var BZoom = 13;
        if (BZooms.length > 0) {
            //获取最大值
            BZoom = Math.max.apply(null, BZooms);
        }
        //合并对象
        var mapOptions = { markers: mks,
            Zoom: BZoom,
            Center: BMapCenter
        };

        this.createMap(mapOptions);
    },
    //创建地图
    createMap: function(mks) {
        var me = this;
        // 创建Map实例
        /**mapType地图类型
        *BMAP_NORMAL_MAP//此地图类型展示普通街道视图。
        *BMAP_PERSPECTIVE_MAP//此地图类型展示透视图像视图。
        *BMAP_SATELLITE_MAP//此地图类型展示卫星视图。(自1.2 新增)。
        *BMAP_HYBRID_MAP//此地图类型展示卫星和路网的混合视图。(自1.2 新增)。
        */
        this.map = new BMap.Map(this.body.dom, { mapType: BMAP_NORMAL_MAP });
        var map = this.map;


        /**
        *BMAP_NAVIGATION_CONTROL_LARGE 表示显示完整的平移缩放控件。 
        *BMAP_NAVIGATION_CONTROL_SMALL 表示显示小型的平移缩放控件。
        *BMAP_NAVIGATION_CONTROL_PAN 表示只显示控件的平移部分功能。 
        *BMAP_NAVIGATION_CONTROL_ZOOM 表示只显示控件的缩放部分功能。
        */
        var opts = { type: BMAP_NAVIGATION_CONTROL_LARGE }
        map.addControl(new BMap.NavigationControl(opts));
        //中心点，缩放级别
        map.centerAndZoom(mks.Center, mks.Zoom);
        // 启用滚轮放大缩小。
        map.enableScrollWheelZoom();
        // 启用键盘操作。
        map.enableKeyboard();
        //添加标记到地图
        Ext.each(mks.markers, this.addMarker, this);
        //新增
        var pointArray = new Array();
        Ext.each(mks.markers, function(k, m) {
            pointArray.push(k.getPosition());
        });
        if (pointArray.length > 0) {
            map.setViewport(pointArray);
        }

    },
    addMarker: function(mk) {
        var me = this;
        //创建图表对象
        var myicon = new BMap.Icon("/Content/Marker/Gmap-marker-blue.png", new BMap.Size(50, 50));
        //将地图的标记和事件添加到地图
        me.map.addOverlay(mk);
        mk.setIcon(myicon);
        //气泡窗体配置
        var opts = {
            width: 250,     // 信息窗口宽度
            height: 100,     // 信息窗口高度
            title: mk.getTitle()  // 信息窗口标题
        }

        //单击显示详细(气泡)
        mk.addEventListener("click", function(event) {
            var infoWindow = new BMap.InfoWindow("", opts);  // 创建信息窗口对象
            this.openInfoWindow(infoWindow);
        })

    },
    redraw: function() {
        var map = this.gmap;
        if (map) {
            google.maps.event.trigger(map, 'resize');
        }
    }
});
