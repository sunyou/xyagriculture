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

Ext.define('iModel.map.mappanel', {
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
            gmapType: 'Bmappanel',
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
        //获取标记
        this.editForm = this.up("form").getForm();
        var mks = [];
        //经纬度
        var lat = parseFloat(this.editForm.findField(this.LatitudeField).value); // parseFloat(datarow[this.LatitudeField]);
        var lng = parseFloat(this.editForm.findField(this.LongitudeField).value); // parseFloat(datarow[this.LongitudeField]);
        var des = this.editForm.findField(this.displayField).value; // datarow[this.displayField].toString();
        //缩放级别
        var BZoom = parseInt(this.editForm.findField(this.Zoom).value);
        if (isNaN(BZoom) || BZoom == 0) {
            BZoom = 13;
        }
        //默认坐标点
        var point = new BMap.Point(108.947, 34.270);
        if (lat > 0) {
            // 创建点坐标
            point = new BMap.Point(lng, lat);
            var marker = new BMap.Marker(point, { title: des });
            mks.push(marker);
            this.IsMarked = true;
        }
        //合并对象
        var mapOptions = Ext.apply({ markers: mks }, {
            Zoom: BZoom,
            Center: point
        })
        this.callParent();

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
        //地图右键菜单
        var contextMenu = new BMap.ContextMenu();
        var txtMenuItem = {
            text: "在此添加标注",
            callback: function(p) {
                if (!me.IsMarked) {
                    var marker = new BMap.Marker(p);
                    if (me.editForm.findField(me.displayField) != null) {
                        marker.setTitle(me.editForm.findField(me.displayField).value);
                    }

                    me.addMarker(marker);
                    me.IsMarked = true;
                    // map.addOverlay(marker);
                    me.updatePostion(p, map.getZoom(), map.getCenter());
                }
            }
        };
        contextMenu.addItem(new BMap.MenuItem(txtMenuItem.text, txtMenuItem.callback, 100));
        map.addContextMenu(contextMenu);

        //缩放事件
        map.addEventListener("zoomend", function(type, target) {
            me.updateOption(map.getZoom());
        })

        //添加标记到地图
        Ext.each(mks.markers, this.addMarker, this);

    },
    addMarker: function(mk) {
        var me = this;
        //创建图表对象
        var myicon = new BMap.Icon("/Content/Marker/Gmap-marker-blue.png", new BMap.Size(50, 50));
        //将地图的标记和事件添加到地图
        me.map.addOverlay(mk);
        //启用标记拖拽
        mk.enableDragging();
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
        //标记拖拽事件
        mk.addEventListener('dragend', function(event) {
            //重新定位标点的坐标
            this.setPosition(event.point);
            //更新表单的store数据
            me.updatePostion(event.point, me.map.getZoom(), me.map.getCenter());

        });
        //右键删除标记
        mk.addEventListener('rightclick', function(event) {
            var txtMenuItem = {
                text: "移除此标记",
                callback: function(p) {
                    me.map.removeOverlay(mk);
                    var myPoint = new BMap.Point(0, 0);
                    me.updatePostion(myPoint, me.map.getZoom(), myPoint);
                    me.IsMarked = false;
                }
            };
            var contextMenu = new BMap.ContextMenu();
            contextMenu.addItem(new BMap.MenuItem(txtMenuItem.text, txtMenuItem.callback, 100));
            this.addContextMenu(contextMenu);
        });


    },
    updatePostion: function(latlng, zoom) {
        //lat
        if (this.editForm.findField(this.LatitudeField) != null) {
            this.editForm.findField(this.LatitudeField).setValue(latlng.lat);
        }
        if (this.editForm.findField(this.LongitudeField) != null) {
            this.editForm.findField(this.LongitudeField).setValue(latlng.lng);
        }
        this.updateOption(zoom);
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
            //google.maps.event.trigger(map, 'resize');
        }
    }
});
