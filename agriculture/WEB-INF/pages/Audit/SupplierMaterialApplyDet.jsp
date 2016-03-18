<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农用物资详细信息</title>
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
</head>
<body>
<br>
        <table class="data_grid" width="100%">
            <tbody>
                <tr>
	                <th width="20%">物资通用名</th>
	                <td width="30%">
	                   ${bean.commonname}
	                </td>
	                <th width="20%">物资种类</th>
	                <td width="30%">
	                    <asia:write name="materialtypeCode" dictId="MaterialType_Code"></asia:write>
	                </td>
	            </tr>
	            <tr>
	                <th>物资商品名</th>
	                <td>
						${bean.materialName}
					</td>
	                <th>登记证号</th>
	                <td>
	                	${bean.produceNo}
	                </td>
	            </tr>
	            <tr>
	                <th>物资类别</th>
	                <td>
	                	${materialCategoryBean.categoryName}
					</td>
	                <th>单价</th>
	                <td>
	                ${bean.price}
					</td>
				</tr>
				<tr>
	                <th>剂型</th>
	                <td>
	                <asia:write name="dosetype" dictId="MaterialType_Code"></asia:write>
	                </td>
	                <th>物资描述</th>
	                <td>
	                ${bean.detaildesc}
	                </td>
	            </tr>
	            <tr>
	                <th>分解天数</th>
	                <td>
	                ${bean.compositedays}
					</td>
	                <th>规格</th>
	                <td>
	                ${bean.specification}
	                </td>
	            </tr>
	            <tr>
	                <th>经销商</th>
	                <td>
	                ${supplierBean.supplierName }
					</td>
	                <th>生产商</th>
	                <td>
	                ${producerBean.producerName }
	                </td>
	            </tr>
	            <tr>
	                <th>有效成分</th>
	                <td>
	                ${bean.maincomponent}
					</td>
	                <th>适用作物</th>
	                <td>
	                ${bean.suitablegoods}
	                </td>
	            </tr>
	            <tr>
	                <th>申请人</th>
	                <td>
	                ${bean.applyUser}
					</td>
	               	<th>备注</th>
	                <td>
	                ${bean.notes}
					</td>
	            </tr>
                
            </tbody>
        </table>
        <div align=center><br><br> 
        <c:if test="${bean.auditResult =='2' }">
        	<shiro:hasPermission name="2504:SupplierMaterialAudit.audit">
        	<input type='button' class='cancelbtn' value='批准' onclick="Audit('${bean.materialapplyId}')"/> &nbsp&nbsp
            <input type='button' class='cancelbtn' value='驳回' onclick="ligerWin(660,360, '${ctx}/Audit/MaterialAuditRefuseReason.html?type=2&id=${bean.materialapplyId}', '填写驳回原因');"/>&nbsp&nbsp
        	</shiro:hasPermission>
        </c:if>
			<input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
		</div>
</body>
</html>