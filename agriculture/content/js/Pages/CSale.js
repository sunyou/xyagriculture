var bill = {} || bill;
var details = [];
var IsActive = 0;
var deleteList = '', newList = '';


function numToCny(num) {
    var strOutput = "";
    var strUnit = '仟佰拾亿仟佰拾万仟佰拾元角分';
    num += "00";
    var intPos = num.indexOf('.');
    if (intPos >= 0)
        num = num.substring(0, intPos) + num.substr(intPos + 1, 2);
    strUnit = strUnit.substr(strUnit.length - num.length);
    for (var i = 0; i < num.length; i++)
        strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(num.substr(i, 1), 1) + strUnit.substr(i, 1);
    return strOutput.replace(/零角零分$/, '整').replace(/零[仟佰拾]/g, '零').replace(/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/, '元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元");
}



function removeRows(id) {
    deleteList += $("#hf_DetailID_" + id).val() + ",";
    $("#row_" + id).remove();
    bindAmount();
}

function addRows(alow) {
    var id = (new Date()).getTime().toString(36);
    var newID = Guid.NewGuid().ToString();
    newList += newID + ",";
    var trHTML = "<tr id=\"row_" + id + "\" data-rowid=\"" + id + "\">";
    trHTML += "<td align='center'><input type='hidden' id='hf_DetailID_" + id + "' value='" + newID + "'><input type='button' onclick=\"removeRows('" + id + "')\" value='移除' title='移除' class='btn_removed' /></td>";    
    trHTML += "<td><input type='text' class='inw' name='txt_ObjectNo' data-message='产品名称' id='txt_ObjectNo_" + id + "' onclick=\"selectObject('" + id + "')\" />";
    trHTML += "<input type='hidden' id='txt_ObjectID_" + id + "' /></td>";
    trHTML += "<td><input type='text' class='inw' name='txt_Price' data-message='价格' name='Price' id='txt_Price_" + id + "'onblur=\"priceChange('" + id + "');\" style='width:40px;'/></td>";
    trHTML += "<td><input type='text' class='inw' name='txt_Qty' data-message='数量' name='Qty' id='txt_Qty_" + id + "'onblur=\"priceChange('" + id + "');\" style='width:40px;' /></td>";
    trHTML += "<td><label id='lbl_Unit_" + id + "'>公斤</label></td>";
    trHTML += "<td><input type='text' class='inw' name='txt_Amount' data-message='总价格' id='txt_Amount_" + id + "' style='width:60px;' onchange=\"priceAllChange('" + id + "');\"/></td>";
    trHTML += "<td><input type='text' class='inw' id='txt_Notes_" + id + "'/></td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);
    bindAmount();
}


function addEditRows(alow, details) {
    for (var i = 0; i < details.length; i++) {
        var id = (new Date()).getTime().toString(36);
        var trHTML = "<tr id=\"row_" + id + "\" data-rowid=\"" + id + "\">";
        trHTML += "<td align='center'><input type='hidden' id='hf_DetailID_" + id + "' value='" + details[i].Detail_ID + "'><input type='button' onclick=\"removeRows('" + id + "')\" value='移除' title='移除' class='btn_removed' /></td>";        
        trHTML += "<td><input type='text' name='txt_ObjectNo' class='inw' data-message='产品名称' id='txt_ObjectNo_" + id + "' onclick=\"selectObject('" + id + "')\" value='" + details[i].Object_No + "'/>";
        trHTML += "<input type='hidden' id='txt_ObjectID_" + id + "' class='inw' value='" + details[i].Object_ID + "' /></td>";
        trHTML += "<td><input type='text' name='txt_Price' class='inw' data-message='价格' name='Price' id='txt_Price_" + id + "'onblur=\"priceChange('" + id + "');\" style='width:40px;' value='" + details[i].Price + "'/></td>";
        trHTML += "<td><input type='text' name='txt_Qty' class='inw' data-message='数量' name='Qty' id='txt_Qty_" + id + "'onblur=\"priceChange('" + id + "');\" style='width:40px;' value='" + details[i].Qty + "' /></td>";
        trHTML += "<td><label id='lbl_Unit_" + id + "'>"+details[i].UnitName+"</label></td>";
        trHTML += "<td><input type='text' name='txt_Amount' class='inw' data-message='总价格' id='txt_Amount_" + id + "' value='" + details[i].Amount + "' style='width:60px;' onchange=\"priceAllChange('" + id + "');\"/></td>";
        trHTML += "<td><input type='text' class='inw' id='txt_Notes_" + id + "' value='" + details[i].Notes + "'/></td>";
        trHTML += "</tr>";
        $("#tb_Detail").append(trHTML);
        $("#SaleType_" + id).val(details[i].stype);
        typeChanged(id);
        bindAmount();
    }
}

function priceChange(id) {
    var price = $("#txt_Price_" + id).val(), qty = $("#txt_Qty_" + id).val();
    if (!isNaN(price) && !isNaN(qty)) {
        var val = (price) * (qty);
        $("#txt_Amount_" + id).val(Convert2Decimal(val, '0.00'));
        bindAmount();
    }
}


function priceAllChange(id) {
    var price = $("#txt_Price_" + id).val(), qty = $("#txt_Qty_" + id).val();
    if (!isNaN(price) && !isNaN(qty)) {
        bindAmount();
    }
}

function saveDetail() {
    var trs = $("#tb_Detail tr");
    details = [];
    $.each(trs, function (n, el) {
        var id = $(this).attr("data-rowid");
        var detail = {
            Detail_ID: $("#hf_DetailID_" + id).val(),
            Bill_ID: bill.Bill_ID,
            Object_ID: $("#txt_ObjectID_" + id).val(),
            Object_No: $("#txt_ObjectNo_" + id).val(),
            Qty: $("#txt_Qty_" + id).val(),
            UnitID: $("#SaleType_" + id).val() == 1 ? 1000 : 1001,
            UnitName: $("#SaleType_" + id).val() == 1 ? "公斤" : "件",
            Price: $("#txt_Price_" + id).val(),
            Amount: $("#txt_Amount_" + id).val(),
            Notes: $("#txt_Notes_" + id).val(),
            Type: 1
        }
        details.push(detail);
    });
}
function bindAmount() {
    var result = parseFloat(0);
    var trs = $("#tb_Detail tr");
    $.each(trs, function (n, el) {
        var id = $(this).attr("data-rowid");
        var amount = $("#txt_Amount_" + id).val();
        if (amount) {
            result = result + parseFloat(amount);
        }
    });
    $("#txt_Amount").val(result.toString());
    $("#txt_AmountShow").val(numToCny(result));
}

function bindDetail(detail) {
    var trHTML = "<tr>";
    trHTML += "<td><a>移除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a >修改</a></td>";
    trHTML += "<td>"
    trHTML += '<a title="点击查看" onclick="clickLabel(\'' + detail.Object_ID + '\');" href="javascript:;"><font color="#FF5500">' + detail.Object_No + '</font></a>';
    trHTML += "</td>";
    trHTML += "<td>" + detail.Price + "</td>";
    trHTML += "<td>" + detail.Qty + "</td>";
    trHTML += "<td>" + detail.UnitName + "</td>";
    trHTML += "<td>" + detail.Amount + "</td>";
    trHTML += "<td>" + detail.Notes + "</td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);

}


function typeChanged(id) {
    if ($("#SaleType_" + id).val() == '1') {
        $("#lbl_Unit_" + id).html("公斤");
    } else {
        $("#lbl_Unit_" + id).html("件");
    }
}


function CheckForm() {
    var chearr = [document.getElementsByName('txt_ObjectNo'),
        document.getElementsByName('txt_Price'),
        document.getElementsByName('txt_Qty'),
         document.getElementsByName('txt_Amount')];
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
                    IsActive = true;
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