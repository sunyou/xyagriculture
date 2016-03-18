var bill = {} || bill;

var deleteList = "", newList = "";


function removeRows(id) {
    deleteList += $("#hf_DetailID_" + id).val() + ",";
    $("#row_" + id).remove();
}

function addRows(alow) {
    var id = (new Date()).getTime().toString(36);
    var newID = Guid.NewGuid().ToString();
    newList += newID + ",";
    var trHTML = "<tr id=\"row_" + id + "\" data-rowid=\"" + id + "\">" 
    trHTML += "<td align='center'><input type='hidden' id='hf_DetailID_" + id + "' ><input type='button' onclick=\"removeRows('" + id + "')\" value='移除' title='移除' class='btn_removed' /></td>";
    trHTML += "<td><input type='text' id='txt_HarvestNo_" + id + "' class='inw' onclick=\"selectObject('" + id + "')\" />";
    trHTML += "<input type='hidden' id='txt_HarvestID_" + id + "' class='inw' /></td>";
    trHTML += "<td><input type='text' id='txt_GoodsValue_" + id + "' class='inw' style='width:60px;' readonly='true'/></td>";
    trHTML += "<td><input type='text' id='txt_Amount_" + id + "' class='inw' style='width:60px;'/></td>";
    trHTML += "<td><label id='lbl_Unit_" + id + "'>公斤</label></td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);
}

function addEditRows(alow, details) {
    for (var i = 0; i < details.length; i++) {
     //   var id = (new Date()).getTime().toString(36);
   //     var trHTML = "<tr id=\"row_" + id + "\" data-rowid=\"" + id + "\">"
    //    trHTML += "<td align='center'><input type='hidden' id='hf_DetailID_" + id + "' value='" + details[i].Detail_UID + "'><input type='button' onclick=\"removeRows('" + id + "')\" value='移除' title='移除' class='btn_removed' /></td>";
   //     trHTML += "<td><input type='text' id='txt_HarvestNo_" + id + "' class='inw' onclick=\"selectObject('" + id + "')\" value='" + details[i].Harvest_No + "' />";
    //    trHTML += "<input type='hidden' id='txt_HarvestID_" + id + "' class='inw' value='" + details[i].HarvestOperate_ID + "' /></td>";
    //    trHTML += "<td><input type='text' id='txt_GoodsValue_" + id + "' class='inw' style='width:60px;' readonly='true' value='" + details[i].GoodsValue + "'/></td>";
   //     trHTML += "<td><input type='text' id='txt_Amount_" + id + "' class='inw' style='width:60px;' value='" + details[i].Qty + "'/></td>";
   //     trHTML += "<td><label id='lbl_Unit_" + id + "'>"+details[i].UnitName+"</label></td>";
   //     trHTML += "</tr>";      
    //    $("#tb_Detail").append(trHTML);
    	$("#hf_DetailID_1").val(details[i].Detail_UID);
    	$("#txt_HarvestNo_1").val(details[i].Harvest_No);
    	$("#txt_HarvestID_1").val(details[i].HarvestOperate_ID);
   
    	$("#txt_GoodsValue_1").val(details[i].GoodsValue);
    	$("#txt_Amount_1").val(details[i].Qty);
    	
    }
}

function saveDetail() {
    var details = [];
  //  var trs = $("#tb_Detail tr");
   // $.each(trs, function (n, el) {
       // var id = $(this).attr("data-rowid");
    	var id="1";
        var detail = {
            Detail_UID: $("#hf_DetailID_"+id).val(),
           // Package_UID: bill.Package_UID,
            HarvestOperate_ID: $("#txt_HarvestID_" + id).val(),
            Harvest_No: $("#txt_HarvestNo_" + id).val(),
            GoodsValue:$("#txt_GoodsValue_"+id).val(),
            Qty: $("#txt_Amount_" + id).val(),
            UnitID: 1000,
            UnitName:"公斤"
        }
        details.push(detail);
   // })

    return details;
}

function bindDetail(detail) {
    var trHTML = "<tr>";
    trHTML += "<td><a>移除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a >修改</a></td>";
    trHTML += "<td>"
    if (detail.Type == '1') {
        trHTML += '<a title="点击查看" onclick="clickLabel(\'' + detail.Object_ID + '\');" href="javascript:;"><font color="#FF5500">' + detail.Object_No + '</font></a>';
    } else {
        trHTML += '<a title="点击查看" onclick="clickLabel2(\'' + detail.Object_ID + '\');" href="javascript:;"><font color="#FF5500">' + detail.Object_No + '</font></a>';
    }
    trHTML += "</td>";
    trHTML += "<td>" + detail.Price + "</td>";
    trHTML += "<td>" + detail.Qty + "</td>";
    trHTML += "<td>" + detail.UnitName + "</td>";
    trHTML += "<td>" + detail.Amount + "</td>";
    trHTML += "<td>" + detail.Notes + "</td>";
    trHTML += "</tr>";
    $("#tb_Detail").append(trHTML);

}

