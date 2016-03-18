<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>质询列表</title>
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
    
   
    
    function showDetailFL(id, name){
    	ligerWin(660, 360,"${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html?type=3&id="+id,"查看 " + name + " 详情");
    }
    
    function showDetail(id, name){
    	ligerWin(660, 360,"${ctx}/Base/Material/InquiryDet.html?type=3&id="+id,"查看质询 " + name + " 的详情");
    }
        var grid = null;
        $(document).ready(function () {
            
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
            grid = $("#grid").createLigerGrid({
                header: [
					{ display: '被质询人', name: 'CoFarmer_Name', width:250 },     
                         
					{ display: '被质询原因', width:350, render: function (rowdata, index, value){
							var reasonStr = "";
							if(rowdata['OPERDATE'].length>10){
								reasonStr = ""+rowdata['OPERDATE'].substr(0,10);
							}else{
								reasonStr = ""+rowdata['OPERDATE'];
							}
							reasonStr += "-"+rowdata['INQUIRY_TYPE'];
							reasonStr += "-"+rowdata['OBJECT_NAME'];
							return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetailFL(\""+ rowdata['OBJECT_ID'] +"\", \""+ reasonStr +"\")'>"+ reasonStr +"</a>"
						}
						
					}, 
					{ display: '质询内容', render: function (rowdata, index, value) {
							if(rowdata['REASON']){
								return "<a href='javascript:void(0)'  class='ligerBtnDetail'  onclick='showDetail(\""+ rowdata['ID'] +"\", \""+  rowdata['OBJECT_NAME']  +"\")'>"+ rowdata['REASON'] +"</a>"
							}							
						}, width: '200'
					},
					{ display: '质询人', name: 'Operators' },
                    { display: '反馈内容', name: 'ResNote' },
                    <shiro:hasPermission name="1009:inquiry.res">
                    
                    { display: '反馈', render: function (rowdata, index, value) { return "<input type='button'  class='rowSelectButton' value='反馈' onclick=\"ligerWin(600,350,'${ctx}/Base/Material/InquiryResEdit.html?ID=" + rowdata['ID'] + "&Reason=" + encodeURIComponent(rowdata['REASON']) + "&CoFarmer_ID=" + rowdata['COFARMER_ID'] + "','反馈',function(){grid.reload();});\" />"; } }
                    </shiro:hasPermission>
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 560,
                    height: 250
                },
                leftBtns: {
                	show:false
                    /**width: 100,
                    showDelete: {
                        show:true,
                        close: function () {
                            grid.reload();
                        },
                        show: false
                    },                    
                    showEdit: {
                        show:false,
                        close: function () {
                            grid.reload();
                        }
                    },
                    showDetail: {
                        show:true,
                        url: "${ctx}/Base/Material/InquiryDet.html",
                        height: 250,
                        width:650
                    },**/
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "ID",
                ajaxURL: "${ctx}/Base/Material/GetInquiry.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_CoFarmer_Name").val());
                grid.reload()
            });

        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">生产者：</div>
					<div class="sert left">
						<input type="text" name="txt_CoFarmer_Name" id="txt_CoFarmer_Name" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<!-- 
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 -->
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
