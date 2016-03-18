<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>食品等级管理</title>
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
            grid=$("#gv_FoodGrade").createLigerGrid({
                header: [
                    { display: '农产品等级证书编号', name: 'CerNo', width:'120',render:showCertDetail},
                    { display: '农产品等级证书名称', name: 'CerName' ,width:'140', render:showCertDetail},
                    { display: '农作物', name: 'GoodsName' ,width:'80'},
                    { display: '食品等级', name: 'CRITERIA_LEVEL' },
                    { display: '所属合作社名称', name: 'CoFarmer_Name',width:'250',render:showCoFarmerDetail },
                    { display: '下载证书' ,width:'80', render: function (rowdata, index, value) { 
                      if((rowdata["CONTENT"]+'') === "undefined" || rowdata["CONTENT"] === undefined){
                    			return '';
                       }else{
                    	        return "&nbsp;<input value='下载证书' type=button class='rowEditButton'  onclick='window.open(\"${ctx}/Download?filePath="+ rowdata["CONTENT"] +"\")' >";
                    } 
                    }
                    }
                ],
                param: { 'flag': 1 },
                editor: {
                    width: 560,
                },
                leftBtns: {
                 show:false
                  <shiro:hasPermission name="1007:foodgrade.edit"> 
                  ,show:true,                    
                    showDetail: {
                        show:false,
		                url: "${ctx}/FoodGrade/FoodGradeDet.html",
		                height: 350,
		            },                   
		            showEdit: {
		                show:false,
                        height: 515,
                    },                    
		            showDelete: {
		                show:true,
		                  url: "${ctx}/FoodGrade/FoodGradeDelete.ajax",
		                
                        close: function () {
                            grid.reload();
                        }
                    }
                    
		           
		             </shiro:hasPermission>

		        },
		        onSelectRow: function (rowdata, rowid, rowobj) {
		        },
		        keyID: "THREEPROD_ID",
		        ajaxURL: "${ctx}/FoodGrade/GetFoodGrade.ajax"
		    });

            $("#btn_Search").click(function () {
                grid.setParm("name", $("#txt_CerName").val());
                grid.reload()
            }
            );
            $("#btn_Add").click(function () {
                ligerWin(660, 360, '${ctx}/FoodGrade/AddFoodGradeEdit.html?Type=1', '新增食品等级');
            });

        });
        
         function showCertDetail(rowdata,index,value){ 
             var html = "<a href='javascript:void(0);' class='ligerBtnDetail' onclick=\"gotoShow('" +rowdata["THREEPROD_ID"]+"');\">"+value+"</a>";
             return html;
        } 
        
         function gotoShow(Id ){
        	myopen("${ctx}/FoodGrade/FoodGradeDet.html?type=3&id="+Id,"查看农场品等级详情"  ,660,360);
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
					<div class="rtxt left">产品名称：</div>
					<div class="sert left">
						<input type="text" id="txt_CerName" class="serchInput" />
					</div>
					<div class="serb left">
						<input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
					</div>
					 <shiro:hasPermission name="1007:foodgrade.edit">   
					<div class="serb left">
						<input id="btn_Add" type="button" value="新增" class="btn_tool_add" />
					</div>
					 </shiro:hasPermission>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div position="center">
			<div id="gv_FoodGrade"></div>
		</div>
	</div>
</body>
</html>
