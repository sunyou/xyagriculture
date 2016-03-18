<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>司机管理</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script src="${ctx}/content/js/jquery.form.js"></script>
    <script src="${ctx}/content/js/plugins/jquery.form.js"></script>
    <script src="${ctx}/content/js/LigerUI/json2.js"></script>
    <script src="${ctx}/content/js/plugins/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        var type = GetQueryString("type");
        var grid = grid || {};
        $(document).ready(function () {
            if (type == null || type == undefined) {
                type = "all";
            }
            $('#layout').ligerLayout({ topHeight: 30, allowTopResize: false });

            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '姓名', width: '120', name: 'Name',render:showDetail },
                    {
                        display: '性别', name: 'Sex', render: function (rowdata, index, value) {
                            if (value == '1')
                                return "男";
                            else
                                return "女";
                        }
                    },
                    { display: '年龄', name: 'Age' , width: '80'},
                    { display: '驾龄', align: 'center', width: '80', name: 'DriveAge', render: function (rowdata, index, value) { return value + "年" } },
                    { display: '联系电话', name: 'Tel', width: '120' },
                    { display: 'QQ', name: 'QQ' , width: '120'},
                    { display: '邮箱', width: '160', name: 'Email' },
                    { display: '详细地址', name: 'Addre', width: '220' },
                    {
                        display: '操作', align: 'center', render: function (rowdata, index, value) {
                        var html="<a href='javascript:;'  class='ligerBtnEdit' onclick=\"GetModel(\'" + rowdata['DRIVEID'] + "\');\">修改</a>&nbsp;&nbsp;" +
                                "<a href='javascript:;'  class='ligerBtnEdit' onclick=\"DeleModel(\'" + rowdata['DRIVEID'] + "\');\">删除</a>";
                            return html;
                        }
                    }
                ],
                param: { 'flag': 1, 'type': type },
                editor: {
                    width: 890,
                    height: 460
                },
                leftBtns: {
                    show: false
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "DRIVEID",
                ajaxURL: "${ctx}/PostMap/getIgDriverList.ajax"
            });

            $('#btn_Add').click(function () {
                $('#btn_save').show();
                $('#btn_Update').hide();
                art.dialog({
                    id: "efij",
                    title: '添加司机',
                    lock: true,
                    opacity: 0.42,	// 透明度
                    width: 660,
                    height: 360,
                    content: "<form id='uploadForm'><input type='file' name='file_upload' id='file_upload'></form><form id='form_efij' name='form_efij'>" + $('#form1').html() + "</form>",
                    init: function () {
                    $('#form_efij #drivimg').attr("src", '${ctx}/content/images/blank.gif');
                        $("#file_upload").uploadify({
                            swf: '${ctx}/content/js/plugins/uploadify.swf',
                            
                            uploader: '${ctx}/file/upload.ajax',           // 服务器端处理地址
                            method: 'POST',
                            buttonImage: "${ctx}/content/js/plugins/chanage.gif",
                            buttonCursor: 'hand',
                            buttonClass: "jhrz_swfupload",
                            buttonText: '',
                            width: 65,
                            height: 27,
                            fileTypeExts: "*.jpg;*.jpeg;*.gif;*.png",             // 扩展名
                            fileTypeDesc: "请选择 jpg png 文件",     // 文件说明
                            fileObjName: 'file',            // 上传参数名称
                            queueID: 'efjkl',
                            auto: true,
                            onFallback: function () {
                                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                            },
                            onSelect: function (file) {
                                $('#file_upload').show();
                            },
                            onSelectError: function (file, errorCode, errorMsg) {
                                alert(" 上传失败" + errorMsg);
                            },
                            onUploadStart: function (file) {
                                MyLoading(true);
                            },
                            onUploadSuccess: function (file, data, response) {
                            	var dataObj = JSON.parse(data);
                                MyLoading(false);
                                if(dataObj.success){
                                	$('#drivimg').attr("src", "${ctx}/"+dataObj.savePath);
                                    $("#form_efij").find("input[name='photo']").val("/"+dataObj.savePath);
                                }
                            }
                        });

                    },
                    cancelVal: '关闭',
                    cancel: true,//为true等价于function(){}
                    button: [{
                        name: '添加并保存',
                        callback: function () {
                            if (!checkForm(form_efij)) {
                                return false;
                            }
                            MyLoading(true);
                            $.ajax({
                                type: "post",
                                url: "${ctx}/PostMap/SaveDriver.ajax",
                                data: $("#form_efij").serialize(),
                                success: function (msg) {
                                	 MyLoading(false);
                                     if (msg.success) {
                                         art.dialog.MyTips(msg.message, function () {
                                             art.dialog.list["efij"].close();
                                             grid.reload();
                                         })
                                     }else{
                                    	  art.dialog.MyTips(msg.message,function(){})
                                     }
                                }
                            });
                            return false;
                        },
                        focus: true
                    }]
                });

            });
            
            
            $("#btn_Search").click(function () {
                grid.setParm("driverName", $("#driverName").val());
                grid.reload()
            });
            
            
        });


        function GetModel(id) {
        	$.ajax({
                type: "post",
                url: "${ctx}/PostMap/getIgDriverById.ajax",
                data: {id:id},
                success: function (msg) {
                	if(msg.success){
                		MyLoading(false);
                		art.dialog({
                            id: "efij",
                            title: '修改司机',
                            lock: true,
                            opacity: 0.42,	// 透明度
                            width: 660,
                            height: 360,
                            content: "<form id='uploadForm'><input type='file' name='file_upload' id='file_upload'></form><form id='form_efij' name='form_efij'>" + $('#form1').html() + "</form>",
                            init: function () {
                               var _model = JSON.parse(msg.data);
                                $('#form_efij').form('load', _model);
                                if (_model['photo'] != null)
                                    $('#form_efij #drivimg').attr("src", "${ctx}/" + _model['photo']);
                                else
                                    $('#form_efij #drivimg').attr("src", '${ctx}/content/images/blank.gif');
                                $("#file_upload").uploadify({
                                    swf: '${ctx}/content/js/plugins/uploadify.swf',
                                    uploader: '${ctx}/file/upload.ajax',           // 服务器端处理地址
                                    method: 'POST',
                                    buttonImage: "${ctx}/content/js/plugins/chanage.gif",
                                    buttonCursor: 'hand',
                                    buttonClass: "jhrz_swfupload",
                                    buttonText: '',
                                    width: 65,
                                    height: 27,
                                    fileTypeExts: "*.jpg;*.jpeg;*.gif;*.png",             // 扩展名
                                    fileTypeDesc: "请选择 jpg png 文件",     // 文件说明
                                    fileObjName: 'file',            // 上传参数名称
                                    queueID: 'efjkl',
                                    auto: true,
                                    onFallback: function () {
                                        alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                                    },
                                    onSelect: function (file) {
                                        $('#file_upload').show();
                                    },
                                    onSelectError: function (file, errorCode, errorMsg) {
                                        alert(" 上传失败" + errorMsg);
                                    },
                                    onUploadStart: function (file) {
                                        MyLoading(true);
                                    },
                                    onUploadSuccess: function (file, data, response) {
                                    	var dataObj = JSON.parse(data);
                                        MyLoading(false);
                                        if(dataObj.success){
                                        	$('#drivimg').attr("src", "${ctx}/"+dataObj.savePath);
                                            $("#form_efij").find("input[name='photo']").val("/"+dataObj.savePath);
                                        }
                                    }
                                });

                            },
                            cancelVal: '关闭',
                            cancel: true,//为true等价于function(){}
                            button: [{
                                name: '修改并保存',
                                callback: function () {
                                    if (!checkForm(form_efij)) {
                                        return false;
                                    }
                                    MyLoading(true);
                                    $.ajax({
                                        type: "post",
                                        url: "${ctx}/PostMap/SaveDriver.ajax",
                                        data: $("#form_efij").serialize(),
                                        success: function (msg) {
                                        	 MyLoading(false);
                                             if (msg.success) {
                                                 art.dialog.MyTips(msg.message, function () {
                                                     art.dialog.list["efij"].close();
                                                     grid.reload();
                                                 })
                                             }else{
                                            	  art.dialog.MyTips(msg.message,function(){ })
                                             }
                                        }
                                    });
                                    return false;
                                },
                                focus: true
                            }]
                        });
                	}
                }
            });
        }
        function DeleModel(id) {
            art.dialog.confirm('确定删除当前驾驶员吗？', function () {
                MyLoading(true);
                $.ajax({
                    type: "post",
                    url: "${ctx}/PostMap/delIgDriverById.ajax",
                    data: {id: id},
                    success: function (msg) {
                    	MyLoading(false);
                        if (msg.success) {
                            art.dialog.MyTips(msg.message, function () {
                                grid.reload();
                            })
                        }
                    }
                });
            });
        }
        function checkForm(form) {
            if (form.name.value == '') {
                art.dialog.alert('请输入司机姓名', function () { form.name.focus(); })
                return false;
            }
            else if (form.tel.value == '') {
                art.dialog.alert('请输入您的联系电话', function () { form.tel.focus(); })
                return false;
            } else
                return true;

        }
        function showDetail(rowdata, index, value) {
			var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoshow('"
					+ rowdata["DRIVEID"]
					+ "','"
					+ value
					+ "');\">" + value + "</a>";
			return html;
		}

		function gotoshow(driveid, name) {
		   myopen("${ctx}/PostMap/DriverDet.html?type=3&id="+driveid,"司机 " + name + " 的详情"  ,660,360);
					}
        
    </script>
</head>
<body>

    <!-- 列表-->
    <div id="layout">
        <div position="top">
            <div class="rtittab">
                <div class="rtitbg2">
                	<div class="rtxt left">司机姓名：</div>
					<div class="sert left">
						<input type="text" name="driverName" id="driverName" class="serchInput" />
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
        <div position="center">
            <div id="grid"></div>
        </div>
    </div>



    <!-- 编辑修改-->
    <div id="dialog_win" style="display: none; visibility: hidden;">
        <form id="form1">
            <input type="hidden" name="driveid" value="" />
              
            <dl class="row_item">
                <dt width="">司机姓名:</dt>
                <dd>
                    <input type="text" name="name" value="" class="inw" style="width: 90px;" /></dd>
                <dd class="errMsg"></dd>
               <dd class="DriverPicPrev" style="margin-left: 210px;">
                    <div class="DriverPic">
                        <img style="border: 1px;"id="drivimg" class="drivimg" src="${ctx}/content/images/blank.gif" width="128" height="135" />
                        <input type="hidden" name="photo" value="" class="inw" />
                    </div>
                </dd>
           
            </dl>
             <dl class="row_item">
             <dt >司机性别:</dt>
                <dd>
                    <input  type="radio" name="sex" value="1" checked="checked" id="radio1" /><label for="radio1">男</label>
                    <input  type="radio" name="sex" value="0" id="radio2" /><label for="radio2">女</label></dd>
                <dd class="errMsg"></dd>
                </dl>
            <dl class="row_item">
                <dt>司机年龄:</dt>
                <dd>
                    <select class="inw" name="age" style="width: 90px;">
                        <% for(int i = 18; i<=65 ;i++){
								if(i==18){
									out.print("<option value="+i+" selected=\"selected\">"+i+"</option>");
								}else{
									out.print("<option value="+i+">"+i+"</option>");
								}
                           }
                        %>
                    </select>岁
                </dd>
                <dd class="errMsg"></dd>
               
            </dl>
             <dl class="row_item">
               <dt >司机驾龄:</dt>
                <dd>
                    <select class="inw" name="driveage" style="width: 90px;">
                        <% for(int i = 1; i<=40 ;i++){
								if(i==1){
									out.print("<option value="+i+" selected=\"selected\">"+i+"</option>");
								}else{
									out.print("<option value="+i+">"+i+"</option>");
								}
                           }
                        %>
                    </select>年
                </dd>
                <dd class="errMsg"></dd>
              </dl>
            <dl class="row_item">
                <dt>联系电话:</dt>
                <dd>
                    <input type="text" name="tel" value="" class="inw" /></dd>
                <dd class="errMsg"></dd>
            
                <dt style="margin-left: 10px">联系QQ:</dt>
                <dd>
                    <input type="text" name="qq" value="" class="inw" /></dd>
                <dd class="errMsg"></dd>
            </dl>
            <dl class="row_item">
                <dt>联系Email:</dt>
                <dd>
                    <input type="text" name="email" value="" class="inw" /></dd>
                <dd class="errMsg"></dd>
           
                <dt style="margin-left: 10px">联系地址:</dt>
                <dd>
                    <input type="text" name="addre" value="" class="inw" /></dd>
                <dd class="errMsg"></dd>
            </dl>
            <dl class="row_item">
                <dt>备注:</dt>
                <dd>
                    <input type="text" name="remark" value="" class="inw" style="width: 440px;"/></dd>
                <dd class="errMsg"></dd>
            </dl>
            
        </form>
    </div>
</body>
</html>
