<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>采购农资列表</title>
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
            grid = $("#gv_CoFarmerMaterial").createLigerGrid({
                header: [
                    { display: function(){
                    		if("1"=="${materialType}"){
                    			return '化肥名称'
                    		}else{
                    			return '农药名称'
                    		}
                    		
                    	}, name: 'Object_Name',render:showDetail },
                    
                    { display: '物资类型', name: 'cmtype' },
                    { display: '合作社', name: 'CoFarmer_Name',width:'200',render:showCoFarmerDetail },
                    { display: '采购时间', name: 'OperateDate', render: function (rowdata, index, value){ 
						if(rowdata['OPERATEDATE'].length>10){
							return rowdata['OPERATEDATE'].substr(0,10);
						}
                    }},
                    { display: '采购数量', name: 'Qty' },
                    { display: '单位', name: 'UnitName' },
                    { display: '采购人', name: 'OperateUser' },
                    { display: '经销商', name: 'Supplier_Name', width: '200' },
                    { display: '生产商', name: 'Produce_Name', width: '200' }
                    
                ],
                param: { 'flag': 1 , 'materialType':'${materialType}'},
                editor: {
                    width: 540,
                },
                leftBtns: { 
                	show:false   
                  <shiro:hasPermission name="1103:cfmeterial.edit">     
                	,show:true,                      
                    showDetail: {
                        show:false,
                        url: "${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html",
                        height: 250
                    },
                    showEdit: {
                        show:true,
                        url: "${ctx}/CoFarmerMaterialV/UpdateCoFarmerMaterialEdit.html?materialType=${materialType}",
                        width:660,
                        height:360,
                    },                    
                    showDelete: {
                        show:true,
                        url: "${ctx}/CoFarmerMaterialV/CoFarmerMaterialDel.ajax",
                        close: function () {
                            grid.reload();
                        }
                    }
     			</shiro:hasPermission>
                },
                onSelectRow: function (rowdata, rowid, rowobj) {
                },
                keyID: "COMAT_UID",
                ajaxURL: "${ctx}/CoFarmerMaterialV/GetCoFarmerMaterial.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_Object_Name").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/CoFarmerMaterialV/AddCoFarmerMaterialEdit.html?Type=1&materialType=${materialType}', '新增农资采购', function () {grid.reload(); });
            });

        });
        
         function showDetail(rowdata,index,value){
             var html = "<a href='javascript:;' class='ligerBtnDetail' onclick=\"gotoShow('"
             	+rowdata["COMAT_UID"]+"','"+value+"');\">"+value+"</a>";
             return html;
        } 
        
         function gotoShow(Id ,Name){
        	myopen("${ctx}/CoFarmerMaterialV/CoFarmerMaterialDet.html?type=3&id="+Id,"查看采购 " + Name + " 的详情"  ,660,360);
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
					<div class="rtxt left">农资名称：</div>
					<div class="sert left">
						<input type="text" id="txt_Object_Name" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					 <shiro:hasPermission name="1103:cfmeterial.edit">   
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 </shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_CoFarmerMaterial"></div>
		</div>
	</div>
</body>
</html>
