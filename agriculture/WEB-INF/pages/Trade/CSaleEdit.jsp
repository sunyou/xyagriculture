<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>销售信息</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/JSON2.JS"></script>
    <script type="text/javascript" src="${ctx}/content/js/Guid.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/Pages/CSale.js?v=2015081410080444"></script>
</head>
<body>
    <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
      
           
            <tr>
                <th width="80">单号：</th>
                <td colspan="3">
 				<c:if test="${type=='1'}">自动生成</c:if>
	                    <c:if test="${type!='1'}">${bean.billNo }</c:if>
				</td>
                <input  type="hidden" id="hf_BillID" value="${bean.billId }"/>
                
            </tr>
            <tr>
                <th width="80">购货人：</th>
                <td >
                    <input type="text" id="txt_Reseller" class="inw" value="${bean.resellerName }"/></td>
                <th>开票日期：</th>
                <td>
                    <input type="text" id="txt_OpDate" class="inw" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" value="<fmt:formatDate value="${bean.opDate}" pattern="yyyy-MM-dd"/>"/></td>
            </tr>
            <tr>
                <td colspan="4" align="left">

                    <table>
                        <thead>
                            <tr>
                                <td colspan="8">
                                    <label class="butt">
                                        <input type="button" value="新增明细" onclick="addRows(true)" class="xybtn"  />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th width="40">操作</th>
                                <th width="60">产品</th>
                                <th width="60">单价(元)</th>
                                <th width="60">数量</th>
                                <th width="60">单位</th>
                                <th width="60">合计(元)</th>
                                <th>备注</th>
                            </tr>
                        </thead>
                        <tbody id="tb_Detail">
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <th>价格合计(大写)：</th>
                <td>
                    <input type="text" id="txt_AmountShow" class="inw" readonly="true"/>
                </td>
                <th>价格合计(小写)：</th>
                <td>
                    <input type="text" id="txt_Amount" class="inw" readonly="true"/>
                </td>
            </tr>
             <tr>
                <th>备注：</th>
                <td colspan="3">
                    <textarea id="txt_Notes" rows="3" cols="150" class="inw" >${bean.notes }</textarea></td>
            </tr>
            <tr>
                <th>开票单位：</th>
                <td>
                   <c:choose>
                    	<c:when test="${not empty bean.cofarmerName }">
                      		${bean.cofarmerName}
                    	</c:when>
                    	<c:otherwise>
                      		${cofarmerName }
                    	</c:otherwise>
                    </c:choose>
				</td>
                <th>开票人：</th>
                <td>
                <c:choose>
                    	<c:when test="${not empty bean.operators }">
                    	    <input name="operators"  type="hidden" id="txt_Operater"  value="${bean.operators}"/>
                    	
                      		${bean.operators}
                    	</c:when>
                    	<c:otherwise>
                    	    <input name="operators"  type="hidden" id="txt_Operater"  value="${operator}"/>
                    	
                      		${operator}
                    	</c:otherwise>
                    </c:choose>
            </tr>
           
          
        </table>
  	</div>
         <div align=center><br><br>
			   <input type="button" value="保存" onclick="submit()" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
</body>

<script type="text/javascript">
var type = 1;

$(function () {
    if (GetQueryString("Type"))
    {
        type = GetQueryString("Type");
    }
    if (type == 1) {
       // $.ajax({
      //      url: "/Package/getNew",
      //      dataType: "json",
      //      type: "GET",
      //      complete: function (state) {
      //          var ob = eval("(" + state.responseText + ")");
      //          bill = ob;
      //          $("#txt_Operater").val(bill.OperateUser);
       //         $("#txt_CoFarmer").val(bill.CoFarmer_Name);
       //         $("#hf_CoFarmerID").val(bill.CoFarmer_ID);
       //         $("#txt_PackageNo").val(bill.Package_No);
       //         $("#txt_OpDate").val(new Date().format("yyyy-MM-dd"));
      //      }
      //  });
        addRows(false);
    } else if (type == 2) {
        $.ajax({
            url: "${ctx}/CSale/getCSaleDetails.ajax",
            dataType: "json",
            type: "GET",
            data: { "id": GetQueryString('id').toString().trim() },
            success: function (data) {
                var ob = data.detailBeans;
//                bill = ob.Bill;
//                $("#txt_Operater").val(bill.OperateUser);
//                $("#txt_CoFarmer").val(bill.CoFarmer_Name);
//                $("#hf_CoFarmerID").val(bill.CoFarmer_ID);
//                $("#txt_PackageNo").val(bill.Package_No);
//                $("#txt_OpDate").val(new Date().format("yyyy-MM-dd"));
//                $("#txt_Amount").val(bill.Amout);
//                $("#txt_UnitID").val(bill.UnitID);
//                $("#txt_Operater").val(bill.OperateUser);
                addEditRows(true,ob);
            }
        });        
    }
});

function selectObject(id) {
    openHelper('${ctx}/Helper/PlotHarvest_Helper.html', { id: "txt_ObjectNo_" + id + ",txt_ObjectID_" + id + "", key: 'PLOTHARVEST_NO,PLOTOPER_ID' }, '已采收产品--选择帮助界面', 660, 400);
}

function submit() {
	bill.Bill_ID = $("#hf_BillID").val();
    bill.Reseller_Name = $("#txt_Reseller").val();
    bill.Amount = $("#txt_Amount").val();
    bill.Notes = $("#txt_Notes").val();
    bill.Operators = $("#txt_Operater").val();
    bill.Op_Date = $("#txt_OpDate").val();
    IsActive = 0;
    CheckForm();
    if (IsActive > 0) {
        return;
    }
    saveDetail();
    var type = GetQueryString("Type");
    $.ajax({
       	url:"${ctx}/CSale/CSaleEdit.ajax",
        dataType: "json",
        type: "POST",
        data: { "Bill": JSON.stringify(bill), "Details": JSON.stringify(details), "type": type, "deleteList": deleteList, "newList": newList },
        success: function (ob) {
           if (ob && ob.success){
            	$("#txt_PackageNo").val(ob.packageNo);
                art.dialog.tips(ob.message,1);
                art.dialog.close();
              
            } else {
                if (ob.message)
                    art.dialog.tips(ob.message, 2);
                else
                    alert(state.responseText);
            }
        },
         error: function(data, status, e) { 
                    alert("异常！"); 
         }
        
    });
}

</script>
</html>
