<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>包装信息</title>
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
         	<table class="data_grid" cellpadding="0" cellspacing="0" border="0"  width="98%">

            <tbody>
               
                <tr>
                    <th width="80">包装编号：</th>
                    <td width="250">
                        ${bean.packageNo }
                    </td>
                    <th  width="80">包装日期：</th>
                     <td width="250">
                        <fmt:formatDate value="${bean.packageDate}" pattern="yyyy-MM-dd"/>
                    </td>
                    
                </tr>
                <tr>
                    <th>包装数量：</th>
                    <td>
                        ${bean.amout }
                    </td>
                    <th>单位：</th>
                    <td>
                        ${bean.unitname }
                    </td>

                </tr>
                <tr>
                    <th>已打印数量：</th>
                    <td>
                        ${bean.printnum }
                    </td>

                    <th>检测结果：</th>
                    <td>
                    
                    </td>

                </tr>
               
                <c:forEach items="${detailBeans}" var="detailBean" varStatus="status">
                <tr>
                	<th>采收批次：</th>
                    <td>
                        ${detailBean.plotharvestNo }
                    </td>
                
                    <th>产品：</th>
                    <td>
                        ${detailBean.goodsvalue}
                    </td>

                </tr>
                <tr>
                	<th>数量：</th>
                    <td>
                        ${detailBean.qty}
                    </td>
                
                    <th>单位：</th>
                    <td>
                       ${detailBean.unitname}
                    </td>

                </tr>
                </c:forEach>
                 <tr>
                	<th>开票单位：</th>
                    <td>
                        ${bean.cofarmerName}
                    </td>
                
                    <th>操作人：</th>
                    <td>
                        ${bean.operateuser}
                    </td>

                </tr>
            </tbody>
        </table>
        	<div align=center><br><br> 
			  <input type="button" name="btn_Cancel" value="关 闭" id="btn_Cancel" onclick="art.dialog.close()" class="cancelbtn" />
			</div>
        <!--  
        <fieldset>
            <legend>${bean.packageNo }的明细信息</legend>
            
          	<c:forEach items="${detailBeans}" var="detailBean" varStatus="status">
             <table class="data_grid">
                <tr>
                    <td>采收编号</td>
                    <td>${detailBean.plotharvestNo }</td>
                    <td>农作物</td>
                    <td>${detailBean.goodsvalue}</td>
                </tr>
                <tr>
                    <td>包装数量</td>
                    <td>${detailBean.qty}</td>
                    <td>单位</td>
                    <td>${detailBean.unitname}</td>
                </tr>
                 <tr>
                    <td>操作人</td>
                    <td colspan="3">${detailBean.operateuser}</td>
                    
                </tr>
            </table>
            </c:forEach>
           

            
        </fieldset>
        -->
</body>
</html>

