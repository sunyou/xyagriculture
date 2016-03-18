<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑物资采购</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/JSON2.JS"></script>
    <script type="text/javascript" src="${ctx}/content/js/Guid.js"></script>
    <script type="text/javascript">
        var bill = [];
        $(document).ready(function () {
            $("#txt_Amount").ligerSpinner({ minValue: 1, maxValue: 10000, type: 'int' });
            $.ajax({
                url: "/CoFarmerMaterial/getNew",
                dataType: "json",
                type: "GET",
                complete: function (state) {
                    var ob = eval("(" + state.responseText + ")");
                    bill = ob;
                    $("#hd_CoFarmerID").val(bill.CoFarmer_ID);
                    $("#txt_CoFarmerName").val(bill.CoFarmer_Name);
                }
            });
            $("#form1").validate({
                errorPlacement: function (error, element) {
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                    txt_CoFarmerName: "required",
                    txt_Object_ID: "required",
                    txt_Amount: "required",
                    txt_UnitID: "required",
                    txt_Supplier_ID: "required",
                    txt_OperateDate: "required",
                    txt_OperateUser: "required"

                },
                messages: {
                    txt_CoFarmerName: "请填写生产者",
                    txt_Object_ID: "请填写物资名称",
                    txt_Amount: "请填写数量",
                    txt_UnitID: "请填写单位",
                    txt_Supplier_ID: "请填写经销商",
                    txt_OperateDate: "请填写采购日期",
                    txt_OperateUser: "请填写采购人"
                }
            });
        });

        function SaveThis() {
            var Bill = {
                CoMat_UID: Guid.NewGuid().ToString(),
                CoFarmer_ID: $("#hd_CoFarmerID").val(),
                Object_ID: $("#hd_ObjectID").val(),
                Object_Name: $("#txt_ObjectName").val(),
               // Type: $('input[@name="rdo_TypeCode"][checked]').val(),
                Type: "${materialType}",
                Qty: $("#txt_Amount").val(),
                UnitID: $("#hf_UnitID").val(),
                Supplier_ID: $("#hf_SupplierID").val(),
                Supplier_Name: $("#txt_SupplierName").val(),
                Produce_Name: $("#txt_ProduceName").val(),
                OperateDate: $("#txt_OperateDate").val(),
                OperateUser: $("#txt_OperateUser").val()
            }
            $.ajax({
                url: "/CoFarmerMaterial/SaveCoFarmerMaterial",
                dataType: "json",
                type: "POST",
                data: { "Bill": JSON.stringify(Bill) },
                complete: function (state) {
                    var ob = eval("(" + state.responseText + ")");
                    if (!ob.success) {
                        alert(obj.message)
                    } else {
                        alert('保存成功')
                        parent.close();
                    }
                }
            });
        }
        function MaterialSearch(id) {
        //  var typecodeVal=$('input[@name="rdo_TypeCode"][checked]').val();
        //  alert(typecodeVal);
         // if (typecodeVal!=1|| typecodeVal!=2) {
			//alert("请选择物资类型");
			//return;
		  //  }
            /**var url = '${ctx}/MaterialSelectHelper/MaterialQuery_Helper.html?typeCode=' + $('input[@name="rdo_TypeCode"][checked]').val();**/
            var url = '${ctx}/MaterialSelectHelper/MaterialQuery_Helper.html?typeCode=${materialType}';
            
            openHelper(url, { id: "hd_ObjectID,txt_ObjectName,txt_ProduceName", key: 'MATERIAL_ID,MATERIAL_NAME,PRODUCER' }, '投入品选择界面', 660, 360);
        }
        function AddMaterial() {
            var url = '${ctx}/Base/Material/';
            var type = $('input[@name="rdo_TypeCode"][checked]').val();
            if (type == '1')
                url += 'FertilizerEidt.html?Type=1';
            else
                url += 'PesticidesEdit.html?type=1';
            ligerWin(660, 360, url, '新增投入品');
        }
    </script>
</head>
<body>
    <form method="post" action="${ctx}/CoFarmerMaterialV/CoFarmerMaterialEdit.html" id="form1">
       <div class="edit_panel">
			<table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th width="80">
                    <div class="th_text">生产者:</div>
                </th>
                <td>
                    <input disabled="disabled" type="text" name="txt_CoFarmerName" id="txt_CoFarmerName" class="inw"  value="${cCoFarmerName}" />
                    <input type="hidden" id="hd_CoFarmerID" name="hd_CoFarmerID" value="${bean.cofarmerId}"/>
                </th>
              <th width="70">
                    <div class="th_text">生产商:</div>
                </th>
                <td>
                    <input type="text" name="txt_ProduceName" id="txt_ProduceName" value="${bean.produceName}" class="inw"  readonly="readonly"/>
                </td>
              
            </tr>
            <tr>
                <th>
                    <div class="th_text">采购数量:</div>
                </th>
                <td>
                    <input type="text" name="txt_Amount" id="txt_Amount"   style="float: left;" value="${bean.qty}"/>
                </td>
           
                  <th>
                    <div class="th_text">单位:</div>
                </th>
                <td>
                	<input type="text" name="txt_UnitName" id="txt_UnitName" class="inw" style="float: left; width: 50px;" value="${unitsBean.unitname}" />
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/UnitsHelper/Units_Helper.html', { id: 'hf_UnitID,txt_UnitName', key: 'UNITID,UNITNAME' }, '单位选择界面', 660, 360);"  />
                    <input type="hidden" id="hf_UnitID" name="hf_UnitID" value="1000" />
                	<input type="hidden" id="rdo_TypeCode" name="rdo_TypeCode" value="${materialType }">
                <!-- 
                <input type="radio" name="rdo_TypeCode" id="rdo_TypeCode1" value="1" checked="checked" <c:if test="${bean.cmtype=='1'}">checked="checked"</c:if> /><label for="rdo_TypeCode1">肥料</label>
                    <input type="radio" name="rdo_TypeCode" id="rdo_TypeCode2" value="2" <c:if test="${bean.cmtype=='2'}">checked="checked"</c:if> /><label for="rdo_TypeCode2">农药</label>
                 -->
                    
                </td>
            </tr>
            <tr>
                
				<th>
                    <div class="th_text">物资名称:</div>
                </th>
                <td>
                    <input type="text" name="txt_ObjectName" id="txt_ObjectName" class="inw" value="${bean.objectName}"/>
                    <input type=button class='rowSelectButton' value='选择' onclick="MaterialSearch()" />
                     <input type="hidden" id="hd_ObjectID" name="hd_ObjectID" value="${bean.objectId}"/>
                        <!-- 
                         没有找到？点击<a href="javascript:void(0);" onclick="AddMaterial()">这里</a>添加一个
                   
                         -->
                        <br/>
                   
                </td>
           		<th>
                    <div class="th_text">经销商:</div>
                </th>
                <td>
                    <input type="text" name="txt_SupplierName" id="txt_SupplierName" value="${bean.supplierName}" class="inw" />
                    <input type="hidden" id="hf_SupplierID" name="hf_SupplierID" value="${bean.supplierId}"/>
                </td>
           
               
            </tr>
            <tr>
                <th>
                    <div class="th_text">采购日期:</div>
                </th>
                <td>
                    <input type="text" id="txt_OperateDate" value="<fmt:formatDate value="${bean.operatedate}"	pattern="yyyy-MM-dd" />" name="txt_OperateDate" class="Wdate inw" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" /></td>
           
                <th>
                    <div class="th_text">采购人:</div>
                </th>
                <td>
                    <input type="text" name="txt_OperateUser" id="txt_OperateUser" value="${bean.operateuser}" class="inw" />
                </td>
            </tr>
            <tr>
                <th>
                    <div class="th_text">电子影印件:</div>
                </th>
                <td colspan="3">
                    <input type="text" name="txt_DocFileSrc" id="txt_DocFileSrc" value="${bean.docfilesrc}" class="inw" />
                </td>
            </tr>
           
        </table>
        
         <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        
          <input type="hidden" name="comat_uID" id="comat_uID" value="${bean.comatUid }" />
		</div>
    </form>
</body>
</html>
