<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物流运输</title>
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
    <script type="text/javascript">

        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '运输编号', name: 'TS_NO'  ,render:showDetail, width: '250' },
                    { display: '出发时间', name: 'StartDate' , type: 'date', format: 'yyyy-MM-dd'},
                    { display: '到达时间', name: 'EndDate' , type: 'date', format: 'yyyy-MM-dd'},
                    { display: '目的地', name: 'EndAdd' },
                    { display: '温度(℃)', name: 'Tem' },
                    { display: '湿度(%)', name: 'Hum' },
                    { display: '仓库名称', name: 'SH_Name' ,width: '100'  },
                    { display: '车牌号', name: 'Car' },
                    { display: '司机', name: 'Operater' },
        
                    { display: '生产商', name: 'CoFarmer_Name', width: '250'  },
                    { display: '说明', name: 'REMARK', width: '250'  },
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 500,
                    height: 470
                },
                leftBtns: {
                    show:true,
                    showDetail: {
                        show:false,
                    },
                    
                   show:true,
                     showDelete: {
                        show:true,
                        url:"${ctx}/TranSport/delTranSport.ajax",
                        close: function () {
                            grid.reload();
                        }
                    },  
                    show:true,
                    showEdit: {
                    	width: 700,
                        height: 400,
                        url: "${ctx}/Trade/TranSportEdit.html",
                        close: function () {
                            grid.reload();
                        }
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "TS_ID",
                ajaxURL: "${ctx}/TranSport/GetTranSport.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("tsId", $("#txt_TS_NO").val());
                grid.reload()
            });

            $("#btn_Add").click(function () {
                ligerWin(700, 400, '${ctx}/Trade/TranSportEdit.html?type=1', '新增农产品运输', function () {
                    grid.reload();
                });
            });
        });
        
         function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
             	+rowdata["TS_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function detail(id ,name){
        	myopen("${ctx}/Trade/TranSportEdit.html?type=3&id="+id,"查看农产品运输 " + name + " 的详情"  ,700,400);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">运输编号：</div>
					<div class="sert left">
						<input type="text" name="txt_TS_NO" id="txt_TS_NO" class="serchInput" />
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

