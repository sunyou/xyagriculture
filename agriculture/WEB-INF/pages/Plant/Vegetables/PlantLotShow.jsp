<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>种植批次列表</title>
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
    <style type="text/css">
        .lblResult {
            width: 400px;
            height: 40px;
            line-height: 40px;
            margin: 30% auto;
            display: block;
            text-align: center;
            border: 1px solid #CCCCCC;
            background: url(${ctx}/content/css/images/warming.gif) no-repeat 20px 8px;
        }
    </style>
    <script type="text/javascript">
        function PlantLotChecked(id, type) {
            $("#hf_PlantLotID").val(id);
            var _tar = {};
            if (type.trim() == "3") {
                _tar = $("#div_Mushrooms");
            } else if (type.trim() == "2") {
                _tar = $("#div_Fruit");
            } else {
                _tar = $("#div_Vagetable");
            }
            art.dialog({
                title: "种植操作",
                width: 300,
                height: 300,
                content: $(_tar).html()
            }).lock();
        }


        /**
        *打开操作窗
        *
        */
        function OperateSelect(type) {
            var url = "about:blank", title = '', width = 440, height = 270;
            var plantLotID = $("#hf_PlantLotID").val();
            if (type == 'zd') {
                url = '${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '整地';
                width = 440;
                height = 270;
            } else if (type == 'bz') {
                url = '${ctx}/PlantOper/Vegetables/PlantCloneEdit.html?type=1&plantlotId=' + plantLotID;
                title = '定植';
                width = 440;
                height = 270;

            } else if (type == 'py') {
                url = '${ctx}/PlantOper/Vegetables/PlantSprayEdit.html?type=1&plantlotId=' + plantLotID;
                title = '喷药';
                width = 720;
                height = 550;
            } else if (type == 'sf') {
                url = '${ctx}/PlantOper/Vegetables/PlantFertilizeEdit.html?type=1&plantlotId=' + plantLotID;
                title = '施肥';
                width = 750;
                height = 520;
            } else if (type == 'cc') {
                url = '${ctx}/PlantOper/Vegetables/PlantWeedingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '锄草';
                width = 500;
                height = 300;
            } else if (type == 'js') {
                url = '${ctx}/PlantOper/Vegetables/PlantWaterEdit.html?type=1&plantlotId=' + plantLotID;
                title = '灌溉';
                width = 440;
                height = 400;
            } else if (type == 'qt') {
                url = '${ctx}/PlantOper/Vegetables/PlantOtherEdit.html?type=1&plantlotId=' + plantLotID;
                title = '其他';
                width = 440;
                height = 300;
            } else if (type == 'cs') {
                url = '${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=1&plantlotId=' + plantLotID;
                title = '采收';
                width = 530;
                height = 440;
            } else if (type == 'qc') {
                url = '${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清茬';
            }

            if (type == 'fzd') {
                url = '${ctx}/PlantOper/Vegetables/PlantSowingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清园';

            }
            if (type == 'fym') {
                url = '${ctx}/PlantOper/Vegetables/PlantCloneEdit.html?type=1&plantlotId=' + plantLotID;
                title = '育苗';
            } else if (type == 'fsf') {
                url = '${ctx}/PlantOper/Vegetables/PlantFertilizeEdit.html?type=1&id=' + plantLotID;
                title = '施肥';
                width = 730;
                height = 480;
            } else if (type == 'fjs') {
                url = '${ctx}/PlantOper/Vegetables/PlantWaterEdit.html?type=1&plantlotId=' + plantLotID;
                title = '灌溉';
                width = 450;
                height = 400;
            } else if (type == 'fsfcz') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantPolEdit.html?type=1&plantlotId=' + plantLotID;
                title = '授粉';
                width = 530;
                height = 440;
            } else if (type == 'fcc') {
                url = '${ctx}/PlantOper/Vegetables/PlantWeedingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '锄草';
                width = 400;
                height = 300;
            }
            else if (type == 'fpy') {
                url = '${ctx}/PlantOper/Vegetables/PlantSprayEdit.html?type=1&id=' + plantLotID;
                title = '喷药';
                width = 730;
                height = 600;
            }
            else if (type == 'fxj') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantPruneEdit.html?type=1&plantlotId=' + plantLotID;
                title = '整形修剪';
                width = 500;
                height = 320;
            }
            else if (type == 'fsg') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantLaxifloraEdit.html?type=1&plantlotId=' + plantLotID;
                title = '疏花疏果';
                width = 530;
                height = 350;
            }
            else if (type == 'ftd') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantFruitBaggingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '套袋';
                width = 500;
                height = 500;
            }
            else if (type == 'fcs') {
                url = '${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=1&plantlotId=' + plantLotID;
                title = '采收';
                width = 530;
                height = 440;
            }
            else if (type == 'fhc') {
                url = '${ctx}/PlantOper/Fruit/FruitPlantRotationCropsEdit.html?type=1&plantlotId=' + plantLotID;
                title = '换茬';
                width = 530;
                height = 440;
            }
            else if (type == 'fqc') {
                url = '${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清茬';
                width = 530;
                height = 440;
            }


            if (type == 'mpl') {
                url = '${ctx}/PlantOper/Mushrooms/MushPreEdit.html?type=1&plantlotId=' + plantLotID;
                title = '配料';
                width = 470;
                height = 350;
            } else if (type == 'mmj') {
                url = '${ctx}/PlantOper/Mushrooms/MushSterilizingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '灭菌';
                width = 440;
                height = 380;
            } else if (type == 'mpy') {
                url = '${ctx}/PlantOper/Mushrooms/MushFosterEdit.html?type=1&plantlotId=' + plantLotID;
                title = '培养';
                width = 440;
                height = 410;
            } else if (type == 'mzd') {
                url = '${ctx}/PlantOper/Mushrooms/MushBaggingEdit.html?type=1&plantlotId=' + plantLotID;
                title = '装袋';
                width = 440;
                height = 350;
            } else if (type == 'mjz') {
                url = '${ctx}/PlantOper/Mushrooms/MushVaccEdit.html?type=1&plantlotId=' + plantLotID;
                title = '接种';
                width = 440;
                height = 350;
            } else if (type == 'mcs') {
                url = '${ctx}/PlantOper/Vegetables/PlantHarvestEdit.html?type=1&plantlotId=' + plantLotID;
                title = '采收';
                width = 440;
                height = 450;
            }
            else if (type == 'mqc') {
                url = '${ctx}/PlantOper/Vegetables/PlantClearEdit.html?type=1&plantlotId=' + plantLotID;
                title = '清茬';
                width = 440;
                height = 300;
            }
            myopen(url, title, width, height);
        }
    </script>
</head>
<body>
        <div style="width: 900px; margin: 0 auto;">
            <table id="dl_PlantLot" cellspacing="0" style="border-collapse:collapse;">
				<tr>
	            	<c:forEach items="${plantLots }" var="item" varStatus="status">
						<td>
		                    <div class="platItem zuowu">
		                        <ul class="itemData">
		                            <li><span class="itemText">种植批次:</span>${item.lotNo }</li>
		                            <li><span class="itemText">作物名称:</span>${item.goodsName }</li>
		                            <li><span class="itemText">区域面积:</span>${item.areas }</li>
		                            <li><span class="itemText">作物种苗:</span>${item.goodvarietyName }</li>
		                        </ul>
		                        <div>
		                            <a class="lbel_PlantHand" onclick="PlantLotChecked('${item.plantlotId }','${item.goodType }')">农事操作
		                            </a>
		                        </div>
		                    </div>
		                </td>
		                <c:if test="${(status.index + 1) % 4 == 0 }">
		                	</tr><tr>
		                </c:if>
	            	</c:forEach>
				</tr>
			</table>
            <input type="hidden" name="hf_PlantLotID" id="hf_PlantLotID" value="3d9e2d0a-d74b-4081-819a-001b43ecd6bd    " />
            
        </div>
    <!--种植操作[star] 蔬菜，水果，食用菌-->
    <div id="div_Vagetable" style="display: none">
        <ul class="operToolsBox" data-title="蔬菜">
            <li>
                <a href="javascript:void(0);" class="z_1" id="zd">
                    <input type="button" value="整地" onclick="OperateSelect('zd')" />
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" class="z_2" id="bz">
                    <input type="button" value="定植" onclick="OperateSelect('bz')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_3" id="py">
                    <input type="button" value="喷药" onclick="OperateSelect('py')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_4" id="sf">
                    <input type="button" value="施肥" onclick="OperateSelect('sf')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_8" id="cc">
                    <input type="button" value="锄草" onclick="OperateSelect('cc')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_9" id="js">
                    <input type="button" value="灌溉" onclick="OperateSelect('js')" />
                </a>
            </li>

            <li>
                <a href="javascript:;" class="z_14" id="cs">
                    <input type="button" value="采收" onclick="OperateSelect('cs')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_13" id="qt">
                    <input type="button" value="其他" onclick="OperateSelect('qt')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_15" id="qc">
                    <input type="button" value="清茬" onclick="OperateSelect('qc')" />
                </a>
            </li>

        </ul>
    </div>
    <div id="div_Fruit" style="display: none;" data-title="水果">
        <ul class="operToolsBox">
            <li>
                <a href="javascript:;" class="z_24" id="fzd">
                    <input type="button" value="清园" onclick="OperateSelect('fzd')" />
                </a>
            </li>

            <li>
                <a href="javascript:;" class="z_2" id="fym">
                    <input type="button" value="育苗" onclick="OperateSelect('fym')" />
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" class="z_1" id="bz">
                    <input type="button" value="定植" onclick="OperateSelect('bz')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_7" id="fsf">
                    <input type="button" value="施肥" onclick="OperateSelect('fsf')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_9" id="fjs">
                    <input type="button" value="灌溉" onclick="OperateSelect('fjs')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_10" id="fsfcz">
                    <input type="button" value="授粉" onclick="OperateSelect('fsfcz')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_8" id="fcc">
                    <input type="button" value="锄草" onclick="OperateSelect('fcc')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_3" id="fpy">
                    <input type="button" value="喷药" onclick="OperateSelect('fpy')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_20" id="fxj">
                    <input type="button" value="整形修剪" onclick="OperateSelect('fxj')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_21" id="fsg">
                    <input type="button" value="疏花疏果" onclick="OperateSelect('fsg')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_22" id="ftd">
                    <input type="button" value="套袋" onclick="OperateSelect('ftd')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_14" id="fcs">
                    <input type="button" value="采收" onclick="OperateSelect('fcs')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_13" id="qt">
                    <input type="button" value="其他" onclick="OperateSelect('qt')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_23" id="fhc">
                    <input type="button" value="换茬" onclick="OperateSelect('fhc')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_15" id="fqc">
                    <input type="button" value="清茬" onclick="OperateSelect('fqc')" />
                </a>
            </li>
        </ul>
    </div>
    <div id="div_Mushrooms" style="display: none;" data-title="食用菌">
        <ul class="operToolsBox">
            <li>
                <a href="javascript:;" class="z_11" id="mpl">
                    <input type="button" value="配料" onclick="OperateSelect('mpl')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_16" id="mmj">
                    <input type="button" value="灭菌" onclick="OperateSelect('mmj')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_18" id="mpy">
                    <input type="button" value="培养" onclick="OperateSelect('mpy')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_12" id="mzd">
                    <input type="button" value="装袋" onclick="OperateSelect('mzd')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_17" id="mjz">
                    <input type="button" value="接种" onclick="OperateSelect('mjz')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_14" id="mcs">
                    <input type="button" value="采收" onclick="OperateSelect('mcs')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_13" id="qt">
                    <input type="button" value="其他" onclick="OperateSelect('qt')" />
                </a>
            </li>
            <li>
                <a href="javascript:;" class="z_15" id="mqc">
                    <input type="button" value="清茬" onclick="OperateSelect('mqc')" />
                </a>
            </li>
        </ul>
    </div>
    <!--种植操作[end]-->
</body>
</html>

