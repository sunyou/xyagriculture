
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>食品标准</title>
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
                    { display: '食品标准编号', name: 'SNo',width:"120",render:showStandardDetailRender },
                    { display: '食品标准名称名称', name: 'SName',width:"450",render:showStandardDetailRender },
                    { display: '食品标准类型', name: 'SType' },
                    { display: '介绍', name: 'Introduction',width:"270" },
                    { display: '下载', 
                    	render: function (rowdata, index, value) {
                    		if((rowdata["DOCFILEPATH"]+'') === "undefined" || rowdata["DOCFILEPATH"] === undefined){
                    			return '';
                    			//return "&nbsp;<input value='下载文档' type=button class='rowEditButton'  onclick='window.open(\"${ctx}/Download?filePath=upload/13夏黑葡萄号.doc\")' >"; 
                    		}else{
                    			return "&nbsp;<input value='下载文档' type=button class='rowEditButton'  onclick='window.open(\"${ctx}/Download?filePath=" + rowdata["DOCFILEPATH"] + "\")' >"; 
                    		}
                    	} 
                    }
                ],
                param: { 'sno':$("#txt_SNo").val() },
                editor: {
                    width: 500,
                    height: 470
                },
                leftBtns: {
                    show:false
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "SID",
                ajaxURL: "${ctx}/Standard/GetStandard.ajax"
            });
            $("#btn_Search").click(function () {
                grid.setParm("sno", $("#txt_SNo").val());
                grid.reload();
            });
    
        });
        
        function showStandardDetailRender(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"showStandardDetail('"
             	+rowdata["SID"]+"','"+rowdata["SNO"]+"');\">"+value+"</a>";
             return html;
        } 
        
       	function showStandardDetail(sid ,sname){
        	myopen("${ctx}/Standard/StandardDet.html?type=3&id="+sid,"查看食品标准 " + sname + " 的详情"  ,660,360);
        }
        
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">标准编号：</div>
					<div class="sert left">
						<input type="text" name="txt_SNo" id="txt_SNo" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
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