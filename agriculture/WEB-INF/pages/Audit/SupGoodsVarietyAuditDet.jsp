<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>种苗审核详细信息</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        function openConfirm(msg, btnID) {
            art.dialog.confirm(msg, function () {
                document.getElementById(btnID).click()
            });

        }
    </script>
</head>
<body>
    <form method="post" action="SupGoodsVarietyAuditDet.aspx?type=3&amp;id=499f78b9-af62-4d79-81e6-8a33c3db73b0" id="ctl00">

       	<table class="data_grid" cellpadding="0" cellspacing="0" border="0"  width="98%">
            <tbody>
               
                <tr>
                    <th  width="80">种苗名称 </th>
                    <td width="150">
                        ${bean.goodvariantName }
                    </td>
                    <th  width="80">农作物</th>
                    <td width="150">
                         ${bean.goodsName }
                    </td>
                </tr>
                <tr>
                    <th>品种审定证
                    </th>
                    <td>
                         ${bean.certificateId }
                    </td>
                    <th>产地
                    </th>
                    <td >
                         ${bean.origin}
                    </td>
                </tr>
                <tr>
                    <th>经销商
                    </th>
                    <td>
                         ${bean.supplierName}
                    </td>
                    <th>生产商
                    </th>
                    <td>
                         ${bean.producer}
                    </td>
                </tr>
                <tr>
                    <th>出苗率%
                    </th>
                    <td>
                         ${bean.emergencerate}
                    </td>
                    <th>成活率%
                    </th>
                    <td>
                         ${bean.survivalrate}
                    </td>
                </tr>
                <tr>
                    <th>苗龄
                    </th>
                    <td>
                         ${bean.seedingage}
                    </td>
                    <th>检疫证
                    </th>
                    <td>
                        ${bean.pratique}
                    </td>
                </tr>
                <tr>
                    <th>申请日期
                    </th>
                    <td>
                     <fmt:formatDate value="${bean.applyDate}" pattern="yyyy-MM-dd"/>
                        
                    </td>
                    <th>申请人
                    </th>
                    <td>
                         ${bean.applyUser}
                    </td>
                </tr>
                <tr>
                    <th>申请类型
                    </th>
                    <td>
                        申请注册
                    </td>
                    <th>审核状态
                    </th>
                    <th>
                        通过
                    </th>
                </tr>
                <tr>
                    <th>审核日期
                    </th>
                    <td>
                        <fmt:formatDate value="${bean.auditDate}" pattern="yyyy-MM-dd"/>
                      
                    </td>
                    <th>审核人
                    </th>
                    <td>
                         ${bean.origin}
                    </td>
                </tr>
                <tr>
                    <th>审核说明
                    </th>
                    <td  colspan="3">
                         ${bean.remark}
                    </td>
                </tr>
                
            </tbody>
        </table>
         <div align=center><br><br> 
          	   <c:if test="${bean.auditResult=='0'}">
                   <shiro:hasPermission name="2505:goodsvariety.edit"> 
    	           <input type="button" name="btn_Cancel" value="批准" id="btn_Cancel" onclick="Audit('${bean.applygoodsvarietyId}')" class="cancelbtn" />&nbsp;&nbsp;
                   <input type="button" name="bh_BTN" value="驳回" id="bh_BTN" class="cancelbtn" onclick="adjust('${bean.applygoodsvarietyId}')"/>&nbsp;&nbsp;
    	        </shiro:hasPermission>
                   <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
              </c:if>
              
              <c:if test="${bean.auditResult!='0'}">
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			  </c:if>
			</div>
        <input type="hidden" name="Apply_ID" id="Apply_ID" />
        <input type="hidden" name="HF_Apply_Type" id="HF_Apply_Type" value="1" />
    </form>
</body>

<script type="text/javascript">
 function Audit(apply_id){

           if (confirm("确定批准吗？")) {
                $.ajax({
                    url: "${ctx}/GoodVariety/Audit.ajax",
                    dataType: "json",
                    type: "POST",
                    data:{"id":apply_id},
                    complete: function (state) {
                        var ob = eval("(" + state.responseText + ")");   
                        if (ob.success) {
                        	showTips("操作成功");
                            //art.dialog.MyTips('操作成功',function(){grid.reload();});
                        }
                    }
                });
            }
        }

function adjust(id) {
   var url = "${ctx}/GoodVariety/ApplyGoodsVarietyReason.html?type=2&id="+id;
   art.dialog.open(url, { title: "填写驳回原因", background: '#FFFFFF', opacity: 0, width: 660, height: 360, lock: true,close:function(){
	   art.dialog.close();
   }}, false);     
 }
</script>
</html>
