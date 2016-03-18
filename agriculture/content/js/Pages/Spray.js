var Spray = {} || Spray;
var details = new Array();
var IsActive = 0;

function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}

function removeRows(id) {
    details.length == 0;
    $("#row_" + id).remove();

}

function addRows(alow) {
    var id = (new Date()).getTime().toString(36);
    var trHTML = "<tr id=\"row_" + id + "\" data-rowid=\"" + id + "\">";
    //trHTML += "<td align='center'><input type='button' onclick=\"$('#row_" + id + "').remove();\" value='移除' title='移除' class='btn_removed' /></td>";

    trHTML += "<td><input type='text' class='inw' id='txt_Material_Name" + id + "'  data-message='肥料名称' name='txt_Material_Name' readonly='true' onclick=\"selectObject('" + id + "')\" />";
    trHTML += "\<br/>没有找到？点击<a href=javascript:void(0); onclick='ligerWin(500, 400, " + '"/Pages/Base/Info/CoFarmerMaterialEdit.aspx?Type=2"' + "," + '"新增企业投入品"' + ");'>这里</a>添加一个";

    trHTML += "<input type='hidden' data-message='农药名称' name='txt_Material_ID' id='txt_Material_ID" + id + "' />";
    trHTML += "<input type='hidden' id='txt_Producer_ID" + id + "' />";
    trHTML += "<input type='hidden' id='txt_CM_ID" + id + "' /></td>";
    trHTML += "<td><input type='text' class='inw' data-message='使用方式' name='txt_UsageMode' id='txt_UsageMode" + id + "' style='width:60px;'/></td>";
    trHTML += "<td><input type='text' class='inw' data-message='标准用量' name='txt_AmountPer' id='txt_AmountPer" + id + "' style='width:60px;'/></td>";
    trHTML += "<td><input type='text' class='inw' data-message='实际使用量' name='txt_Qty' id='txt_Qty" + id + "' style='width:60px;'/></td>";
    trHTML += "<td><input type='text' class='inw' data-message='浓度' name='txt_Density' id='txt_Density" + id + "' style='width:60px;' /></td>";
    trHTML += "<td><input type='text' class='inw' data-message='安全间隔期' name='txt_Safe_Days' id='txt_Safe_Days" + id + "' style='width:60px;' /></td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);
}

function saveDetail() {
    var trs = $("#tb_Detail tr");
    $.each(trs, function (n, el) {
        var id = $(this).attr("data-rowid");
        var detail = {
            operateDate: $("#txt_Operate_Date").val(),
            cofarmerId: $("#hf_CoFarmer_ID").val(),
            goodsId: $("#hf_Goods_ID").val(),
            notes: $("#txt_Notes").val(),
            plantlotId: $("#hf_PlantLot_ID").val(),
            operators: $("#txt_Operators").val(),
            plotoperId: $("#plotoperId" + id).val(),
            cmId: $("#txt_CM_ID" + id).val(),
            materialId: $("#txt_Material_ID" + id).val(),
            usagemode: $("#txt_UsageMode" + id).val(),
            safeDays: $("#txt_Safe_Days" + id).val(),
            amountper: $("#txt_AmountPer" + id).val(),
            qty: $("#txt_Qty" + id).val(),
            density: $("#txt_Density" + id).val()
        };
        details.push(detail);
    });

}
function CheckForm() {
    var chearr = [document.getElementsByName('txt_Material_Name'),
         document.getElementsByName('txt_Material_ID'),
         document.getElementsByName('txt_AmountPer'),
         document.getElementsByName('txt_Qty'),
         document.getElementsByName('txt_Density'),
         document.getElementsByName('txt_Safe_Days')];
    var message = '';
    var hasEmpty = false;
    for (var i = 0; i < chearr.length; i++) {
        if (chearr[i].length > 0) {
            var item = chearr[i];
            for (var n = 0; n < item.length; n++) {
                if (item[n].value == '') {
                    hasEmpty = true;
                    item[n].focus();
                    message = item[n].getAttribute("data-message");
                    alert('请填写：' + message);
                    IsActive++;
                    break;
                }
            }
        }
        if (hasEmpty)
            break;
    }
    return hasEmpty;

}
function bindDetail(detail) {
    var trHTML = "<tr>";
    trHTML += "<td><a>移除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a >修改</a></td>";
    trHTML += "<td>"
    if (detail.Type == '1') {
        trHTML += '<a title="点击查看" onclick="clickLabel(\'' + detail.CM_ID + '\');" href="javascript:;"><font color="#FF5500">' + detail.Object_Name + '</font></a>';
    } else {
        trHTML += '<a title="点击查看" onclick="clickLabel2(\'' + detail.CM_ID + '\');" href="javascript:;"><font color="#FF5500">' + detail.Object_Name + '</font></a>';
    }
    trHTML += "</td>";
    trHTML += "<td>" + detail.Material_Name + "</td>";
    trHTML += "<td>" + detail.Producer_Name + "</td>";
    trHTML += "<td>" + detail.Safe_Days + "</td>";
    trHTML += "<td>" + detail.AmountPer + "</td>";
    trHTML += "<td>" + detail.Qty + "</td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);

}

