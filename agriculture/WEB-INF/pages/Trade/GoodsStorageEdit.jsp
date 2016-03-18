<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>农产品存储新增/修改</title>
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
        <!--//
        $(document).ready(function () {
            $("#form1").validate({
                //debug: true,
                onfocusout: false,
                showErrors: function (errorMap, errorList) {
                    var msg = "";
                    $.each(errorList, function (i, v) {
                        msg += (v.message + "\r\n");
                    });
                    if (msg != "") alert(msg); 
                },
                errorPlacement: function (error, element) {

                },
                rules: {
                    operdate: "required",
                    txt_SH_Name: "required",
                    txt_Goods_ID: "required",
                    txt_Harvest_ID: "required",
                    txt_Cofarmer_ID: "required"
                },
                messages: {
                    operdate: "填写操作日期",
                    txt_SH_Name: "填写仓库",
                    txt_Goods_ID: "选择农作物",
                    txt_Harvest_ID: "选择采收",
                    txt_Cofarmer_ID: "选择合作社"
                }
            });

        });
        //-->
    </script>
</head>
<body>
    <form method="post" action="${ctx}/GoodsStorage/GoodsStorageEdit.ajax?type=1" id="form1">
		<input type="hidden" name="plotoperId" value="${bean.plotoperId}"/>
        <div class="edit_panel">
            <table class="edit_table" width="99%" border="0" cellpadding="0" cellspacing="0">
              
                <tr>
                    <th width="80">存储日期：</th>
                    <td>
                        <input name="operdate" type="text" id="txt_OperDate" class="inw" class="Wdate" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly"  value="<fmt:formatDate value="${bean.operdate}" pattern="yyyy-MM-dd"/>"/></td>
                  <th>仓库名称：</th>
                    <td>
                        <input name="txt_SH_Name"  value="${bean.shName}" type="text" id="txt_SH_Name" class="inw"   readonly="readonly"/>
                        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/StoreHouse_Helper.html', { id: 'txt_SH_Name,hf_SH_ID', key: 'SH_NAME,SH_ID' }, '仓库--选择帮助界面', 660, 400);"/>
                   
                    </td>
                    
                </tr>
               
                
               
                <tr>
                    <th>农作物：</th>
                    <td>
                        <input name="txt_Goods_ID" value="${bean.goodsName}"  type="text" id="txt_Goods_ID" class="inw"  readonly="readonly"/>
                         <input type=button class='rowSelectButton' value='选择' onfocus="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_Goods_ID,hf_Goods_ID', key: 'GOODS_NAME,GOODS_ID' }, '农作物--选择帮助界面', 660, 400);" />
                    </td>
 					<th>采收批次：</th>
                    <td>
                        <input name="txt_Harvest_ID" value="${bean.plotharvestNo}"   type="text" id="txt_Harvest_ID" class="inw"  readonly="readonly"/>
                        <input type=button class='rowSelectButton' value='选择' onclick="openHelper('${ctx}/Helper/PlotHarvest_Helper.html', { id: 'txt_Harvest_ID,hf_Harvest_ID', key: 'PLOTHARVEST_NO,PLOTOPER_ID' }, '采收批次--选择帮助界面', 660, 400);"  />
                   
                    </td>
                </tr>
         
                <tr>
                    <th>温度(℃)：</th>
                    <td>
                        <input name="tem"  value="${bean.tem}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  type="text" id="txt_Tem" class="inw" />
                    </td>
 					<th>湿度(%)：</th>
                    <td>
                        <input name="hum"  value="${bean.hum}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  type="text" id="txt_Hum" class="inw" />
                    </td>

                </tr>
               
                <tr>
                    <th>压强(kPa)：</th>
                    <td>
                        <input name="pres"  value="${bean.pres}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  type="text" id="txt_Pres" class="inw" />
                    </td>
 					<th>光照强度(Lux)：</th>
                    <td>
                        <input name="beam"  value="${bean.beam}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  type="text" id="txt_Beam" class="inw" />
                    </td>

                </tr>
              
                <tr>
                    <th>存储方式：</th>
                    <td>
                    	<asia:select id="ddl_Type_ID" name="stype"
							dictId="STORAGE_MOTHOD" nullOption="false" nullText="请选择"
							defaultValue="${bean.stype}">
						</asia:select>
                      
                    </td>
 					<th>存储天数：</th>
                    <td>
                        <input name="days"  value="${bean.days}" onkeyup="value=value.replace(/[^\d\.]/g,'')"    onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d\.]/g,''))"  type="text" id="txt_Days" class="inw" />
                     </td>

                </tr>
               
                <tr>
                    <th>说明：</th>
                    <td colspan="3">
                        <input name="remark"  value="${bean.remark}" type="text" id="txt_Remark" class="inw" style="width:500px"/></td>

                </tr>
               <tr>
                  <th>存储人：</th>
                    <td>
                    	<c:choose>
                        	<c:when test="${not empty bean.operater }">
                        	 	<input name="operater"  type="hidden"  id="txt_Operater"  value="${bean.operater}"/>
		                        ${bean.operater}
                        	</c:when>
                        	<c:otherwise>
                        		<input name="operater"  type="hidden"   id="txt_Operater" value="${operator}"/>
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
            
            <div align=center><br><br>
			   <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />&nbsp;&nbsp;
			  <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        </div>
        <c:choose>
        	<c:when test="${not empty bean.cofarmerId }">
          		<input name="cofarmerId" type="hidden"  value="${bean.cofarmerId}"  class="inw" />
        	</c:when>
        	<c:otherwise>
          		<input name="cofarmerId" type="hidden"  value="${cofarmerId }" class="inw" />
        	</c:otherwise>
        </c:choose>
        <input type="hidden" name="shId" id="hf_SH_ID" value="${bean.shId}" />
         <input type="hidden" id="stype" value="${bean.stype}" />
        <input type="hidden" name="harvestoperateId" id="hf_Harvest_ID" value="${bean.harvestoperateId}"/>
        <input type="hidden" name="goodsId" id="hf_Goods_ID" value="${bean.goodsId}" />
    </form>
</body>


</html>
