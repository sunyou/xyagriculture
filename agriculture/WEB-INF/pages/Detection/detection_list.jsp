<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农残检测列表</title>
    <%@ include file="/common/include.jsp"%>
    <script type="text/javascript">
		var grid =null;
		$(document).ready(function () {
			$('#layout').ligerLayout({ topHeight: 30,allowTopResize:false });
			
            grid = $("#grid").createLigerGrid({
                header: [
                    { display: '检测日期', name: 'DETECTION_DATE', type: 'date', width: '100' },
                    { display: '检测编号', name: 'DETECTION_NO' , width: '110', render: renderDetection},
                    { display: '检测人', name: 'DETECTOR' , width: '60'},
                    { display: '检测单位', name: 'DEPT_NAME' },
                    { display: '生产者', name: 'COFARMER_NAME', width: '200',render: renderCoFarmer},
                    { display: '采收', name: 'PLOTHARVEST_NO' , width: '150', render: renderPlotharvest},
                    { display: '检测结果', name: 'RESULT', width: '60'},
                    { display: '检测依据', name: 'ACCRODING' , width: '60'},
                    { display: '检测类别', name: 'TYPE_ID' , width: '60'},
                    { display: '检测方式', name: 'METHOD' , width: '60'}
                ],
                param: { 'flag': 1 },
				editor: {
                    width: openWinWidthDef,
                    height: openWinHeightDef
                },
				leftBtns: {
					show:false   
                	
                <shiro:hasPermission name="1302:detection.edit">     
                	,show:true,   
					
				    showDelete: {
				        show:true,
                        close: function () {
                            grid.reload();
                        },
                        url: "deleteDetection.ajax"
					},					
				    showDetail: {
				    	show:false
                    },
				    showEdit: {
				    	title:'编辑农产品检测',
				        show:true,
				        url: "${ctx}/Detection/detection_edit.html",
				        width: openWinWidthDef,
				        height: openWinHeightDef,
						close: function () {
                            grid.reload();
						}
                    }
                </shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "DETECTION_UID",
                ajaxURL: "getDetectionList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("detectionNo", $("#txt_Detection_No").val());
                grid.reload()
            });
			
			$("#btn_Add").click(function () {
				openDialogInIframe(openWinWidthDef, openWinHeightDef, '${ctx}/Detection/detection_edit.html', '新增农产品检测', null, grid);
            });

        });
    </script>
</head>
<body>
	<div id="layout">
		<div position="top">
			<div class="rtittab">
				<div class="rtitbg2">
					<div class="rtxt left">检测编号：</div>
					<div class="sert left">
						<input type="text" name="txt_Detection_No" id="txt_Detection_No" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					<shiro:hasPermission name="1302:detection.edit">  
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					</shiro:hasPermission>
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
