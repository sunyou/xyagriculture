<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>生产者审核详细信息</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script language="javascript" type="text/javascript">
        function setSelectValue(obj) {
            var aspnetForm = document.forms[0];
            aspnetForm.AduitInfo.value = obj; //将对象的值赋给表单
            alert(obj);
        }
        $(document).ready(function () {

            $.each($(".pic"), function () {
                if ($(this).attr("src") == "") {
                    $(this).attr("src", "/images/zhengshuLose.jpg");
                    $(this).parent().attr("href", "/images/zhengshuLose.jpg");
                }
            });
        });

        function openWritebox() {

            art.dialog.prompt('请您填写意见！', function (data) {
                // data 代表输入数据;
                var aspnetForm = document.forms[0];
                aspnetForm.AduitInfo.value = data; //将对象的值赋给表单
                if (data.length == 0)
                    art.dialog.alert('请您填写意见！');
                else
                    aspnetForm.btn_UnAudit2.click();
            }, '');
        }

        function openConfirm(msg, btnID) {
            art.dialog.confirm(msg, function () {
                document.getElementById(btnID).click()
            });

        }

    </script>

</head>
<body>
 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="data_grid">
            <tbody>
                <tr>
                    <th width="60">生产者名称
                    </th>
                    <td width="180">
                        ${bean.cofarmerName}
                    </td>
                    <th width="60">生产者类型
                    </th>
                    <td width="240">
                     ${bean.cofarmertype}
                    </td>
                   
                </tr>
                <tr>
                    <th>成立日期
                    </th>
                    <td>
                        ${bean.recordDate}
                    </td>
                    <th>法定代表人
                    </th>
                    <td>
                         ${bean.legalRepresent}
                    </td>
                </tr>
                <tr>
                    <th>邮箱
                    </th>
                    <td>
                         ${bean.email}
                    </td>
                    <th>电话
                    </th>
                    <td>
                          ${bean.tel} 
                    </td>
                </tr>
                <tr>
                    <th>县/区
                    </th>
                    <td>
                      ${areaFullNameString}
                    </td>
                    <th>详细地址
                    </th>
                    <td>
                        ${bean.detailaddr} 
                    </td>
                </tr>
                <tr>
                    <th>注册资金
                    </th>
                    <td>
                        ${bean.regCapital} (万元)
                    </td>

                    <th>经营性质
                    </th>
                    <td>
                        ${bean.property}
                    </td>
                </tr>
                <tr>
                    <th>申请日期
                    </th>
                    <td>
                        ${bean.applyDate}
                    </td>
                    <th>申请类型
                    </th>
                    <td>
                     <c:choose>
							<c:when test="${bean.applyType=='1'}">
								<font color='black'>申请注册</font>
							</c:when>
							<c:when test="${bean.applyType=='2'}">
								<font color='black'>变更名称</font>
							</c:when>
							<c:when test="${bean.applyType=='3'}">
								<font color='black'>变更属性</font>
							</c:when>
							<c:when test="${bean.applyType=='4'}">
								<font color='black'>申请注销</font>
							</c:when>
							<c:otherwise>
								<font color='red'>未知</font>
							</c:otherwise>
						</c:choose>
                    </td>
                </tr>
                <tr>
                    <th>审核时间
                    </th>
                    <td>
                         ${bean.auditDate}
                    </td>
                    <th>审核状态
                    </th>
                    <td>
                      <c:choose>
							<c:when test="${bean.auditResult=='1'}">
								<font color='black'>审核通过</font>
							</c:when>
							<c:when test="${bean.auditResult=='2'}">
								<font color='blue'>正在审核</font>
							</c:when>
							<c:otherwise>
								<font color='red'>未通过</font>
							</c:otherwise>
						</c:choose>
				   </td>
                </tr>

                <tr>
                    <th>审核人
                    </th>
                    <td>
                        ${bean.auditname}
                    </td>
                    <th>审核说明
                    </th>
                    <td>
                        ${bean.rejectreason}
                    </td>
                </tr>
               
                
                
                 
                
            </tbody>
        </table>
          <div align=center><br><br> 
          	   <c:if test="${bean.auditResult=='2'}">
                   <input type="button" name="btn_Cancel" value="批准" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />&nbsp;&nbsp;
                   <input type="button" name="btn_Cancel" value="驳回" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />&nbsp;&nbsp;
                   <input type="button" name="btn_Cancel" value="取消" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
              </c:if>
              
              <c:if test="${bean.auditResult!='2'}">
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			  </c:if>
			</div>
			
			<br><br>
			<table width=98% border='1' CELLSPACING=0 CELLPADDING=0 >
			<tr>
			<td width=65% valign='top'>
				<c:if test="${bean.introduction != null}">
					申请者详细描述信息：<br>${bean.introduction}
				 </c:if>
				 
				<c:if test="${bean.introduction== null}">
					无申请者详细描述信息。
				 </c:if>
			</td>
			<td valign='top'> 营业执照：<br>
			   <a href='${ctx}/${bean.license}' target="_blank"><img class="pic" src="${ctx}/${bean.license}" width="235" height="238" title="营业执照" alt="营业执照" /></a>
			<td>
			
			</td>
			</tr>
			</table>
		
	
           
        <input type="hidden" name="HFUser_ID" id="HFUser_ID" value="1134" />
        <input type="hidden" name="Cofarmer_id" id="Cofarmer_id" />
        <input type="hidden" name="ApplyStr_id" id="ApplyStr_id" value="c897174f-e85a-4b4c-8381-0a88a88c6534" />
        <input type="hidden" name="AduitInfo" id="AduitInfo" />
 
</body>
</html>

