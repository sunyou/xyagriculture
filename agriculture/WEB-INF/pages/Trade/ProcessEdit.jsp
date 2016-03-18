<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农产品加工新增/修改</title>
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
    <script type="text/javascript">
        $(document).ready(function () {

            $("#form1").validate({
                //debug: true,
				 onfocusout : false,
				 showErrors : function(errorMap, errorList) {
				   var msg = "";  
				 $.each(errorList, function(i, v) { 
				  msg += (v.message + "\r\n");   });
				  if (msg != "")  alert(msg);   
				}, 
                errorPlacement: function (error, element) {
                    //".AreaList"
                    //var placement = $(element).parents("td").next();
                    //placement.text('');
                    //error.appendTo(placement);
                },
                rules: {
                    operdate: "required",
                    txt_Goods_ID: "required",
                    txt_PlantLot_ID: "required",
                     txt_Harvest_ID: "required",
                      processQty: "required"
                },

                messages: {
                    operdate: "请选择加工日期",
                    txt_Goods_ID: "请选择农作物",
                    txt_PlantLot_ID: "请选择种植批次",
                     txt_Harvest_ID: "请选择采收批次",
                    processQty: "请填写加工数量"
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="${ctx}/Process/ProcessEdit.ajax" id="form1">
      <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
           
            <tr>
                <th width="80">加工日期：</th>
                <td>
                    <input name="operdate" type="text" id="txt_Process_Date" class="inw" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly" value="<fmt:formatDate value="${bean.operateDate}" pattern="yyyy-MM-dd"/>"/>
                </td>
            
                <th>农作物：</th>
                <td>
                    <input name="txt_Goods_ID" value="${bean.goodsName}" type="text" id="txt_Goods_ID" class="inw" readonly="readonly" />
                    <input type=button class='rowSelectButton' value='选择' onfocus="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_Goods_ID,hf_Goods_ID', key: 'GOODS_NAME,GOODS_ID' }, '农作物--选择帮助界面', 660, 400);" />
               
                </td>
                
            </tr>
            <tr>
              
                
          
                <th>种植批次：</th>
                <td>
                    <input name="txt_PlantLot_ID" type="text" value="${bean.lotNo}" id="txt_PlantLot_ID" class="inw"   readonly="readonly"  />
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlantLot_Helper.html', { id: 'txt_PlantLot_ID,hf_PlantLot_ID', key: 'LOT_NO,PLANTLOT_ID' }, '种植批次--选择帮助界面', 660, 400);" />
               
                </td>
                 <th>采收批次：</th>
               <td>
                    <input name="txt_Harvest_ID" value="${bean.plotharvestNo}"   type="text" id="txt_Harvest_ID" class="inw"  readonly="readonly"  />
                    <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html', { id: 'txt_Harvest_ID,hf_Harvest_ID', key: 'PLOTHARVEST_NO,PLOTOPER_ID' }, '采收批次--选择帮助界面', 660, 400);" />
              
               </td>
            </tr>
            <tr>
               
           
                <th>加工数量：</th>
                <td>
                    <input name="processQty" type="text" value="${bean.processQty}" id="txt_Qty" class="inw" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"   />kg</td>
                 <th>说明：</th>
                <td >
                    <input name="notes" type="text" value="${bean.notes}" id="txt_Note" class="inw" /></td>
                
            </tr>

            <tr>
               
           
                <th>加工人：</th>
                <td>
                		<c:choose>
                        	<c:when test="${not empty bean.operators }">
                        	 	<input name="operater"  type="hidden" id="txt_Operater"  value="${bean.operators}"/>
		                        ${bean.operators}
                        	</c:when>
                        	<c:otherwise>
                        		<input name="operater"  type="hidden" id="txt_Operater"  value="${operator}"/>
		                        ${operator }
                        	</c:otherwise>
                        </c:choose>
                  <th>生产商：</th>
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
            </tr>

           
        </table>
        </div>
         <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
   		<input type="hidden" name="plotoperId" value="${bean.plotoperId}"/>
        <c:choose>
        	<c:when test="${not empty bean.cofarmerId }">
          		<input name="cofarmerId" type="hidden"  value="${bean.cofarmerId}"  class="inw" />
        	</c:when>
        	<c:otherwise>
          		<input name="cofarmerId" type="hidden"  value="${cofarmerId }" class="inw" />
        	</c:otherwise>
        </c:choose>
        <input type="hidden" name="plantlotId" id="hf_PlantLot_ID" value="${bean.plantlotId }" />
        <input type="hidden" name="harvestoperateId" id="hf_Harvest_ID" value="${bean.harvestoperateId}"/>
        <input type="hidden" name="goodsId" id="hf_Goods_ID" value="${bean.goodsId}" />
        <input type="hidden" name="hf_Process_ID" id="hf_Process_ID" value="86e1ee62-0748-4db0-a462-289a688ad6ba" />
    </form>
</body>
</html>
