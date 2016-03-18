<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>地块编辑/新增</title>
    <link href="${ctx}/content/css/custom.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/JSON2.JS"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#itemRows input[name='Areas']").ligerSpinner({ height: 28, type: 'int', minValue: 1, maxValue: 10000, isNegative: false });

        });


        var rowid = 1;
        function getRows() {
            rowid = rowid + 1;
            return rowid;
        }
        Array.prototype.max = function () {
            return Math.max.apply({}, this)
        }

        function addRow() {
            var rs = getRows();
            var ids = [];
            $("#itemRows tr").each(function (i, id) {
                ids.push(parseInt($(id).attr('data-No')));

            });
            rs = ids.max() + 1;
            var tpl = $("#RowTemplete tbody").html();
            var temp = tpl.replace(/rowid/g, rs);
            $("#itemRows").append(temp);
            $("#itemRows input[name='Areas']").ligerSpinner({ height: 28, type: 'int', minValue: 1, maxValue: 10000, isNegative: false });
        }

        function deleteRow(id) {
            if (confirm('确定删除当前行吗？'))
                $("#Row" + id).remove();
        }

        function saveMutil() {
            var items = [], hasNull = false;;
            $.each($('#itemRows tr'), function (n, tr) {
                var Plot_Name = $(this).find('input[name=Plot_Name]').val(),
                    Farmer_ID = $(this).find('input[name=Farmer_ID]').val(),
                    Areas = $(this).find('input[name=Areas]').val(),
                    Facilities = $(this).find('select[name=Facilities]').val(),
                    State = $(this).find('select[name=State]').val(),
                    DetailAddr = $(this).find('input[name=DetailAddr]').val(),
                Notes = $(this).find('input[name=Notes]').val();
                if (Plot_Name == '') {
                    alert('请填写地块名称');
                    hasNull = true;
                    return false;
                }
                else if (Farmer_ID == '') {
                    alert('请选择农户');
                    hasNull = true;
                    return false;
                }
                items.push({ 'Plot_Name': Plot_Name, 'Farmer_ID': Farmer_ID, 'Areas': Areas, 'Facilities': Facilities, 'State': State, 'DetailAddr': DetailAddr, 'Notes': Notes });
            });
            if (hasNull)
                return false;
            MyLoading(true);
			/*myAjax("${ctx}/Plot/AddMutilBase.html", 'POST', {
					"driv" : JSON.stringify(items),
					"PlantBase_ID" : '${baseID}'
				}, function(msg) {
					MyLoading(false);
					alert(msg.message);
				})*/
				
			$.ajax({
				type : 'POST',
				url : "${ctx}/Plot/AddMutilPlot.ajax",
				data : {"driv" : JSON.stringify(items),"PlantBase_ID" : '${baseID}'},
				success : function(msg) {
					alert(msg.message);
					MyLoading(false);
					showTips(msg.message, '');
				}
			});
			}
				</script>
</head>
<body>
    <ul class="topbar">
        <li>
            <label id="butt" class="butt">
                <input type="button" value="保存数据" onclick="saveMutil();" class="xybtn" />
            </label>
        </li>
    </ul>
    <br />
    <br />
    <table border="0" class="data_grid" style="float: left; width: 800px;">
        <thead>
            <tr>
                <th width="60" align="center">操作
                </th>
                <th width="100" align="center">地块名称</th>
                <th width="100" align="center">农户名称</th>
                <th width="100" align="center">面积</th>
                <th width="100" align="center">状态</th>
                <th width="100" align="center">栽培设施</th>
                <th width="100" align="center">详细地址</th>
                <th align="center">说明</th>
            </tr>
        </thead>
        <tbody id="itemRows">
            <tr id="Row1" class="ClientTablerow" data-no="1">
                <td>
                    <input id="addRow_btn" class="addRow_btn" type="button" value="添加一行" onclick="addRow();" />
                </td>
                <td>
                    <input type="text" name="Plot_Name" value="" />
                </td>
                <td>
                    <input type="hidden" id="Farmer_ID1" name="Farmer_ID" value=""  />
                    <input type="text" id="Farmer_Name1" name="Farmer_Name" readonly onclick="openHelper('${ctx}/Farmer/Helper/Farmer_Helper.html', { id: 'Farmer_Name1,Farmer_ID1', key: 'FARMER_NAME,FARMER_ID' }, '农户--选择帮助界面', 500, 400);" />
                </td>
                <td>
                    <input type="text" name="Areas" />
                </td>
                <td>
                    <select name="State">
                        <option value="1" selected="selected">已使用</option>
                        <option value="0">未使用</option>
                    </select>
                </td>
                <td>
                    <select name="Facilities">
                        <option value="1">露地</option>
                        <option value="2">塑料大棚</option>
                        <option value="3">日光温室</option>
                        <option value="4">地膜覆盖</option>
                        <option value="5">其他设施</option>

                    </select>
                </td>
                <td>
                    <input type="text" name="DetailAddr" />
                </td>
                <td>
                    <input type="text" name="Notes" />
                </td>
            </tr>
        </tbody>
    </table>

    <table id="RowTemplete" style="display: none;">
        <tbody>
            <tr id="Rowrowid" class="ClientTablerow" data-no="rowid">
                <td align="center">
                    <input class="addRow_btn" type="button" value="移除" onclick="deleteRow(rowid);" />
                </td>
                <td>
                    <input type="text" name="Plot_Name" value="" />
                </td>
                <td>
                    <input type="hidden" id="Farmer_IDrowid" name="Farmer_ID" value="" />
                    <input type="text" id="Farmer_Namerowid" name="Farmer_Name" readonly onclick="openHelper('${ctx}/Farmer/Helper/Farmer_Helper.html', { id: 'Farmer_Namerowid,Farmer_IDrowid', key: 'FARMER_NAME,FARMER_ID' }, '农户--选择帮助界面', 500, 400);" />
                </td>
                <td>
                    <input type="text" name="Areas" />
                </td>
                <td>
                    <select name="State">
                        <option value="1" selected="selected">已使用</option>
                        <option value="0">未使用</option>
                    </select>
                </td>
                <td>
                    <select name="Facilities">
                        <option value="1">露地</option>
                        <option value="2">塑料大棚</option>
                        <option value="3">日光温室</option>
                        <option value="4">地膜覆盖</option>
                        <option value="5">其他设施</option>

                    </select>
                </td>
                <td>
                    <input type="text" name="DetailAddr" />
                </td>
                <td>
                    <input type="text" name="Notes" />
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
