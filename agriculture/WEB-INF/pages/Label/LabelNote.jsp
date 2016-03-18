<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>标签管理</title>
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
                    { display: '标签编号', name: 'Label_No',width:'250',render:showDetail},
                    { display: '说明', name: 'Notes',width:'400' },
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 400,
                    height: 200
                },
                leftBtns: {
                    show:true,
                    showDetail: {
                       show:false,
                    },
                    
                    show:true,

                    showDelete: {
                        close: function () {
                            grid.reload();
                        }
                    },
                    show:true,
                    showEdit: {
                        width: 660,
                        height:360,
                        url: "${ctx}/Label/LabelNoteEdit.html"
                    }
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "AUTO_ID",
                ajaxURL: "${ctx}/LabelNote/GetLabelNote.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("labelNo", $("#txt_Label_NO").val());
                grid.reload()
            });

            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/Label/LabelNoteEdit.html?Type=1', '新增标签', function () {
                    grid.reload();
                });
            });
        });
        
         function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"detail('"
             	+rowdata["AUTO_ID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
        function detail(id ,name){
        	myopen("${ctx}/Label/LabelNoteEdit.html?type=3&id="+id,"查看标签详情"  ,660,360);
        }
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">标签编号：</div>
					<div class="sert left">
						<input type="text" name="txt_Label_NO" id="txt_Label_NO" class="serchInput" />
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

