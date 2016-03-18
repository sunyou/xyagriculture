<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农用物资-种苗列表</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
	    var isShowDel = false;
	    var isShowEdit = false;
    </script>
    <shiro:hasPermission name="1102:material.goodVariety.del"> 
		<script type="text/javascript">
		    isShowDel = true; 
	    </script>
	</shiro:hasPermission>
    <shiro:hasPermission name="1102:material.goodVariety.edit"> 
		<script type="text/javascript">
		    isShowEdit = true; 
	    </script>
	</shiro:hasPermission>
	
	
	
    
    <script type="text/javascript">
    function showDetail(id, name){
    	ligerWin(660, 360,"${ctx}/PostMap/CarDet.html?type=3&id="+id,"查看 " + name + " 的详情");
    }
        var grid = null;
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });

            grid = $("#grid").createLigerGrid({
                header: [
                         { display: '车辆编号', render: function (rowdata, index, value) { 
		 							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['CARID'] +"\", \""+  rowdata['CARNO']  +"\")'>"+ rowdata['CARNO'] +"</a>"
		 						}, width: '200'
		 					},
                         { display: '车辆类型', name: 'CarType', width:'160'},
                         { display: '年检时间', name: 'CarCheck' },
                         {
                             display: '车辆状态', align: 'center', width: '180', name: 'CarState', render: function (rowdata, index, value) {
                                 if (value == '1')
                                     return "<font color='#B4E62E'>正常</font>";
                                 else
                                     return "<font color='#FF4044'>维修</font>";
                             }
                         },
                         { display: '最大载重量', name: 'MaxCap', render: function (rowdata, index, value) { return "<font color='#FE3433'>" + value + "</font> KG" } }
                     
                ],
                param: { 'flag': 1 },
				editor: {
                    width: 660,
                    height: 360
                },
				leftBtns: {
					showDelete: {
				        show:true,
				        show:true,
                        url: "${ctx}/PostMap/delIgCarById.ajax",
                        close: function () {
                            grid.reload();
                        }
					},					
				    showDetail: {
				    	show:false,
                        url: "${ctx}/PostMap/CarDet.html",
                        width: 660,
                        height:360
                    },
				    showEdit: {
				    	show:true,
                        url: "${ctx}/PostMap/CarEdit.html",
                        width: 660,
                        height:360,
						close: function () {
                            grid.reload();
						}
                    },
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "CARID",
                ajaxURL: "${ctx}/PostMap/getIgCarList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("carNo", $("#carNo").val());
                grid.reload()
            });
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/PostMap/CarEdit.html?type=1', '新增车辆', function () {
                    grid.reload();
				});
            });
            
        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">车辆编号：</div>
					<div class="sert left">
						<input type="text" name="carNo" id="carNo" class="serchInput" />
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
</body>
</html>
