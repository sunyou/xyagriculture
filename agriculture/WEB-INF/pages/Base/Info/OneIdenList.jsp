<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>地理标志管理</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
		var grid = null;
		$(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid=$("#gv_OneIden").createLigerGrid({
                header: [
                    { display: '地理标志登记证书编号', width:'150', name: 'OneIdenNo',render:showDetail },
                    { display: '地理标志核准登记产品全称', width:'150', name: 'OneIdenName',render:showDetail },
                    { display: '产品生产总规模', width:'100', name: 'ProdScale' },
                    { display: '质量控制规范编号', width:'120', name: 'SpecNum' },
                    { display: '所属合作社名称', name: 'CoFarmer_Name',width:'250',render:showCoFarmerDetail },
                    { display: '下载', render: function (rowdata, index, value) {
                       if((rowdata["CONTENT"]+'') === "undefined" || rowdata["CONTENT"] === undefined){
                    			return '';
                       }else{
                     return "&nbsp;<input value='下载文档' type=button class='rowEditButton' onclick='window.open(\"${ctx}/Download?filePath="+ rowdata["CONTENT"] +"\")' >";
                     } }}
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 500,
                },
                leftBtns: {  
                  	show:false   
                  <shiro:hasPermission name="1008:oneiden.edit">     
                	,show:true,                     
                    showDetail: {
                        show:false,
                        url: "${ctx}/OneIden/OneIdenDet.html",
                        height: 200,
                    },
                    showEdit: {
                        show:true,
                        url: "${ctx}/OneIden/UpadteOneIdenEdit.html",
                        width:660,
                        height:360,
                    },                    
                    showDelete: {
                        show:true,
                        url: "${ctx}/OneIden/OneIdenDelete.ajax",
                        close: function () {
                            grid.reload();
                        }
                    }
                    </shiro:hasPermission>

                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "ONEIDEN_ID",
                ajaxURL: "${ctx}/OneIden/GetOneIden.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_OneIdenName").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/OneIden/AddOneIdenEdit.html?Type=1', '新增地理标志');
            });

        });
        
         function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoShow('"
             	+rowdata["ONEIDEN_ID"]+"','"+rowdata["ONEIDENNAME"]+"');\">"+value+"</a>";
             return html;
        } 
        
         function gotoShow(Id ,Name){
        	myopen("${ctx}/OneIden/OneIdenDet.html?type=3&id="+Id,"查看三品一标 " + Name + " 的详情"  ,660,360);
        }
        
        function showCoFarmerDetail(rowdata, index, value) {
			var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoshowCoFarmer('"
					+ rowdata["COFARMER_ID"]
					+ "','"
					+ value
					+ "');\">" + value + "</a>";
			return html;
		}

		function gotoshowCoFarmer(cofarmerId, name) {
			parent.f_addTab(cofarmerId, '生产商详情', '${ctx}/Base/Info/CoFarmerBaseInfo.html?type=3&id='+cofarmerId);		
					}
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">核准登记产品全称：</div>
					<div class="sert left">
						<input type="text" id="txt_OneIdenName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					 <shiro:hasPermission name="1008:oneiden.edit">   
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 </shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_OneIden"></div>
		</div>
	</div>
</body>
</html>
