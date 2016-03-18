var basePath = '';
try{
	basePath = window.parent.GLOBAL.WEBROOT;
}catch(e){
}

var jhrz_img_icon = ["/Content/icons/sun.gif"];

function DrawImage(ImgD, iwidth, iheight) {
    //参数(图片,允许的宽度,允许的高度)   
    var image = new Image();
    image.src = ImgD.src;
    if (image.width > 0 && image.height > 0) {
        if (image.width / image.height >= iwidth / iheight) {
            if (image.width > iwidth) {
                ImgD.width = iwidth;
                ImgD.height = (image.height * iwidth) / image.width;
            } else {
                ImgD.width = image.width;
                ImgD.height = image.height;
            }
        } else {
            if (image.height > iheight) {
                ImgD.height = iheight;
                ImgD.width = (image.width * iheight) / image.height;
            } else {
                ImgD.width = image.width;
                ImgD.height = image.height;
            }
        }
    }
}
var ajaxConfig = ajaxConfig || {};
ajaxConfig.areaRequestURL = "/Pages/Hander/GetAreaTown.ashx";

/**
*==========================
****加载数据***
*==========================
*@para Ajax请求参数
*@id：需要绑定的下拉框ID
*@fn：回调函数
*/
function BindOption(id, ParentId, fn) {
    $(id).empty();
    $(id).append("<option value='-1'>请选择</option>");
    if (ParentId != "-1") {
        changLoader(true, "Msg");
        getAjax(ajaxConfig.areaRequestURL, { "flag": "Areas", "Area_ID": ParentId }, function (data) {
            if (data.success) {
                var list = data.data, opt = "";
                for (var i = 0; i < list.length; i++) {
                    opt += "<option value='" + list[i]['Area_ID'] + "'>" + list[i]['Area_Name'] + "</option>";
                }
                $(id).append(opt);
            }
            changLoader(false, "Msg");
            if (fn)
                fn.call(this);
        });
    }
}




/**
*获取url参数
*@name:获取的参数名    
*/
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

/**
*获取url参数转换成json
*@url:url   
*return  Object
*/
function urlTojson(url) {
    var ret = {};//定义数组  
    url.search.substr(1).replace(/(\w+)=(\w+)/ig, function (a, b, c) { ret[b] = unescape(c); });
    return ret;
}




/**
*打开模态窗口
*@url 地址
*@width 宽度
*@height 高度
*/
function showDialog(url, width, height) {
    var x = parseInt(screen.width / 2.0) - (width / 2.0);
    var y = parseInt(screen.height / 2.0) - (height / 2.0);
    if ($.browser.msie) {
        retval = window.showModalDialog(url, window, "dialogWidth:" + width + "px; dialogHeight:" + height + "px; dialogLeft:" + x + "px; dialogTop:" + y + "px; status:no; directories:yes;scrollbars:no;Resizable=yes; ");
    }
    else {
        var win = window.open(url, "mcePopup", "top=" + y + ",left=" + x + ",scrollbars=" + scrollbars + ",dialog=yes,modal=yes,width=" + width + ",height=" + height + ",resizable=no");
        eval("try { win.resizeTo(width, height); } catch(e) { }");
        win.focus();
    }
}


/**
*加载等待提示
*@falg(true打开提示,false关闭提示)
*/
function MyLoading(falg, selecter) {
    var loading = "<div id='dlading' style='position:absolute;left:0;width:100%;height:100%;top:0;background:#FFFFFF;opacity:0.8;filter:alpha(opacity=90);z-index:9999999;'>";
    loading += "<div style='border:2px solid #B7CDFC;cursor:wait;position:relative;top:45%;margin:0 auto;width:200px;height:36px;line-height:36px;font-size:14px;'>";
    loading += "<img src='"+ basePath +"/content/css/images/loading-black.gif' title='正在加载......' style='float:left;margin-top:8px;margin-left:3px;border:none;' />正在加载，请等待......</div></div>";
    if (falg) {
        if (selecter)
            $(selecter).append(loading);
        else
            $("body", document).append(loading);

    } else {
        if ($("#dlading") != undefined) {
            $("#dlading").remove();
        }
    }
}


/**
*弹出登陆框
*/
function ShowLoginWin() {
    art.dialog.open('/pages/login_win.aspx', { title: '用户登录', background: '#FFFFFF', opacity: 0, width: 360, height: 300, lock: true }, false);

}


/**将参数转换对象
*@url   (a=1&b=2)
*return {a=1,b=2}
*/
function getQueryJson(url) {
    var ret = {}; //Object
    url.replace(/(\w+)=(\w+)/ig, function (a, b, c) { ret[b] = unescape(c); });
    return ret;
}

///**
//*封装jquery get请求ajax
//*author:叶明龙
//*time:2012-12-10
//*/
function getAjax(url, para, fn) {
    if (typeof fn == "function") {
        if (para == undefined) {
            para = {};
        }
        $.get(url, para, function (data) {
//            var obj = eval("(" + data + ")");
            fn.call(this, data);
        })
    }
}

function myAjax(url, method, param, callback) {
    var _p = $.extend({}, param), _m = "POST";
    if (method != undefined || method != null)
        _m = method;
    $.ajax({
        type: _m,
        url: url,
        data: _p,
        success: function (msg) {
            callback.call(this, eval("(" + msg + ")"));
        }
    });

}


(function (win) {
    if (win["jQuery"]) {
        var $ = win["jQuery"];
        $.fn.serializeJson = function () {
            var serializeObj = {};
            var array = this.serializeArray();
            var str = this.serialize();
            $(array).each(function () {
                if (serializeObj[this.name]) {
                    if ($.isArray(serializeObj[this.name])) {
                        serializeObj[this.name].push(this.value);
                    } else {
                        serializeObj[this.name] = [serializeObj[this.name], this.value];
                    }
                } else {
                    serializeObj[this.name] = this.value;
                }
            });
            return serializeObj;
        }
    };
})(window);
/**
*加载等待，用于ajax验证框等待提示
*@flag(boolean) 显示或隐藏
*@elemid块儿元素的ID
*/
function changLoader(flag, elemid) {
    if (flag) {
        $("#" + elemid + "").html("<img src=\"/Content/images/loading-x.gif\" style='width:16px;height:16px;' />");
    } else {
        $("#" + elemid + "").html("");
    }
}




/**
*description:同域加载iframe
*time:2012/12/21
*/
function frameLoad(id) {
    var sp_msg = document.getElementById("frame" + id + "_msg");
    if (sp_msg != undefined)
        document.getElementById("frame" + id + "_msg").innerHTML = "";
    var cframe = document.getElementById("iframe" + id);
    if (cframe != undefined) {
        if (document.getElementById) {
            if (cframe && !window.opera) {
                if (cframe.contentDocument && cframe.contentDocument.body.offsetHeight)
                    cframe.height = cframe.contentDocument.body.offsetHeight + 20; //FF NS
                else if (cframe.Document && cframe.Document.body.scrollHeight)
                    cframe.height = cframe.Document.body.clientHeight + 100; //IE
            }
            else {
                if (cframe.contentWindow.document && cframe.contentWindow.document.body.scrollHeight)
                    cframe.height = cframe.contentWindow.document.body.scrollHeight; //Opera
            }
        }
    }
}
function cofchange(id) {
    window.open("../../Pages/TS/CoFarmerDetail1.aspx?id=" + id.value + "/", "_parent");

}



/**
*打开编辑，新建窗口
*
*/

function myopen(url, tle, _w, _h) {
    var w1 = 450, h1 = 400;
    if (_w && _h) {
        w1 = _w;
        h1 = _h;
    }
    art.dialog.open(url, { title: tle, background: '#FFFFFF', opacity: 0, width: _w, height: _h, lock: true }, false);
}

function myConfirm(title, url) {
    try {
        art.dialog.confirm(title, function () {
            myAjax(url, "GET", {}, function (json) {
                if (json.success) {
                    art.dialog.tips('操作成功！');
                    window.location = window.location;
                }
            });
        }, function () {
            art.dialog.tips('你取消了操作');
            this.close();
        });
    } catch (e) {
        console.log(e.toString());
    }
}



function showSucess(msg, url) {
    $.ligerDialog.success({
        title: "提示",
        content: msg,
        buttons: [{ text: '确定', onclick: function (i, d) { self.location = url } }]
    });
}
function showFail(msg) {
    $.ligerDialog.warn({
        title: "提示",
        content: msg
    });
}

function getNewGuid() {
    var S4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}

//阻止事件冒泡函数
function stopBubble(e) {
    if (e && e.stopPropagation)
        e.stopPropagation()
    else
        window.event.cancelBubble = true
}

/**
*扩展Jquery方法创建LigerUI Grid
*============================================
*author：叶明龙
*time:2014/06/21
*
*
*============================================
*/

; (function (win) {
    if (win["jQuery"]) {
        var $ = win["jQuery"];
        $.fn.extend({
            createLigerGrid: function (opt) {
            
            	//全部将字段转成大写
            	for(j=0;j<opt.header.length;j++){
            		opt.header[j].name = (opt.header[j].name + '').toUpperCase();
            	}
            	
            	
                var _t = $(this);
                var options = $.extend(true, {
                    header: [],
                    title: "",//grid标题
                    ajaxURL: "",//提交服务器响应的URL
                    ajaxMethod: "post",//提交方式
                    pageSize: 25,//页码大小
                    keyID: "",//主键
                    width: '100%',
                    height: '100%',
                    leftBtns: {
                        show: true,
                        showDelete: {
                        	buttonName:"删除",
                            url: "",
                            title:"删除",
                            show: true,
                            close: function () { }
                        },
                        showEdit: {
                        	buttonName:"修改",
                            url: "",
                            title:"修改信息",
                            show: true,
                            close: function () { }
                        },
                        showDetail: {
                        	buttonName:"详情",
                            url: "",
                            title:"查看详情",
                            show: true,
                            close: function () { }
                        },
                        //btns: "delete,edit,detail",
                        headText: "操作",
                        width: 120
                    },
                    showToolBar: false,
                    toolbars: {
                        items: []
                    },
                    addTools: function (record, rowindex, value, column) {
                        return "";
                    },
                    checkbox: false,
                    onSelectRow: function (rowdata, rowid, rowobj) { },
                    editor: {
                        url: "",
                        para: [],
                        width: 600,
                        height: 600,
                        localWin: {//本地修改
                            id: "",
                            formID: ""
                        }
                    },
                    success: function () { }
                }, opt);
                
                
                
                if (options.ajaxURL == "") {
                    $.ligerDialog.warn("未配置options请求ajaxURL,无法响应服务器请求数据响应!");
                    console.log("未配置options请求ajaxURL,无法响应服务器请求数据响应!");
                    return false;
                }
                if (options.leftBtns.show) {
                    options.header.push({
                        align: 'center',
                        display: options.leftBtns.headText, width: options.leftBtns.width, isAllowHide: false,
                        //frozen: true,
                        render: function (record, rowindex, value, column) {
                   
                            var renderHTML = "";
                                 if (options.leftBtns.showDetail.show) {
                                renderHTML += "<input type=button class='rowDetailButton' onclick=\"";
                                if (options.editor.localWin && options.editor.localWin.id != "") {
                                    renderHTML += "getAjax('";
                                    renderHTML += options.leftBtns.showDetail.url.length > 0 ? options.leftBtns.showDetail.url : options.ajaxURL;
                                    renderHTML += "?type=3&" + "id=" + record[options.keyID] + "',{},function(data){if(data.success){ $('#" + options.editor.localWin.formID + "').form('load',data.data);$.ligerDialog.open({ target: $('#" + options.editor.localWin.id + "'),title:'"+options.leftBtns.showDetail.title+"',width: " + options.editor.width + ", height: " + options.editor.height + " });}});"
                                } else {
                                    renderHTML += "currDialog = art.dialog.open('" + options.leftBtns.showDetail.url + "?type=3&" + "id=" + record[options.keyID] +"', {title: '"+options.leftBtns.showDetail.title+"',width:" + (options.leftBtns.showDetail.width == undefined ? options.editor.width : options.leftBtns.showDetail.width) + ",height:" + (options.leftBtns.showDetail.height == undefined ? options.editor.height : options.leftBtns.showDetail.height) + ",lock: true,background: '#333333',opacity: 0});stopBubble(event);";

                                }
                                renderHTML += " \" value=\""+options.leftBtns.showDetail.buttonName+"\">&nbsp;&nbsp;";
                            }
                            if (options.leftBtns.showEdit.show) {
                                renderHTML += "<input type=button class='rowEditButton' onclick=\"";
                                if (options.editor.localWin && options.editor.localWin.id != "") {
                                    renderHTML += "getAjax('";
                                    renderHTML += options.leftBtns.showEdit.url.length > 0 ? options.leftBtns.showEdit.url : options.ajaxURL;
                                    if (options.leftBtns.showEdit.url.indexOf("?") != -1) {
                                    	renderHTML += "&type=2&" + "id=" + record[options.keyID] + "',{},function(data){if(data.success){ $('#" + options.editor.localWin.formID + "').form('load',data.data);$.ligerDialog.open({ target: $('#" + options.editor.localWin.id + "'),title:'修改信息',width: " + options.editor.width + ", height: " + options.editor.height + "});}});"
                                    }else{
                                    	renderHTML += "?type=2&" + "id=" + record[options.keyID] + "',{},function(data){if(data.success){ $('#" + options.editor.localWin.formID + "').form('load',data.data);$.ligerDialog.open({ target: $('#" + options.editor.localWin.id + "'),title:'修改信息',width: " + options.editor.width + ", height: " + options.editor.height + "});}});"
                                    }
                                    
                                } else {
                                    var width = options.leftBtns.showEdit.width == undefined ? options.editor.width : options.leftBtns.showEdit.width;
                                    var height = options.leftBtns.showEdit.height == undefined ? options.editor.height : options.leftBtns.showEdit.height;
                                    //var url = options.leftBtns.showEdit.url + "?type=2&" + "id=" + record[options.keyID];
                                    var url = "";
                                    if(options.leftBtns.showEdit.url.indexOf("?") != -1){
                                    	url = options.leftBtns.showEdit.url + "&type=2&" + "id=" + record[options.keyID];
                                    }else{
                                    	url = options.leftBtns.showEdit.url + "?type=2&" + "id=" + record[options.keyID];
                                    }
                                    var title = options.leftBtns.showEdit.title;
                                    var closeFunc = options.leftBtns.showEdit.close;
                                    renderHTML += "openDialogInIframe("+width+","+height+",'"+url+"','"+title+"',"+closeFunc+");stopBubble(event);";
                                }
                                renderHTML += " \" value=\""+options.leftBtns.showEdit.buttonName+" \">&nbsp;&nbsp;";
                            }
                            
                     
                            
                              if (options.leftBtns.showDelete.show) {
                                renderHTML += "<input type=button class='rowDeleteButton' onclick=\"";

                                var delUrl = options.leftBtns.showDelete.url.length > 0 ? options.leftBtns.showDelete.url : options.ajaxURL;
                                delUrl += "?type=delete&id=" + record[options.keyID];
                                var delData = "";
                                if (JSON)
                                    delData += JSON.stringify(options.param).replace(/\"/g, "'");
                                else {
                                    delData += "{";
                                    var _f = false;
                                    for (var pn in options.param) {
                                        if (_f)
                                            delData += ",";
                                        delData += "'" + pn + "':'" + options.param[pn] + "'";
                                        _f = true;
                                    }
                                    delData += "}";
                                }
								renderHTML += "ajaxDelete('"+delUrl+"',"+delData+");stopBubble(event);";
                                renderHTML += " \" value=\""+options.leftBtns.showDelete.buttonName+"\">&nbsp;&nbsp;";
                            }
                            
                            
                            renderHTML += options.addTools(record, rowindex, value, column);
                            return renderHTML;
                        }
                    });
                }
                var toolbars = null;
                if (options.showToolBar) {
                    toolbars = {};
                    toolbars.items = [];
                    toolbars.items.push({
                        text: '添   加', click: function (e) {
                            if (options.editor && options.editor.localWin) {
                                $.ligerDialog.open({ target: $("#" + options.editor.localWin.id) });
                            } else
                                $.ligerDialog.open({ width: options.editor.width, height: options.editor.height, title: "添   加", url: options.editor.url + "?type=1" });
                        }, icon: 'add'
                    },
                            {
                                text: '删   除', click: function () {
                                    $.ligerDialog.confirm('确定删除?', function (yes) {
                                        if (yes) {
                                            var _Rows = Grid.getSelectedRows(), _keys = []
                                            for (var i = 0; i < _Rows.length; i++) {
                                                _keys.push(_Rows[i][options.keyID]);
                                            }
                                            getAjax(options.ajaxURL + "?type=delete&id=" + _keys.join(','), options.param, function (data) {
                                                if (data.success)
                                                    $.ligerDialog.success('删除成功');
                                                else
                                                    $.ligerDialog.error('删除失败');
                                            });
                                        }
                                    });
                                }, icon: 'delete'
                            });
                }

                $.each(options.header, function (n, item) {
                    options.header[n] = $.extend({ align: 'left' }, item);
                });
                var createLigerGrid = $(_t).ligerGrid({
                    title: options.title,
                    columns: options.header,
                    pageSize: options.pageSize,
                    method: options.ajaxMethod,
                    url: options.ajaxURL,
                    checkbox: options.checkbox,
                    toolbarShowInLeft: true,
                    toolbar: toolbars,
                    root: "data",
                    record: "total",
                    columnWidth: 100,
                    pagesizeParmName: "limit",
                    pageSizeOptions: [options.pageSize, options.pageSize + 25, options.pageSize + 50, options.pageSize + 75],
                    width: options.width,
                    height: options.height,
                    heightDiff: -10,
                    usePager: true,
					rownumbers:true,
                    enabledSort: false,
                    parms: options.param,
                    onSelectRow: function (rowdata, rowid, rowobj) {
                        options.onSelectRow(rowdata, rowid, rowobj);

                    },
                    onCheckRow: function (checked, data, rowid, rowdata) {

                    },
                    onLoaded: function (grid) {
                        grid.toggleLoading(false);
                        if (options.success)
                            options.success($(_t).data("request_data"), grid);
                        if (options.onLoaded) {
                            options.onLoaded(grid);
                        }
                    },
                    onSuccess: function (data, grid) {
                        if (!data.success) {
                            //art.dialog.alert("当前请求遇到了问题，无法显示数据。可能原因是:<br><font color='red'>" + data.message + "</font>");
                            art.dialog.alert("请求失败，失败原因:<br><font color='red'>" + data.message + "</font>");
                            return false;
                        }
                        $(_t).data("request_data", data);
                    },
                    onError: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.ligerDialog.warn("数据加载错误");
                    }
                });
                return createLigerGrid;
            }
        });
    }
})(window);


/**
*
*打开帮助界面
*
*/
function openHelper(url, params, title, width, height, closeFunc) {
    /*
        $.ligerDialog.open({
            height: height,
            url: url,
            name: 'helperWin',
            width: width,
            title: title,
            isResize: true,
            buttons: [{
                text: '选择', onclick: function (item, dialog) {
                    document.getElementById('helperWin').contentWindow.selectCheck(params);
                    dialog.close();
                }
            },
            { text: '关闭', onclick: function (item, dialog) { dialog.close(); } }
            ]
        });
        
    */
    var win = art.dialog.open(url, {
        id: 'helperWin', 'title': title, 'width': width,'opacity': 0, 'height': height, button: [
                {
                    name: '选择',
                    callback: function () {
                        this.iframe.contentWindow.selectCheck(params);
                        if (closeFunc != undefined) {
                            closeFunc();
                        }
                    },
                    focus: true
                },
                {
                    name: '取消',
                    callback: function () {
                        // this.close();
                    }
                }
        ]

    }).lock();
}

/**
*帮助选择界面
*/
function selectCheck(obj) {
    var g = $("#grid").ligerGetGridManager();
    var r = g.getSelectedRow();
    if (r == undefined) {
        //$.ligerDialog.alert('请选择一笔!');
        art.dialog.alert('忘记选择数据了哟！');
        return false;
    }
    var thiswin = art.dialog.opener;
    var controls = obj.id.split(',');
    var keys = obj.key.split(',');
    for (var i = 0; i < keys.length; i++) {
        var ipt = thiswin.document.getElementById(controls[i]);
        var value = r[keys[i]];
        if (ipt != undefined) {
            if (ipt.Text != undefined) {
                ipt.Text = value
            } else {
                ipt.value = value;
            }
        }
    }
}

/**
*
*打开帮助界面
*
*/
function multiCheckHelper(url, params, title, width, height, append, closeFunc) {
    var win = art.dialog.open(url, {
        id: 'helperWin', 'title': title, 'width': width, 'height': height, button: [
                {
                    name: '选择',
                    callback: function () {
                        this.iframe.contentWindow.CheckedMore(append, params);
                        if (closeFunc != undefined) {
                            closeFunc();
                        }
                        //this.close();
                    },
                    focus: true
                },
                {
                    name: '取消',
                    callback: function () {
                        // this.close();
                    }
                }
        ]

    }).lock();
}

/**
*帮助选择界面
*/
function CheckedMore(append, obj) {
    var g = $("#grid").ligerGetGridManager();
    var data = g.getSelectedRows();
    if (data == undefined) {
        //$.ligerDialog.alert('请选择一笔!');
        art.dialog.alert('忘记选择数据了哟！');
        return false;
    }
    var thiswin = art.dialog.opener;
    var controls = obj.id.split(',');
    var keys = obj.key.split(',');
    for (var j = 0; j < keys.length; j++) {
        var control = thiswin.document.getElementById(controls[j]);
        if (control != undefined) {
            if (!append) {
                if (control.Text != undefined) {
                    control.Text = '';
                } else {
                    control.value = '';
                }
            }
            for (var i = 0; i < data.length; i++) {
                var value = data[i][keys[j]];
                if (control.Text != undefined) {
                    if (control.text == '') {
                        control.Text = value
                    } else {
                        control.Text = control.Text + ',' + value
                    }

                } else {
                    if (control.value == '') {
                        control.value = value
                    } else {
                        control.value = control.value + ',' + value;
                    }
                }
            }
        }
    }
}

/**
*
*重写grid format 日期函数
*
*/
; (function () {
    if ((typeof liger) != "undefined") {

        $.ligerDefaults.Grid.formatters['date'] = function (value, column) {
            function getFormatDate(date, dateformat) {
                var g = this, p = this.options;
                if (isNaN(date)) return null;
                var format = dateformat;
                var o = {
                    "M+": date.getMonth() + 1,
                    "d+": date.getDate(),
                    "h+": date.getHours(),
                    "m+": date.getMinutes(),
                    "s+": date.getSeconds(),
                    "q+": Math.floor((date.getMonth() + 3) / 3),
                    "S": date.getMilliseconds()
                }
                if (/(y+)/.test(format)) {
                    format = format.replace(RegExp.$1, (date.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
                }
                for (var k in o) {
                    if (new RegExp("(" + k + ")").test(format)) {
                        format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                    : ("00" + o[k]).substr(("" + o[k]).length));
                    }
                }
                return format;
            }
            if (!value) return "";
            // /Date(1328423451489)/
            if (typeof (value) == "string" && /^\/Date/.test(value)) {
                value = value.replace(/^\//, "new ").replace(/\/$/, "");
                eval("value = " + value);
            }
            var date = new Date(Date.parse(value.replace(/-/g, "/")));
            if (date instanceof Date) {
                var format = column.format || this.options.dateFormat || "yyyy-MM-dd";
                return getFormatDate(date, format);
            }
            else {
                return value.toString();
            }
        }


        $.ligerDefaults.Grid.formatters['double'] = function (value, column) {

            if (!value) return "";
            return Convert2Decimal(value, column.format);
        }
    }
}())


/**
*@floatvar[float]
*@format[float]
*Convert2Decimal(1.3,0.00);
*/
function Convert2Decimal(floatvar, format) {
    var roundDigit = 2;
    if (format) {
        if (format.toString().indexOf('.') > 0) {
            var str = format.toString().substr(format.toString().indexOf('.') + 1);
            roundDigit = str.length;
        }
    }
    var f_x = parseFloat(floatvar);
    if (isNaN(f_x)) {
        alert('function:changeTwoDecimal->parameter error');
        return false;
    }
    var f_x = Math.round(f_x * 100) / 100;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (roundDigit > 0) {
        if (pos_decimal < 0) {
            pos_decimal = s_x.length;
            s_x += '.';
        }
        while (s_x.length <= pos_decimal + roundDigit) {
            s_x += '0';
        }
    }
    return s_x;
}


/**
*@height:窗口的高度
*@url:窗口的高度
*@title:窗口的高度标题
*/
function ligerWin(width, height, url, title, close) {
    /*
         $.ligerWindow.show({
             modal: true, showMin: false, showToggle: false,
             width: width,
             height: height,
             url: url,
             showMax: true,
             isHidden: false,
             allowClose: true,
             isResize: true,
             slide: false,
             title: title
         });
    */
    currDialog = art.dialog.open(url, {
        'title': title,
        'width': width,
        'height': height,
        'lock': true,
        'background': '#333333',
        'opacity': 0,
        close: function () {
            if (close != undefined) {
                close();
            }
        }
    }).lock();
}

function ligerConfirm(lk) {
    if (liger) {
        $.ligerDialog.confirm('确定删除当前项吗', function (yes) {
            if (yes) {
                var chls = lk.children;
                for (var ch in chls) {
                    if (chls[ch].nodeName && chls[ch].nodeType == 1) {
                        chls[ch].click();
                    }
                }
            }

        });
        return false;
    } else alert("请页面引用ligerui.js在刷新页面");

}



/**
 * 短暂提示
 * @param	{String}	提示内容
 * @ok	{function}	关闭执行回调函数
 */
; (function (w) {
    if (w.artDialog != undefined) {
        artDialog.MyTips = function (content, ok) {
            return artDialog({
                id: 'Tips',
                title: false,
                cancel: false,
                fixed: true,
                lock: false,
                close: function (here) {
                    return ok.call(this, here);
                }
            })
            .content('<div style="padding: 0 1em;">' + content + '</div>')
            .time(1.5);
        };
    }
}(window));


function showTips(msg, url) {
    //art.dialog.tips('提交成功！', 1.5);

    art.dialog.MyTips(msg, function () {
        setTimeout(function () { art.dialog.open.api.close(); }, 1.5);
        //location.href = url; 
    });
}


function starLoading() {
    var _load = "<div id='loading-mask' style='position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; background: #D2E0F2; z-index: 20000'>";
    _load += "<div id='pageloading' style='position: absolute; top: 50%; left: 50%; margin: -120px 0px 0px -120px; text-align: center; border: 2px solid #8DB2E3; width: 200px; height: 40px; font-size: 14px; padding: 10px; font-weight: bold; background: #fff; color: #15428B;'>";
    _load += "<img src='/Content/css/images/LOADING.gif' align='absmiddle' />";
    _load += "网络加载中,请稍候...";
    _load += "</div>";
    _load += "</div>";
    document.write(_load);
}

function endLoading() {
    var _load = document.getElementById('loading-mask');
    if (_load)
        _load.parentNode.removeChild(_load);

}

function createXMLHTTPRequest() {
    //1.创建XMLHttpRequest对象     
    //这是XMLHttpReuquest对象无部使用中最复杂的一步     
    //需要针对IE和其他类型的浏览器建立这个对象的不同方式写不同的代码     
    var xmlHttpRequest;
    if (window.XMLHttpRequest) {
        //针对FireFox，Mozillar，Opera，Safari，IE7，IE8     
        xmlHttpRequest = new XMLHttpRequest();
        //针对某些特定版本的mozillar浏览器的BUG进行修正     
        if (xmlHttpRequest.overrideMimeType) {
            xmlHttpRequest.overrideMimeType("text/xml");
        }
    } else if (window.ActiveXObject) {
        //针对IE6，IE5.5，IE5     
        //两个可以用于创建XMLHTTPRequest对象的控件名称，保存在一个js的数组中     
        //排在前面的版本较新     
        var activexName = ["MSXML2.XMLHTTP", "Microsoft.XMLHTTP"];
        for (var i = 0; i < activexName.length; i++) {
            try {
                //取出一个控件名进行创建，如果创建成功就终止循环     
                //如果创建失败，回抛出异常，然后可以继续循环，继续尝试创建     
                xmlHttpRequest = new ActiveXObject(activexName[i]);
                if (xmlHttpRequest) {
                    break;
                }
            } catch (e) {
            }
        }
    }
    return xmlHttpRequest;
}

function JsonAjax(url, method, callback) {
    var req = createXMLHTTPRequest();
    if (req) {
        if (method.toLocaleString() == "post") {
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8;");
        }
        req.open(method, url, true);
        req.onreadystatechange = function () {
            if (req.readyState == 4) {
                if (req.status == 200) {
                    var response = req.response;
                    try {
                        response = eval("(" + req.response + ")")
                    } catch (e) {

                    }
                    callback.call(this, response);
                } else {
                    alert("error");
                }
            }
        }
        req.send(null);
    }
}





Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, //month
        "d+": this.getDate(), //day
        "h+": this.getHours(), //hour
        "m+": this.getMinutes(), //minute
        "s+": this.getSeconds(), //second
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
        "S": this.getMilliseconds() //millisecond
    }
    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
    (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(format))
        format = format.replace(RegExp.$1,
        RegExp.$1.length == 1 ? o[k] :
        ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}

Convert2Date = function (str, format) {
    var date = new Date(str.replace(/-/g, "/"));
    return date.format(format);
}




Date.prototype.format = function (format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                   ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
}

/** add by songxiaoliang start **/

/** 在iframe中打开对话框 **/
function openDialogInIframe(width, height, url, title, close, grid) {
	var artDatas = {};
	art.dialog.data('artDatas', artDatas);
	artDatas.grid = grid;
	artDatas.iframeDialog = art.dialog.open(url, {
        'title': title,
        'width': width,
        'height': height,
        'lock': true,
        'background': '#333333',
        'opacity': 0,
        close:function(){
        	if(close){
        		close();
        	}
        },
    }).lock();
    
}
/** 关闭iframe对话框 **/
function closeDialogInIframe(){
	art.dialog.data('artDatas').iframeDialog.close();
}

var currDialogInDiv = null;
/** 在div中打开对话框 **/
function openDialogInDiv(_content, _ok, width, height){
	var _width = width ? width : 300;
	var _height = height ? height : 80;
	currDialogInDiv = art.dialog({
						width: _width,
						height: _height,
					    title: '信息提示',
					    content: _content,
					    ok: _ok,
					    cancel:false,
					    drag: false,
    					resize: false
					});
}
/** 关闭div对话框 **/
function closeDialogInDivF(){
	currDialogInDiv.close();
	art.dialog.close();
}
/** 关闭div对话框 **/
function closeDialogInDiv(){
	currDialogInDiv.close();
}
/**
 * ajax方式提交表单
 * 
 * @param formObj Jquery的单表对象，例如：$('#form1')
 * @param callback 回调函数名称
 * @return
 */
function ajaxSubmitForm(formObj, callback) {
	var ajaxOptions = {
		beforeSubmit : function(){
			//残废所有按钮
			setButtonDisabled(true);
			//打开“覆盖层”
			openBlock();
		},
        dataType: 'json',
        returnType:'json',
		success : function(jsonData) {
			//关闭“覆盖层”
			closeBlock();
			//后台操作成功
			if(jsonData.success && jsonData.success == true){
				openDialogInDiv(
					'操作成功！',
					function(){
						if(callback){
							callback(jsonData);
						}
					});
			}
			//后台操作失败
			else{
				setButtonDisabled(false);
				openDialogInDiv('操作失败，失败原因：'+jsonData.message,function(){});
			}
		},
		error : function(XMLResponse) {
			openDialogInDiv(XMLResponse.responseText);
		}
	};

	formObj.ajaxSubmit(ajaxOptions);
}
/** 默认表单提交回调函数，成功后刷新父页查询列表，并关闭对话框 **/
function ajaxSubmitFormDefCallback() {
	reloadParentGrid();	//关闭dialog前刷新
	closeDialogInIframe();
}
/** ajax url 提交 **/
function ajaxSubmit(url, data, callback){
	$.ajax({
		beforeSubmit : function(){
			//残废所有按钮
//			setButtonDisabled(true);
			//打开“覆盖层”
			openBlock();
		},
	    type: "post",
	    url: url,
	    data: data,
	    dataType: "json",
	    returnType:"json",
	    error : function(XMLResponse) {
			openDialogInDiv(XMLResponse.responseText);
		},
	    success : function(jsonData) {
	    	//关闭“覆盖层”
			closeBlock();
	    	if(callback){
	    		callback(jsonData);
	    		return;
	    	}
			//后台操作成功
			if(jsonData.success && jsonData.success == true){
				openDialogInDiv(
					'操作成功！',
					function(){
					});
			}
			//后台操作失败
			else{
//				setButtonDisabled(false);
				openDialogInDiv('操作失败，失败原因：'+jsonData.message,function(){});
			}
		}
	});
}
/** 删除 **/
function ajaxDelete(url, data){
	ajaxConfirmOperation('确定删除',url,data);
}
/** ajax Confirm 操作  **/
function ajaxConfirmOperation(tips,url, data){
	art.dialog.confirm(
			tips, 
			function (yes) { 
				$.ajax({
					type: "post",
					url: url,
					data: data,
					dataType: "json",
					returnType:"json",
					error : function(XMLResponse) {
						openDialogInDiv(XMLResponse.responseText);
					},
					success : function(jsonData) {
						//后台操作成功
						if(jsonData.success && jsonData.success == true){
							art.dialog.tips('操作成功！',1);
							setTimeout(function () {
								reloadGrid();
							},500);
						}
						//后台操作失败
						else{
							setButtonDisabled(false);
							openDialogInDiv('操作失败：'+jsonData.message,function(){});
						}
					}
				});
			}
	);
}

/**
 * 设置页面中所有Button的有效性
 * @param flag true or false
 */
function setButtonDisabled(flag){
	$('input[type=button]').attr('disabled', flag);
	$('input[type=submit]').attr('disabled', flag);
	$('input[type=reset]').attr('disabled', flag);
	$('button').attr('disabled', flag);
}

/**
 * 添加一个层，用于覆盖整个用户操作区域，阻止操作
 */
function openBlock(message) {
	message = message || '<br/>&nbsp;&nbsp;&nbsp;正在处理中，请稍候。。。';
	message = "<span class='loading'>" + message + "</span>";
	$.blockUI({
		message : message,
		css : {
			width : '300px',
			height : '85px'
			// ,padding: '5px'
			// ,color:'#fff'
			// ,border:'1px solider #aaa'
			// ,backgroundColor:'#000'
			,
			'-webkit-border-radius' : '10px',
			'-moz-border-radius' : '10px',
			opacity : .8
		},
		overlayCSS : {
			opacity : '0.2'
		}
	});
}
/**
 * 隐藏层
 */
function closeBlock() {
	$.unblockUI();
}
/** 重新加载当前页列表 **/
function reloadGrid(){
	grid.reload();
}
/** 重新加载父页列表 **/
function reloadParentGrid(){
//	alert(parent.$('title').text());
	try{
		art.dialog.data('artDatas').grid.reload();
	}catch(e){
	}
}
String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {  
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {  
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);  
    } else {  
        return this.replace(reallyDo, replaceWith);  
    }  
};
/** 对话框详情 **/
function showDetailByDialog(url, title, width, height){
	width = width ? width : 660;
	height = height ? height : 360;
	art.dialog.open(url, { title: title, background: '#FFFFFF', opacity: 0, width: width, height: height, lock: true }, false);
}
/** tab页详情 **/
function showDetailByParentTab(url, title, tabId){
	parent.f_addTab(tabId, title,  url);	
}
/** add by songxiaoliang end **/
