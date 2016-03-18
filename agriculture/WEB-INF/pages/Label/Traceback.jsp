<!Doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<html>
<head>
    <meta charset="utf-8" >
    <meta name='HandheldFriendly'  content='True'/>
    <meta name='viewport' content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;' />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no"/>
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
        <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    
    <link href="${ctx}/content/css/css3icon/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/content/css/bootstrap.min.css" type="text/css " >
    <link href="${ctx}/content/css/mobile.css" rel="stylesheet">


<title>农产品溯源</title>
</head>
 <script type="text/javascript">
    function changeClass(obj){
         if(obj.className=='fa fa-chevron-down'){
          
           $(obj).removeClass("fa fa-chevron-down");
		   $(obj).addClass("fa fa-chevron-up");
         }else{
          $(obj).removeClass("fa fa-chevron-up');
		 $(obj).addClass("fa fa-chevron-down");
		 
         }
         
    }
    
    </script>
<body>

<div class="prod-progress-list">
    <h3>基本信息</h3>
    <ul>
        <li><span>作物名称:</span>${bean.goodsName }</li>
        <li><span>品种:</span>${bean.goodvariantName }</li>
        <li><span>生产者:</span>${bean.cofarmerName}</li>
        <li><span>种值区域:</span>${bean.plantbasesName}</li>
        <li><span>种植批次:</span>${bean.lotNo }</li>
        <li><span>采收批次:</span>${bean.plotharvestNo}</li>
       
        <li><span>检验标准:</span>
         <c:if test="${bean.accroding=='1' }">
	            	国家标准
	            </c:if>
	             <c:if test="${bean.accroding=='2' }">
	            	行业标准
	            </c:if>
	             <c:if test="${bean.accroding=='3' }">
	            	地方标准
	            </c:if>
	             <c:if test="${bean.accroding=='4' }">
	            	企业标准
	            </c:if>
        </li>
        <li><span>联系电话:</span>${bean.tel }</li>
    </ul>
<!-- 
    <ol>
        <li><span>作物名称:</span>苹果</li>
        <li><span>品种:</span>山东</li>
        <li><span>生产者:</span>刘灵侠</li>
        <li><span>种植批次:</span>422</li>
        <li><span>采收批次:</span>65456</li>
        <li><span>种值区域:</span>福建</li>
        <li><span>检验标准:</span>A级</li>
        <li><span>联系电话:</span>1388888888</li>

        <div class="clear"></div>
    </ol>

 -->

</div>

<div class="progress-list">
<h3><a href="javascript:void(0)"><span class="fl">投入品使用</span> <span class="fr"><i class="fa fa-chevron-up" id="che1"  onclick="changeClass(this)"></i></span></a><div class="clear"></div></h3>
	<c:forEach items="${plotOperBeans}" var="plotOperBean" varStatus="status">
		<c:if test="${plotOperBean.operatetypeCode=='3'||plotOperBean.operatetypeCode=='4'}">
			<dl class="border_right">
		        <dt class="green_bg">
		        <c:if test="${plotOperBean.operatetypeCode=='3'}">
		         	<img src="${ctx}/content/images/m-icon3.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='4'}">
		         	<img src="${ctx}/content/images/m-icon4.png" width="30" />
		        </c:if>
		        </dt>
		       
		        <dd>
		           <fmt:formatDate value="${plotOperBean.operateDate }" pattern="yyyy-MM-dd"/> <br />
		            <strong>施用了${plotOperBean.materialName}(${plotOperBean.operatetypename })</strong>
		        </dd>
		        <div class="clear"></div>
		    </dl>
	    </c:if>
	</c:forEach>
	<h3><a href="javascript:void(0)"><span class="fl">农事操作</span> <span class="fr"><i class="fa fa-chevron-down" id="che2"  onclick="changeClass(this)"></i></span></a><div class="clear"></div></h3>
		<c:forEach items="${plotOperBeans}" var="plotOperBean" varStatus="status">
		<c:if test="${plotOperBean.operatetypeCode!='3'&&plotOperBean.operatetypeCode!='4'&&plotOperBean.operatetypeCode!='8'}">
	
			<dl class="border_right">
		        <dt class="green_bg">
 				<c:if test="${plotOperBean.operatetypeCode=='1'}">
		         	<img src="${ctx}/content/images/m-icon2.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='2'}">
		         	<img src="${ctx}/content/images/m-icon3.png" width="30" />
		        </c:if>

				<c:if test="${plotOperBean.operatetypeCode=='5'}">
		         	<img src="${ctx}/content/images/m-icon5.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='6'}">
		         	<img src="${ctx}/content/images/m-icon6.png" width="30" />
		        </c:if>
				
				<c:if test="${plotOperBean.operatetypeCode=='7'}">
		         	<img src="${ctx}/content/images/m-icon7.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='13'}">
		         	<img src="${ctx}/content/images/m-icon8.png" width="30" />
		        </c:if>
		        
		        <c:if test="${plotOperBean.operatetypeCode=='14'}">
		         	<img src="${ctx}/content/images/m-icon9.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='15'}">
		         	<img src="${ctx}/content/images/m-icon10.png" width="30" />
		        </c:if>
		        
		         <c:if test="${plotOperBean.operatetypeCode=='9'}">
		         	<img src="${ctx}/content/images/m-icon19.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='16'}">
		         	<img src="${ctx}/content/images/m-icon11.png" width="30" />
		        </c:if>
		          
		        <c:if test="${plotOperBean.operatetypeCode=='17'}">
		         	<img src="${ctx}/content/images/m-icon12.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='18'}">
		         	<img src="${ctx}/content/images/m-icon13.png" width="30" />
		        </c:if>
		        
		         <c:if test="${plotOperBean.operatetypeCode=='19'}">
		         	<img src="${ctx}/content/images/m-icon14.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='20'}">
		         	<img src="${ctx}/content/images/m-icon15.png" width="30" />
		        </c:if>
		          <c:if test="${plotOperBean.operatetypeCode=='21'}">
		         	<img src="${ctx}/content/images/m-icon16.png" width="30" />
		        </c:if>
		        <c:if test="${plotOperBean.operatetypeCode=='22'}">
		         	<img src="${ctx}/content/images/m-icon17.png" width="30" />
		        </c:if>
		        
		         <c:if test="${plotOperBean.operatetypeCode=='23'}">
		         	<img src="${ctx}/content/images/m-icon18.png" width="30" />
		        </c:if>
		        
				</dt>
		        <dd class="font_color_green">
		           <fmt:formatDate value="${plotOperBean.operateDate }" pattern="yyyy-MM-dd"/> <br />
		            <strong>${plotOperBean.operatetypename }</strong>
		        </dd>
		        <div class="clear"></div>
		    </dl>
	</c:if> 
	</c:forEach>
	
		<h3><a href="javascript:void(0)"><span class="fl">采收记录</span> <span class="fr"><i class="fa fa-chevron-down" id="che3"  onclick="changeClass(this)"></i></span></a><div class="clear"></div></h3>
	
	<c:forEach items="${plotOperBeans}" var="plotOperBean" varStatus="status">
		<c:if test="${plotOperBean.operatetypeCode=='8'}">
			<dl class="border_right">
		        <dt class="green_bg"><img src="${ctx}/content/images/m-icon8.png" width="30" /></dt>
		        <dd class="font_color_green">
		           <fmt:formatDate value="${plotOperBean.operateDate }" pattern="yyyy-MM-dd"/> <br />
		            <strong>${plotOperBean.operatetypename }</strong>
		        </dd>
		        <div class="clear"></div>
		    </dl>
	    </c:if>
	</c:forEach>
    

	<h3><a href="javascript:void(0)"><span class="fl">检测报告</span> <span class="fr"><i class="fa fa-chevron-down" id="che4"  onclick="changeClass(this)"></i></span></a><div class="clear"></div></h3>

<c:forEach items="${detectionDetailBeans}" var="detectionDetailBean" varStatus="status">
		<dl class="border_right">
	        <dt class="green_bg"><img src="${ctx}/content/images/m-icon22.png" width="30" /></dt>
	        <dd>
	           <fmt:formatDate value="${detectionDetailBean.detectionDate }" pattern="yyyy-MM-dd"/> <br />
	            <strong>检测类型:
	            <c:if test="${detectionDetailBean.typeId=='1' }">
	            	委托检验
	            </c:if>
	             <c:if test="${detectionDetailBean.typeId=='2' }">
	            	监督检验
	            </c:if>
	             <c:if test="${detectionDetailBean.typeId=='3' }">
	            	定期抽检
	            </c:if>
	             <c:if test="${detectionDetailBean.typeId=='4' }">
	            	企业自检
	            </c:if>
			</strong><br/>

			<strong>检测方式:
	            <c:if test="${detectionDetailBean.method=='1' }">
	            	快速检测
	            </c:if>
	             <c:if test="${detectionDetailBean.method=='2' }">
	            	实验室检测
	            </c:if>
	          </strong> <br/>
			 <strong>检测结果:
	            <c:if test="${detectionDetailBean.result=='0' }">
	            	未检测
	            </c:if>
	             <c:if test="${detectionDetailBean.result=='1' }">
	            	合格
	            </c:if>
	             <c:if test="${detectionDetailBean.result=='2' }">
	            	不合格
	            </c:if>
	            </strong>
			<br/>
	        <div class="clear"></div>
	    </dl>
	</c:forEach>
    

</div>


</body>
   
</html>
