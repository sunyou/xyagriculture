var bill = {} || bill;
var details = [];

$(document).ready(function () {
    $.ajax({
        url: "/SSale/getNew",
        dataType: "json",
        type: "GET",
        complete: function (state) {
            var ob = eval("(" + state.responseText + ")");
            bill = ob;
            txt_OpDate.value = bill.Bill_Date;
            txt_Operater.value = bill.Operater;
            txt_Supplier.value = bill.Supplier_Name;
        }
    });
});

function SaveSSale() {
    saveDetail();
    bill.Customer_Name = txt_Customer.value
    bill.Amount = lbl_Amount.innerHTML,
    bill.Remark = txt_Notes.value;
    bill.IsActive = true;
    bill.Operater = txt_Operater.value;
    $.ajax({
        url: "/SSale/SaveBill",
        dataType: "json",
        type: "POST",
        data: { "Bill": JSON.stringify(bill), "Details": JSON.stringify(details) },
        complete: function (state) {
            var ob = eval("(" + state.responseText + ")");
            if (ob.success) {
                alert(obj.message)
            }
        }
    });
}

function removeRows(id) {
    details.length == 0;
    $("#row_" + id).remove();
}

function addRows(alow) {
    var id = (new Date()).getTime().toString(36);
    var trHTML = "<tr id=\"row_" + id + "\" data-rowid=\"" + id + "\">"
    if (!alow)
        trHTML += "<td>&nbsp;</td>";
    else
        trHTML += "<td align='center'><input type='button' onclick=\"$('#row_" + id + "').remove();\" value='移除' title='移除' class='btn_removed' /></td>";
    trHTML += "<td><select id=\"SaleType_" + id + "\" onchange=\"typeChanged('" + id + "');\"><option value='1'>肥料</option><option value='2'>农药</option></select></td>";
    trHTML += "<td><input type='text' id='txt_MaterialName_" + id + "' onclick=\"selectObject('" + id + "')\"><input type='hidden' id='hd_MaterialID_" + id + "'></td>";
    trHTML += "<td><input type='text' name='Price' id='txt_Price_" + id + "'onblur=\"priceChange('" + id + "');\" style='width:40px;'/></td>";
    trHTML += "<td><input type='text' name='Qty' id='txt_Qty_" + id + "'onblur=\"priceChange('" + id + "');\" style='width:40px;' /></td>";
    trHTML += "<td><input type='text' id='txt_UnitName_" + id + "'>";
    trHTML += "<td><input type='text' id='txt_Amount_" + id + "' style='width:60px;'/></td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);
}

function priceChange(id) {
    var price = $("#txt_Price_" + id).val(), qty = $("#txt_Qty_" + id).val();
    if (!isNaN(price) && !isNaN(qty)) {
        var val = (price) * (qty);
        $("#txt_Amount_" + id).val(Convert2Decimal(val, '0.00'));
    }
    bindAmount();
}

function saveDetail() {
    details = [];
    var trs = $("#tb_Detail tr");
    $.each(trs, function (n, el) {
        var id = $(this).attr("data-rowid");
        var detail = {
            Detail_ID: Guid.NewGuid().ToString(),
            Bill_ID: bill.Bill_ID,
            Type: $("#SaleType_" + id).val(),
            Material_Name: $("#txt_MaterialName_" + id).val(),
            Material_ID: $("#hd_MaterialID_" + id).val(),            
            Qty: $("#txt_Qty_" + id).val(),
            UnitName: $("#txt_UnitName_" + id).val(),
            Price: $("#txt_Price_" + id).val(),
            Amount: $("#txt_Amount_" + id).val()
        }
        details.push(detail);
    })

}
function bindAmount() {
    var result = parseFloat(0);
    var trs = $("#tb_Detail tr");
    $.each(trs, function (n, el) {
        var id = $(this).attr("data-rowid");
        var amount = $("#txt_Amount_" + id).val();
        result = result + parseFloat(amount);
    });
    lbl_Amount.innerHTML = result.toString();
}

function bindDetail(detail) {
    var trHTML = "<tr>";
    trHTML += "<td><a>移除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a >修改</a></td>";
    trHTML += "<td>" + detail.Material_Name + "</td>";
    trHTML += "<td>" + detail.Brand + "</td>";
    trHTML += "<td>" + detail.DoseType + "</td>";
    trHTML += "<td>" + detail.Produce_No + "</td>";
    trHTML += "<td>" + detail.Specification + "</td>";
    trHTML += "<td>" + detail.Producer + "</td>";
    trHTML += "<td>" + detail.ProductionDate + "</td>";
    trHTML += "<td>" + detail.Price + "</td>";
    trHTML += "<td>" + detail.Qty + "</td>";
    trHTML += "<td>" + detail.UnitName + "</td>";
    trHTML += "<td>" + detail.Amount + "</td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);

}
function typeChanged(id) {
    if ($("#Type_" + id).val() == '1') {
        $("#td_DoseType_" + id).html("<input type='text' id='txt_DoseType_" + id + "'>");
    } else {
        $("#td_DoseType_" + id).html("<select id=\"DoseType_" + id + "\" ><option value='1'>液体</option><option value='2'>固体</option><option value='3'>气雾剂</option><option value='4'>颗粒</option><option value='5'>水分散粒剂</option><option value='6'>水溶剂</option><option value='7'>熏蒸剂</option><option value='9'>片剂</option></select></td><option value='10'>烟剂</option><option value='12'>缓释剂</option><option value='13'>微胶囊剂</option><option value='99'>其它</option></select>");
    }
}
function selectObject(id) {
    if ($("#SaleType_" + id).val() == '1') {
        openHelper('/Pages/Helper/MaterialFertilizers_Helper.aspx', { id: "txt_MaterialName_" + id + ",hd_MaterialID_" + id + "", key: 'Material_Name,Material_ID' }, '肥料--选择帮助界面', 500, 400);
    } else {
        openHelper('/Pages/Helper/MaterialCure_Helper.aspx', { id: "txt_MaterialName_" + id + ",hd_MaterialID_" + id + "", key: 'Material_Name,Material_ID' }, '农药--选择帮助界面', 500, 400);
    }
}