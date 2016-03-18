<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>发货管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script src="${ctx}/content/js/jquery.form.js"></script>
    <script src="${ctx}/content/js/plugins/jquery.form.js"></script>
    <script src="${ctx}/content/js/LigerUI/json2.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    
    <script type="text/javascript">
        var type = GetQueryString("type");
        var grid = grid || {}, grid2 = grid2 || {};
        $(document).ready(function () {
            if (type == null || type == undefined) {
                type = "all";
            }

			//$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            $("input[name='Amount']").ligerSpinner({ height: 28, type: 'int', minValue: 1, maxValue: 10000, isNegative: false });

            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '发货编号', frozen : true, width: '120', name: 'DeliverNo', render: function (rowdata, index, value){
                    	return  "<a href='javascript:;'  class='ligerBtnEdit' onclick=\"GetDetailList(" + rowdata['DELIVERID'] + ");\">"+ rowdata['DELIVERNO'] +"</a>";
                    	} 
                    },
                    { display: '发货日期', width: '120', name: 'DelDate' },
                    {
                        display: '发货量', width: '120', name: 'DelAmount', render: function (rowdata, index, value) {
                            return "<font color=\'red\'>" + value + "</font> KG"
                        }
                    },
                    { display: '发货地', width: '120', name: 'DelAdd' },
                    { display: '目的地', width: '120', name: 'RecAdd' },
                    { display: '司机', width: '120', name: 'Name' },
                    { display: '车牌号', width: '120', name: 'CarNo' },
                    { display: '收货人', width: '120', name: 'Reciver' },
                    {
	                    display: '运输轨迹',align:'center', render: function (rowdata, index, value) {
	                    	return "<a href='javascript:;' class='ligerBtnEdit' onclick='showCardHisPostion(\""
							+ rowdata['DELIVERNO'] + "\",\"车牌号：" 
							+ rowdata['CARNO'] + "\")'>查看运输轨迹</a>";
	                        return "<a class='ligerBtnEdit' href='${ctx}/PostMap/IG_Tran.html?no=" + rowdata['DELIVERNO'] + " ' target='_blank'>运输轨迹</a>";
	                    }
	                },

	                {
                        display: '发货状态', name: 'DelState', width: '120', render: function (rowdata, index, value) {
                            if (value == '1')
                                return "<img src='${ctx}/images/trak_32x20.png' style='float:left;' /><marquee direction='right' style='float:left;display:inline-block;width:60px;'>.....<marquee>";
                            if (value == '2')
                                return "<font color=\'green\'>已收货</font>";
                            else
                                return "其他";
                        }
                    },
	                {
	                    display: '操作', width: '120', align: 'center', render: function (rowdata, index, value) {
	                        return "<input type='button'  class='rowEditButton' onclick=\"GetModel('" + rowdata['DELIVERID'] + "')\" value='修改' ></button>&nbsp;&nbsp;" +
	                           // "<a href='javascript:;'  class='ligerBtnEdit' onclick=\"GetDetailList(" + rowdata['DELIVERID'] + ");\">查看详细</a>&nbsp;&nbsp;" +
	                        "<a href='javascript:;'  class='rowDeleteButton' onclick=\"deleteDetail('" + rowdata['DELIVERID'] + "');\">删除</a>";
	                    }
	                }
                ],
                param: { 'flag': 1, 'type': type ,"DelState": $(".rtittab select[name=DelState]").val()},
                editor: {
                    width: 890,
                    height: 460
                },
                leftBtns: {
                	show:false
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "DELIVERID",
                ajaxURL: "${ctx}/PostMap/getIgDeliverList.ajax"
            });

            $('#btn_Add').click(function () {
                $('#btn_save').show();
                $('#btn_Update').hide();
                art.dialog({
                    id: "efij",
                    title: '添加发货',
                    lock: true,
                    opacity: 0.42,	// 透明度
                    width: 680,
                    height: 360,
                    content: "<div id='Deliver_win'>" + $('#dialog_win').html() + "</div>",
                    cancelVal: '关闭',
                    cancel: true,//为true等价于function(){}
                    button: [{
                        name: '添加并保存',
                        callback: function () {
                            var details = [];
                            $.each($('#itemRows tr'), function (n, row) {
                                if ($(this).find("input[name='goodsid']").val() != '')
                                    details.push({ 'goodsid': $(this).find("input[name='goodsid']").val(), 'amount': $(this).find("input[name='amount']").val(), 'remark': $(this).find("input[name='remark']").val() });
                            });
                            if ($('#Deliver_win input[name=deldate]').val() == '') {
                                art.dialog.alert('请选择发货日期！', function () { $('#Deliver_win input[name=\'deldate\']').focus(); WdatePicker({ el: 'deldate' }) });
                                return false;
                            }
                            if ($('#Deliver_win input[name=deladd]').val() == '') {
                                art.dialog.alert('请填写发货地点！', function () { $('#Deliver_win input[name=deladd]').focus(); });
                                return false;
                            }
                            if ($('#Deliver_win input[name=recadd]').val() == '') {
                                art.dialog.alert('请填写收货地点！', function () { $('#Deliver_win input[name=recadd]').focus(); });
                                return false;
                            }
                            if ($('#Deliver_win input[name=carno]').val() == '') {
                                art.dialog.alert('请选择车辆！', function () { $('#Deliver_win input[name=carno]').focus(); });
                                return false;
                            }
                            if ($('#Deliver_win input[name=name]').val() == '') {
                                art.dialog.alert('请选择司机！', function () { $('#Deliver_win input[name=name]').focus(); });
                                return false;
                            }

                            if (details.length == 0) {
                                art.dialog.alert('请选择一种作物！', function () { });
                                return false;
                            }
                            $.ajax({
                                type: "post",
                                url: "${ctx}/PostMap/SaveDeliverAndDetail.ajax",
                                data: { "deliver": JSON.stringify($('#form1').serializeJson()), "detail": JSON.stringify(details) },
                                success: function (msg) {
                                	 MyLoading(false);
                                	 if (msg.success) {
                                         art.dialog.MyTips('保存成功', function () {
                                             art.dialog.list["efij"].close();
                                             grid.reload();
                                         })
                                     } else {
                                         art.dialog.alert(msg.message);
                                     }
                                }
                            });
                           	MyLoading(true);
                            return false;
                        },
                        focus: true
                    }]
                });

            });

            $('#btn_Search').click(function () {
                grid.setParm("CarNo", $(".rtittab input[name=CarNo]").val());
                grid.setParm("DriveNo", $(".rtittab input[name=DriveNo]").val());
                grid.setParm("DeliverNo", $(".rtittab input[name=DeliverNo]").val());
                grid.setParm("DelState", $(".rtittab select[name=DelState]").val());
                grid.reload()
            });
        });

        function GetModel(id) {
            MyLoading(true);
            $.ajax({
                type: "post",
                url: "${ctx}/PostMap/getVIgDeliverById.ajax",
                data: {id: id},
                success: function (msg) {
                	MyLoading(false);
                    if (msg.success) {
                        $('#btn_Update').show();
                        $('#btn_save').hide();
                        art.dialog({
                            id: "efij",
                            title: '修改订单',
                            lock: true,
                            opacity: 0.42,	// 透明度
                            width: 680,
                            height: 360,
                            content: "<form id='form_efij'>" + $('#form1').html() + "</form>",
                            init: function () {
                                var _model = JSON.parse(msg.data);
                                $('#form_efij').form('load', _model);
                                $('#form_efij #deldate').val(new Date(_model['deldate']).format('yyyy-MM-dd'));
                            },
                            cancelVal: '关闭',
                            cancel: true,//为true等价于function(){}
                            button: [{
                                name: '修改并保存',
                                callback: function () {
                                    MyLoading(true);
                                    $.ajax({
                                        type: "post",
                                        url: "${ctx}/PostMap/SaveIgDeliver.ajax",
                                        data: $("#form_efij").serialize(),
                                        success: function (msg) {
                                        	 MyLoading(false);
                                             if (msg.success) {
                                                 art.dialog.MyTips('数据保存成功', function () {
                                                     art.dialog.list["efij"].close();
                                                     grid.reload();
                                                 })
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

        function deleteDetail(id) {
            art.dialog.confirm('确定删除当前发货吗！', function () {
            	 $.ajax({
                     type: "post",
                     url: "${ctx}/PostMap/delIgDeliverById.ajax",
                     data: {id: id},
                     success: function (msg) {
                         MyLoading(false);
                         if (msg.success) {
                             art.dialog.MyTips('数据更新成功', function () {
                                 grid.reload();
                             })
                         }else{
                        	 art.dialog.alert(msg.message);
                         }
                     }
                 });
            	
            });
        }

        function GetDetailList(id) {
            art.dialog({
                id: "gkjlak",
                title: '订单详情',
                lock: true,
                opacity: 0.42,	// 透明度
                width: 660,
                height: 360,
                content: "<input type='button' value='补发产品' onclick='addDetail(" + id + ");' class='btn_tool_add' /><div id='grid2'></div>",
                init: function () {
                    grid2 = $("#grid2").createLigerGrid({
                        header: [
                            {
                                display: '修改', width: '80', render: function (rowdata, index, value) {
                                    return "<input type='button' class='rowEditButton' onclick=\"GetDetail(" + rowdata['DETAILID'] + ")\" value='修改'></input>";
                                }
                            },
                            { display: '作物隶属合作社', width: '200', name: 'CoFarmer_Name' },
                            { display: '作物名称', width: '120', name: 'Goods_Name' },
                            {
                                display: '数量', width: '100', name: 'Amount', render: function (rowdata, index, value) {
                                    return value + " KG";
                                }
                            }
                        ],
                        width: 660,
                        height: 360,
                        editor: {
                            width: 660,
                            height: 360
                        },
                        leftBtns: {
                            show: false
                        },
                        onSelectRow: function (rowdata, rowid, rowobj) {
                        },
                        keyID: "DETAILID",
                        ajaxURL: "${ctx}/PostMap/getIgDelDetailList.ajax?id=" + id
                    });

                },
                cancelVal: '关闭',
                cancel: true,
            });
        }
        
        var dialogId = "";
        var formId = "";


        function GetDetail(id) {
        	dialogId = "efijjkl";
        	formId = "form_jhkl";
            MyLoading(true);
            $.ajax({
                type: "post",
                url: "${ctx}/PostMap/getIgDelDetailById.ajax",
                data: {id: id},
                success: function (msg) {
                    MyLoading(false);
                   	if (msg.success) {
                        art.dialog({
                            id: "efijjkl",
                            title: '修改订单详情',
                            lock: true,
                            opacity: 0.42,	// 透明度
                            width: 660,
                            height: 360,
                            content: "<form id='form_jhkl' name='form_jhkl'>" + $('#detail_win').html() + "</form>",
                            init: function () {
                                var _model = JSON.parse(msg.data);
                                $('#form_jhkl').form('load', _model);
                                $("#goodsid_jhkm").val(_model.goodsName)
                            }
                        });
                    }
                }
            });
        }
        
        function updateDetail() {
        	if(formId=="form_jhkl"){
        		if (form_jhkl.goods_name.value == '') {
                    art.dialog.alert('请选择一种作物！', function () { });
                    return false;
                }
        	}else if(formId=="form_detail"){
        		if (form_detail.goods_name.value == '') {
                    art.dialog.alert('请选择一种作物！', function () { });
                    return false;
                }
        	}
            MyLoading(true);
            $.ajax({
                type: "post",
                url: "${ctx}/PostMap/SaveIgDelDetail.ajax",
                data: $("#"+formId).serialize(),
                success: function (msg) {
                	MyLoading(false);
                    if (msg.success) {
                        art.dialog.MyTips('保存成功', function () {
                            art.dialog.list[dialogId].close();
                            grid.reload();
                            grid2.reload();
                        })
                    }
                }
            });
            return false;
        }

        function addDetail(DeliverID) {
        	dialogId = "gkjlakadd";
        	formId = "form_detail";
            art.dialog({
                id: "gkjlakadd",
                title: '新增产品',
                lock: true,
                opacity: 0.42,	// 透明度
                width: 660,
                height: 360,
                content: "<form id='form_detail' name='form_detail'>" + $('#detail_win').html() + "</form>",
                init: function () {
                    $("#form_detail input[name='detailid']").val(0);
                    $("#form_detail input[name='deliverid']").val(DeliverID);
                }
            });
        }

        var rowid = 1;
        function getRows() {
            rowid = rowid + 1;
            return rowid;
        }
        
        function getMaxId(ids){
        	var max = 0;
        	for(var i=1;i<ids.length;i++){
				if(max<ids[i])
					max=ids[i];
			}
        	return max;
        }

        function addRow() {
            var rs = getRows();
            var ids = [];
            $("#itemRows tr").each(function (i, id) {
                ids.push(parseInt($(id).attr('data-No')));

            });
            rs = getMaxId(ids) + 1;
            var tpl = $("#RowTemplete tbody").html();
            var temp = tpl.replace(/rowid/g, rs);
            $("#itemRows").append(temp);
        }

        function deleteRow(id) {
            art.dialog.confirm('确定删除当前行吗？', function () {
                $("#Row" + id).remove();
            })
        }
        
	//显示车辆轨迹
	function showCardHisPostion(deliverNo ,cardName ) {
			parent.f_addTab(deliverNo, cardName, '${ctx}/PostMap/IG_Tran.html?no='+deliverNo);		
	}
    </script>
</head>
<body>
    <!-- 列表-->
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">车牌号:</div>
					<div class="sert left">
						<input type="text" name="CarNo" class="serchInput" />
					</div>
					<div class="rtxt left">司机:</div>
					<div class="sert left">
						<input type="text" name="DriveNo" class="serchInput" />
					</div>
					<div class="rtxt left">发货编号:</div>
					<div class="sert left">
						<input type="text" name="DeliverNo" class="serchInput" />
					</div>
                    <div class="rtxt left">物流状态:</div>
                    <div class="sert left">
                        <select id="DelState" name="DelState">
                            <option value="" >所有</option>
                            <option value="1" selected>发货中</option>
                            <option value="2" >已收货</option>
                        </select>
                    </div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="搜索" class="btn_tool_search" />
					</div>
					<div class="serb left">
						<input id="btn_Add" type="button" value="发货" class="btn_tool_add" />
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
        	<input type="hidden" name="deliverid" value="" />
        	<div class="edit_panel">
        		<table class="edit_table" width="650px" border="0" cellpadding="0" cellspacing="0">
            	<tr>
            		<td width="15%"><div class="th_text">发货日期:</div></td>
                	<td width="35%">
                    	<input type="text" class="inw" id="deldate" name="deldate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });" readonly />
					</td>
            		<td width="15%"><div class="th_text">发货地:</div></td>
                	<td width="35%">
                    	<input type="text" class="inw" name="deladd" value="" />
                    </td>
            	</tr>
            	<tr>
            		<td><div class="th_text">选择车辆:</div></td>
                	<td>
						<input type="text" readonly id="carno_jhkm" name="carno" class="inw" />
                    	<input type="hidden" id="carid_jhk" name="carid" />
                    	<input type="button" value="选择" class='rowSelectButton' onclick="openHelper('${ctx}/PostMap//IG_Car_Helper.html', { id: 'carid_jhk,carno_jhkm', key: 'CARID,CARNO' }, '车辆--选择帮助界面', 660, 360);" />
					</td>
            		<td><div class="th_text">目的地:</div></td>
                	<td>
                    	<input type="text" class="inw" name="recadd" value="" />
                    </td>
            	</tr>
            	<tr>
            		<td><div class="th_text">承运司机:</div></td>
                	<td colspan="3">
						<input type="text" readonly id="name_jhkm" name="name" class="inw" />
                    	<input type="hidden" id="driverid_jhk" name="driverid" />
                    	<input type="button" value="选择" class='rowSelectButton' onclick="openHelper('${ctx}/PostMap/IG_Driver_Helper.html', { id: 'driverid_jhk,name_jhkm', key: 'DRIVEID,NAME' }, '承运司机--选择帮助界面', 660, 360);" />
					</td>
            		
            	</tr>
            </table>
        	</div>
        </form>
        <form id="form2">
            <table border="0" class="data_grid" style="float: left; width: 660px;">
                <thead>
                    <tr>
                        <th align="center">作物名称</th>
                        <th align="center">发货数量</th>
                        <th align="center">备注</th>
                        <th align="center">操作 </th>
                    </tr>
                </thead>
                <tbody id="itemRows">
                    <tr id="Row1" class="ClientTablerow" data-no="1">
                        <td>
                            <input type="text" readonly id="goodsidshow1"  class="inw"/>
                            <input type="hidden" id="goodsid1" name="goodsid" value="" />
                        	<input type="button" value="选择"  class='rowSelectButton' onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html?Result=1?Result=1', { id: 'goodsid1,goodsidshow1', key: 'GOODS_ID,GOODS_NAME' }, '已采收产品--选择帮助界面', 500, 400);" />
                        </td>
                        <td>
                            <input type="text" id="amount1" class="inw" name="amount" value="1" />KG
                        </td>
                        <td>
                            <input type="text" id="remark1" class="inw" name="remark" />
                        </td>
                        <td>
                            <input id="addRow_btn"  class='rowSelectButton'  type="button" value="添加一行" onclick="addRow();" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <table id="RowTemplete" style="display: none;">
        <tbody>
            <tr id="Rowrowid" class="ClientTablerow" data-no="rowid">
                <td>
                    <input type="text" class="inw" readonly id="goodsidshowrowid"  />
                    <input type="hidden" id="goodsidrowid" name="goodsid" value="" />
                	<input type="button" value="选择"  class='rowSelectButton'  onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html?Result=1', { id: 'goodsidrowid,goodsidshowrowid', key: 'GOODS_ID,GOODS_NAME' }, '已采收产品--选择帮助界面', 660, 360);" />
                </td>
                <td>
                    <input type="text" class="inw" id="amountrowid" name="amount" value="1" />KG
                </td>
                <td>
                    <input type="text" class="inw" id="remarkrowid" name="remark" />
                </td>
                <td>
                    <input type="button"  class='rowDeleteButton'  value="移除一行" onclick="deleteRow(rowid);" />
                </td>
            </tr>
        </tbody>
    </table>

    <!---编辑详情-->
    <div id="detail_win" class="data_grid"  style="display: none; visibility: hidden;">
    	<div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><div class="th_text">作物名称:</div></td>
					<td>
						<input type="text" readonly id="goodsid_jhkm" name="goods_name" class="inw" />
                    	<input type="hidden" id="goodsid_jhk" name="goodsid" />
                    	<input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html?Result=1', { id: 'goodsid_jhk,goodsid_jhkm', key: 'GOODS_ID,GOODS_NAME' }, '已采收产品--选择帮助界面', 660, 360);"/>
					</td>
				</tr>
				<tr>
					<td><div class="th_text">质量:</div></td>
					<td><input type="text" id="amount_jhk" name="amount" value="" class="inw" />KG</td>
				</tr>
				<tr>
					<td><div class="th_text">备注:</div></td>
					<td><input type="text" id="remark_jhk" name="remark" class="inw"/></td>
				</tr>
			</table>
			<input type="hidden" name="detailid" />
        	<input type="hidden" name="deliverid" />
			<div align=center>
				<br>
				<br> 
				<input type="button" name="btn_Save" value="提交" id="btn_Save" onclick="updateDetail();" class="xybtn" />&nbsp;&nbsp; 
				<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.list[dialogId].close();" class="cancelbtn" />
			</div>
		</div>
    </div>
</body>
</html>
