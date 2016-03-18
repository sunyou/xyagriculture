<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>标签申请详情</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
</head>
<body>
      	<table class="data_grid" cellpadding="0" cellspacing="0" border="0"  width="98%">
        <tbody>
          
            <tr>
                <th width="80">申请编号：</th>
                <td>
                    ${bean.applyNo }
                </td>
            	<th  width="80">申请日期：</th>
                <td>
                    <c:if test="${bean.applyDate!=null }">${applyDate }</c:if>
                </td>
               
            </tr>
            <tr>
               
            	<th>申请数量：</th>
                <td>
                    ${bean.amount }
                </td>
                <th>包装编号：</th>
                <td>
                    ${bean.packageNo }
                </td>
            </tr>
              <tr>
                <th>种植面积：</th>
                <td>
                    ${bean.areas }
                </td>
             	<th>采摘量：</th>

                <td>
                   ${bean.qty }
                </td>
              
            </tr>
            
            <tr>
            	<th>审核日期：</th>
                <td>
                    <c:if test="${bean.auditDate!=null }">${auditDate }</c:if>
                </td>
               
            	<th>审核人：</th>
                <td>
                     ${bean.audituser }
                </td>
                
            </tr>
            <tr>
               
            
				<th>审核结果：</th>
                <td>
	                <c:if test="${bean.auditResult==0 }">未审核</c:if>
	                <c:if test="${bean.auditResult==1 }">审核通过</c:if>
	                <c:if test="${bean.auditResult==2 }">审核失败</c:if>
                </td>
                
                <th>拒绝原因：</th>
                <td>
                     ${bean.rejectreason }
                </td>
            </tr>
            <tr>
               
             	<th>生产商：</th>

                <td>
                   ${bean.cofarmerName }
                </td>
              <th>申请人：</th>
                <td>
                    ${bean.applyUser }
                </td>
            </tr>
            <tr>
                    <th>检测日期
                    </<th>
                    <td>
                    	<fmt:formatDate value="${detectionDetailBean.detectionDate}" pattern="yyyy/MM/dd" />
                    </td>
                    <th>检测编号
                    </th>
                    <td>
                        ${detectionDetailBean.detectionNo}
                    </td>
                </tr>
                <tr>
                    <th> 检测部门</th>
                    <td>
                        ${detectionDetailBean.deptName}
                    </td>
                    <th>检测人 </th>
                    <td>
                        ${detectionDetailBean.detector}
                    </td>
                </tr>
               
               
                <tr>
                    <th>检测依据
                    </th>
                    <td>
                    	 ${accroding}
                    </td>
                    <th>检测类型
                    </th>
                    <td>
                    	${stype }
                    </td>
                </tr>
                <tr>
                    <th>检测方式
                    </th>
                    <td>
                    	${method}
                    </td>
                    <th>检测结果
                    </th>
                    <td>
                    	${result}
                    </td>
                </tr>
                <tr>
                    <th>检测证书
                    </th>
                    <td colspan="3">
                    	<c:if test="${!empty detectionDetailBean.docfilepath}">
                    	<img src="${ctx}/${detectionDetailBean.docfilepath}" alt="证书" width="460" height="350"/>
                    	</c:if>
                    </td>
                </tr>
        </tbody>
    </table>
    	 <div align=center><br><br> 
    	  <c:if test="${bean.auditResult=='0'}">
    	        <shiro:hasPermission name="2506:label.edit"> 
    	           <input type="button" name="btn_Cancel" value="批准" id="btn_Cancel" onclick="Audit('${bean.applyId}')" class="cancelbtn" />&nbsp;&nbsp;
                   <input type="button" name="bh_BTN" value="驳回" id="bh_BTN" class="cancelbtn" onclick="adjust('${bean.applyId}')"/>&nbsp;&nbsp;
    	        </shiro:hasPermission>
          	  
                
                   <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
              </c:if>
              
              <c:if test="${bean.auditResult!='0'}">
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			  </c:if>
			</div>
</body>

<script type="text/javascript">
 function Audit(apply_id){

           if (confirm("确定批准吗？")) {
                $.ajax({
                    url: "${ctx}/ApplyLabel/Audit.ajax",
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
   var url = "${ctx}/Label/ApplyLabelReason.html?type=2&id="+id;
   art.dialog.open(url, { title: "填写驳回原因", background: '#FFFFFF', opacity: 0, width: 660, height: 360, lock: true,close:function(){
	   art.dialog.close();
   }}, false);     
 }
</script>
</html>
