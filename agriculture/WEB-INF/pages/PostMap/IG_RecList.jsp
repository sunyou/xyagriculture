<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>收货管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
<link rel="Stylesheet" type="text/css"
	href="${ctx}/content/css/Custom.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
<link href="${ctx}/content/css/default.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
<script src="${ctx}/content/js/jquery.form.js"></script>
<script src="${ctx}/content/js/plugins/jquery.form.js"></script>
<script src="${ctx}/content/js/LigerUI/json2.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript"
	src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/content/js/public.js?v=2015081410080444"></script>
<script type="text/javascript">
	var type = GetQueryString("type");
	var grid = grid || {}, grid2 = grid2 || {};
	$(document).ready(function() {
		if (type == null || type == undefined) {
			type = "all";
		}

		grid = $("#grid").createLigerGrid({
		header : [
			{ display : '发货编号', frozen : true, width : '120', name : 'DeliverNo',
				render : function(rowdata, index,value) {
					return "<a href='javascript:;'  class='ligerBtnEdit' onclick=\"GetDetailList('" + rowdata['DELIVERID']+ "');\">"+ rowdata['DELIVERNO'] + "</a>";
				}
			},
			{ display : '发货日期', width : '120', name : 'DelDate' },
			{ display : '发货量', width : '120', name : 'DelAmount',
				render : function( rowdata, index, value) {
					return '<font color=\'red\'>' + value + "</font> KG"
				}
			},
			{ display : '发货地', width : '120', name : 'DelAdd' },
			{ display : '目的地', width : '120', name : 'RecAdd' },
			
			{ display : '司机', width : '120', name : 'Name' },
			{ display : '车牌号', width : '120', name : 'CarNo' },
			{ display : '收货人', width : '120', name : 'Reciver' },
			{ display : '运输轨迹', align : 'center',
				render : function( rowdata, index, value) {
					return "<a href='javascript:;' class='ligerBtnEdit' onclick='showCardHisPostion(\""
						+ rowdata['DELIVERNO'] + "\",\"车牌号：" 
						+ rowdata['CARNO'] + "\")'>查看运输轨迹</a>";
				}
			},
			{ display : '发货状态', name : 'DelState', width : '120',
				render : function( rowdata, index, value) {
					if (value == '1')
						return "<img src='${ctx}/images/trak_32x20.png' style='float:left;' /><marquee direction='right' style='float:left;display:inline-block;width:60px;'>.....<marquee>";
					if (value == '2')
						return "<font color=\'green\'>已收货</font>";
					else
						return "其他";
				}
			},
			
			{ display : '收货', width : '80', align : 'center',
				render : function( rowdata, index, value) {
					if (rowdata['DELSTATE'] == '2') {
						return '<span>完成收货</span>';
					} else
						return "<input type='button' value='我要收货' class='rowEditButton'  onclick='RecProdut(\"" + rowdata['DELIVERID'] + "\")' />";
				}
			}
			],
			param : {
				'flag' : 1,
				'type' : type,
				'DelState' : $(".rtittab select[name=DelState]").val()
			},
			editor : {
				width : 890,
				height : 460
			},
			leftBtns : {
				show : false
			},
			onSelectRow : function(rowdata, rowid, rowobj) {
			},
			keyID : "DELIVERID",
			ajaxURL : "${ctx}/PostMap/getIgDeliverList.ajax"
		});

		$('#btn_Search').click(function() {
			grid.setParm("CarNo",$(".rtittab input[name=CarNo]").val());
			grid.setParm("DriveNo",$(".rtittab input[name=DriveNo]").val());
			grid.setParm("DeliverNo",$(".rtittab input[name=DeliverNo]").val());
			grid.setParm("DelState",$(".rtittab select[name=DelState]").val());
			grid.reload()
		});
	});
	
	//显示车辆轨迹
	function showCardHisPostion(deliverNo ,cardName ) {
			parent.f_addTab(deliverNo, cardName, '${ctx}/PostMap/IG_Tran.html?no='+deliverNo);		
	}

	function GetDetailList(id) {
		art.dialog({
			id : "gkjlak",
			title : '订单详情',
			lock : true,
			opacity : 0.42, // 透明度
			width : 660,
			height : 360,
			content : "<div id='grid2'></div>",
			init : function() {
				grid2 = $("#grid2").createLigerGrid({
					header : [
					{ display : '作物隶属合作社', width : '120', name : 'CoFarmer_Name' }, 
					{ display : '作物名称', width : '120', name : 'Goods_Name' }, 
					{ display : '数量', width : '60', name : 'Amount',
						render : function(rowdata, index, value) {
							return value + " KG";
						}
					} 
					],
					width : 660,
					height : 360,
					editor : {
						width : 660,
						height : 360
					},
					leftBtns : {
						show : false
					},
					onSelectRow : function(rowdata, rowid, rowobj) {
					},
					keyID : "DETAILID",
					ajaxURL : "${ctx}/PostMap/getIgDelDetailList.ajax?id=" + id
				});

			},
			cancelVal : '关闭',
			cancel : true,//为true等价于function(){}
		});
	}

	//确认收货
	function RecProdut(id) {
		$("#id").val(id)
		var input = [];
		art.dialog({
			id : 'qrsh',
			title : '确认收货吗？',
			fixed : true,
			lock : true,
			opacity : 0.42,
			width : 660,
			height : 360,
			content : "<form id='form_rec' name='form_rec'>" + $('#rec_edit').html() + "</form>",
			init : function() {
				input[0] = this.DOM.content.find('textarea')[0];
				input[1] = this.DOM.content.find('input')[0];
			}

		})
	}
	
	function submitRec(){
		var id = $("#id").val();
		var Remark = $("#rec_remark").val();
		var RecAmount = $("#rec_RecAmount").val();
		if(isNaN(RecAmount)){
			art.dialog.MyTips('请输入正确的收货数量');
			$("#rec_RecAmount").focus()
			return false;
		}
		
		MyLoading(true);
		$.ajax({
            type: "post",
            url: "${ctx}/PostMap/SaveIgRec.ajax",
            data: {
    			'DeliverID' : id,
    			'Remark' : Remark,
    			'RecAmount' : RecAmount
    		},
            success: function (msg) {
                MyLoading(false);
               	if (msg.success) {
               		art.dialog.MyTips('保存成功', function() {
    					art.dialog.list["qrsh"].close();
    					grid.reload();
    				})
                }
            }
        });
		return false;
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
					<div class="rtxt left">物流编号:</div>
					<div class="sert left">
						<input type="text" name="DeliverNo" class="serchInput" />
					</div>
					<div class="rtxt left">物流状态:</div>
					<div class="sert left">
						<select id="DelState" name="DelState">
							<option value="">所有</option>
							<option value="1" selected>发货中</option>
							<option value="2">已收货</option>
						</select>
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="搜索"
							class="btn_tool_search" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="grid"></div>
		</div>
	</div>
	
	
	<input type="hidden" id="id" value="">
	<div id="rec_edit" style="display: none; visibility: hidden;">
		<div class="edit_panel">
			<table border="0" class="data_grid" style="float: left; width:450px;">
				<tr>
					<td>
						<div class="th_text">共收到:</div>
					</td>
					<td><input type='text' id='rec_RecAmount' name='RecAmount' value='' class="inw" />KG</td>
				</tr>
				<tr>
					<td>
						<div class="th_text">备注:</div>
					</td>
					<td><textarea rows='4' cols='50' id='rec_remark' name='rec_remark' value=''></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div align=center>
				<br> <br> 
				<br> <br> 
				<input type="button" name="btn_Save" value="提交"	 id="btn_Save" class="xybtn" onclick="submitRec();"/>&nbsp;&nbsp; 
				<input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.list['qrsh'].close();" class="cancelbtn" />
			</div>
	</div>
	</div>
	
</body>
</html>
