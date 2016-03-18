<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	新增包装信息
</title>
 <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
  
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/json2.js"></script>
    
    <script type="text/javascript" src="${ctx}/content/js/Guid.js"></script>
      <script type="text/javascript" src="${ctx}/content/js/Pages/Package.js?v=2015081410080444"></script>
    
</head>
<body>
    <form method="post" action="" id="form1">


      <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
              
           <input  type="hidden" id="hf_PackageID" value="${bean.packageUid }"/>
             
            <tr>
                <th width="80">包装编号：</th>
                <td width="120">
                <c:if test="${type=='1'}">
                	自动生成
                  <!--  <input type="text" id="txt_PackageNo" class="inw" value="(自动生成)" readonly="true" /></td>  -->
                </c:if>
                <c:if test="${type!='1'}">
                	${bean.packageNo }
                    <!--<input type="text" id="txt_PackageNo" class="inw" value="${bean.packageNo }" readonly="true" /></td>  -->
                </c:if>
                <th>包装日期：</th>
                <td>
                    <input type="text" id="txt_OpDate" class="inw" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" value="<fmt:formatDate value="${bean.packageDate}" pattern="yyyy-MM-dd"/>"/></td>
            </tr>
            <tr>
                <th>包装数量：</th>
                <td>
                    <input type="text" id="txt_Amount" class="inw" value="${bean.amout }"/>
                    </td>
                 <th>包装单位：</th>
                <td>
                 
                    <input type="text" id="txt_Unit" value="${bean.unitname}" class="inw" readonly="true" style="width:80px" />
                     <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/Units_Helper.html', { id: 'txt_UnitID,txt_Unit', key: 'UNITID,UNITNAME' }, '单位选择界面', 660, 400);"/>
              
                     </td>
                    <input type="hidden" id="txt_UnitID" value="${bean.unitid}"/>
                </td>
            </tr>
            
             <tr>
                   
 					<th>采收批次：</th>
                    <td>
                        <input name="txt_HarvestNo_1" id="txt_HarvestNo_1"  type="text" class="inw" readonly="readonly" />
                   
                      <input type=button class='rowSelectButton' value='选择' onclick="selectObject('1')" />
              
                    </td>
                     <th>产品：</th>
                    <td>
                        <input name="txt_GoodsValue_1"  type="text" id="txt_GoodsValue_1" class="inw" readonly="true" />
                    </td>
                </tr>
                 <tr>
                   
 					<th>数量：</th>
                    <td colspan="3">
                        <input name="txt_Amount_1"  type="text" id="txt_Amount_1" class="inw"  />公斤
                    </td>
                    <!--  
                     <th>单位：</th>
                    <td id="lbl_Unit_1">公斤</td>
                    -->
                    <input type="hidden" id="hf_DetailID_1"/>
                    <input type='hidden' id='txt_HarvestID_1' />
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
                    <input type="hidden" class="inw" id="hf_CoFarmerID"/>
                </td>
                <th>开票人：</th>
                <td>
                	<c:choose>
                        	<c:when test="${not empty bean.operateuser }">
                        	${bean.operateuser}
		                        <input type="hidden"  value="${bean.operateuser}"  id="txt_Operater" class="inw"  />
                        	</c:when>
                        	<c:otherwise>
                        	${operator }
		                        <input  type="hidden"  value="${operator }"  id="txt_Operater" class="inw"  />
                        	</c:otherwise>
                        </c:choose>
            </tr>     
            <!--       
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
                                <td width="40">操作</td>
                                <td width="60">采收编号</td>
                                <td width="60">产品</td>
                                <td width="60">数量</td>
                                <td width="60">单位</td>
                            </tr>
                        </thead>
                        <tbody id="tb_Detail">
                        </tbody>
                    </table>
                </td>
            </tr>     
            -->        
          
        </table>
    	</div>
        <div align=center><br><br>
			   <input type="button" name="btn_Save" value="提交" id="btn_Save" onclick="savePackage()" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
	    </div>
    </form>
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
  //      addRows(false);
    } else if (type == 2) {
        $.ajax({
            url: "${ctx}/Package/getPackageDetails.ajax",
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
    openHelper('${ctx}/Helper/PlotHarvest_Helper.html', { id: "txt_HarvestNo_" + id + ",txt_HarvestID_" + id + ",txt_GoodsValue_" + id, key: 'PLOTHARVEST_NO,PLOTOPER_ID,GOODSVALUE' }, '已采收产品--选择帮助界面', 660, 400);
}

function savePackage() {
 	bill.Package_ID = $("#hf_PackageID").val();
   // bill.Package_No = $("#txt_PackageNo").val();
    bill.Package_Date = $("#txt_OpDate").val();
    bill.Good_Value = $("#txt_GoodsValue_1").val();
    bill.CoFarmer_ID = $("#hf_CoFarmerID").val();
    bill.Amout=$("#txt_Amount").val();
    bill.UnitID = $("#txt_UnitID").val();
    bill.IsActive = true;
    bill.OperateUser = $("#txt_Operater").val();
    var details=saveDetail();
    $.ajax({
       		type:"post",
       		url:"${ctx}/Package/PackageEdit.ajax",
       		data: { "Bill": JSON.stringify(bill), "Details": JSON.stringify(details), "type": type, "deleteList": deleteList, "newList": newList },

       		 success: function (ob) {
            //alert(typeof ob + "消息:" + ob.success);
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
