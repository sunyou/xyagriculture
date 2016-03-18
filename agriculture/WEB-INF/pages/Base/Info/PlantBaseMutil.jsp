<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加种植基地</title>
    <link href="${ctx}/content/css/custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/JSON2.JS"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <style type="text/css">
        html, body {
            width:100%;
            height:100%;
            overflow:hidden;
        }
    </style>
    <script type="text/javascript">

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
        }

        function deleteRow(id) {
            if (confirm('确定删除当前行吗？'))
                $("#Row" + id).remove();
        }

        function saveMutil() {
            var items = [];
            $.each($('#itemRows tr'), function (n, tr) {
                var PlantBases_Name = $(this).find('input[name=PlantBases_Name]').val(),
                    Contacts = $(this).find('input[name=Contacts]').val(),
                    Tel = $(this).find('input[name=Tel]').val(),
                    DetailAddr = $(this).find('input[name=DetailAddr]').val(),
                    Notes = $(this).find('input[name=Notes]').val();
                if (PlantBases_Name != '')
                    items.push({ 'PlantBases_Name': PlantBases_Name, 'Contacts': Contacts, 'Tel': Tel, 'DetailAddr': DetailAddr, 'Notes': Notes });
            });
            MyLoading(true);
/* 			myAjax("${ctx}/PlantBases/AddMutilPlantBase.ajax",
						'POST', {
							"driv" : JSON.stringify(items)
						}, function(msg) {
							MyLoading(false);
							alert(msg.message);
							showTips(msg.message, '');
						}); */

			$.ajax({
					type : 'POST',
					url : "${ctx}/PlantBases/AddMutilPlantBase.ajax",
					data : {"driv" : JSON.stringify(items)},
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
    <table border="0" class="data_grid" style="float: left; width: 600px;">
        <thead>
            <tr>
                <th width="60" align="center">操作
                </th>
                <th width="100" align="center">基地名称</th>
                <th width="100" align="center">联系人</th>
                <th width="100" align="center">电话</th>
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
                    <input type="text" name="PlantBases_Name" value="" />
                </td>
                <td>
                    <input type="text" name="Contacts" value="" />
                </td>
                <td>
                    <input type="text" name="Tel" value="" />
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
                    <input type="text" name="PlantBases_Name" value="" />
                </td>
                <td>
                    <input type="text" name="Contacts" value="" />
                </td>
                <td>
                    <input type="text" name="Tel" value="" />
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
