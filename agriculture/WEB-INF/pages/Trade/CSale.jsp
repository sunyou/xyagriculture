<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>销售列表</title>
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
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript">
	
        var grid = null, opt = {
            header: [
        { display: '销售日期', name: 'Op_Date' , type: 'date', format: 'yyyy-MM-dd'},
        { display: '单据编号', name: 'Bill_No' ,render:showDetail, width: '280' },
      
        { display: '数量', name: 'Amount' },
        { display: '操作人', name: 'Operators' },
          { display: '生产者', name: 'CoFarmer_Name', width: '200'  },
        { display: '销售商', name: 'Reseller_Name', width: '200' }
            ],
            editor: {
                width: 950,
                height: 250
            },
            param: { 'flag': 1, 'Type': 2 },
            leftBtns: {                
                showDetail: {
                    show:false,
                  
                },                
                showEdit: {
                    show:true,
                    url: "${ctx}/Trade/CSaleEdit.html",
                    width: 770,
                    height: 500,
                    close: function () {
                        grid.reload();
                    }
                },                
                showDelete: {
                   show:true,
                   url:"${ctx}/CSale/delCSale.ajax",
                   close: function () {
                       grid.reload();
                   }
               },      
            },
            onSelectRow: function (rowdata, rowid, rowobj) {
            },
            keyID: "BILL_ID",
            ajaxURL: "${ctx}/CSale/GetCSale.ajax"
        };
        $(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            

            grid = $("#grid").createLigerGrid(opt);

            $("#btn_Search").click(function () {
                grid.setParm("billNo", $("#txt_BillNo").val());
                 grid.setParm("operdate", $("#txt_OperDate").val());
                grid.reload()
            });
            $("#btn_Add").click(function () {
                ligerWin(770, 500, '${ctx}/Trade/CSaleEdit.html?type=1', '新增销售出库信息', function () {
                    grid.reload();
                });
            });

        });
        
         
      function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
             	+rowdata["BILL_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function detail(id ,name){
        	myopen("${ctx}/Trade/CSaleEdit.html?type=3&id="+id,"查看销售出库详情"  ,750,500);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">销售编号：</div>
					<div class="sert left">
						<input type="text" name="txt_BillNo" id="txt_BillNo" class="serchInput" />
					</div>
					<div class="rtxt left">销售日期：</div>
					<div class="sert left">
						<input name="txt_OperDate" type="text" id="txt_OperDate"  class="Wdate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" class="serchInput" />
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
