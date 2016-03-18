<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>生产者详细信息</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" href="${ctx}/content/js/fancyBox/jquery.fancybox.css" />
    <link href="${ctx}/content/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/index.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/comnn.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/public.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/index.css">
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/fancyBox/jquery.fancybox.js"></script>
    <script src="${ctx}/content/js/jquery.bxslider/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script src="${ctx}/content/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $.each($(".pic"), function () {
               if ($(this).attr("src") =="") {
                    $(this).attr("src", "${ctx}/images/zhengshuLose.jpg");
                    $(this).parent().attr("href", "${ctx}/images/zhengshuLose.jpg");
               }
            });

            $('.fancybox').fancybox();

            $('#bxslider').bxSlider({ slideWidth: 700, minSlides: 3, maxSlides: 3, moveSlides: 1, pager: false, auto: true, preloadImages: 'visible' });

       
			$("#showCpImg").mouseover(function() {
							$("#showCpImg").addClass("current");
							$("#showCpVideo").removeClass("current");
							$("#companyVideo").addClass("nodisplay");
							$("#companyImg").removeClass("nodisplay");
						});

				
			$("#showCpVideo").mouseover(function() {
							$("#showCpVideo").addClass("current");
							$("#showCpImg").removeClass("current");
							$("#companyImg").addClass("nodisplay");
							$("#companyVideo").removeClass("nodisplay");
						});
						
						
			   /*地图   */
			    var cofarmerName=encodeURI(encodeURI($("#cofarmerName").val()));
			    var ifSrc=" src=\"${ctx}/Base/Info/Bmap.html?lng=${cfbfBean.longitude}&lat=${cfbfBean.latitude}&cofarmername="+cofarmerName+"\"";
			    var iframeHtml=" <iframe  frameborder=\"1\" scrolling=\"no\" width=\"100%\" height=\"400\" src=\"${ctx}/Base/Info/Bmap.html?lng=${cfbfBean.longitude}&lat=${cfbfBean.latitude}&cofarmername="+cofarmerName+"\" ></iframe>";
			    
			    var name = '${cfbfBean.cofarmerName}';
			    name = escape(name).replace(/%u/g,'\\u');
			    iframeHtml=" <iframe  frameborder=\"1\" scrolling=\"no\" width=\"100%\" height=\"400\" src=\"${ctx}/Map/bdmap.html?lng=${cfbfBean.longitude}&lat=${cfbfBean.latitude}&zoom=${cfbfBean.zoom}&name="+name+"\" ></iframe>";
			    
			    $(".mapList").append(iframeHtml);
						
						
					});

					function openThreeProd(id) {
						ligerWin(660, 500,
								'${ctx}/FoodGrade/FoodGradeDet.html?type=1&id='
										+ id, "三品一标");
					}
				</script>
				<style type="text/css">
				.nodisplay {
					display: none;
				}
</style>
</head>
<body>
    <!--right begin-->
    <div class="right">

        <div class="aboutus-content">
            <dl>
                <dt class="fl"><img src="${ctx}/images/icon6.png" /> </dt>
                <dd class="fl w-b-90">
                    <h1>${cfbfBean.cofarmerName}<span>（生产者）</span></h1>
                    <div class="aboutusList row">
                        <div class="col-lg-4"><label>生产者编号:</label>${cfbfBean.cofarmerNo}</div>
                        <div class="col-lg-4"><label>简称:</label>${cfbfBean.pyshort}</div>
                        <div class="col-lg-4"><label>成立日期:</label><fmt:formatDate type="date" pattern="yyyy-MM-dd"  value="${cfbfBean.recordDate}" /></div>
                        <div class="col-lg-4"><label>法人代表:</label>${cfbfBean.legalRepresent}</div>
                        <div class="col-lg-4"><label>注册资金:</label>${cfbfBean.regCapital}(万元)</div>
                        <div class="col-lg-4"><label>联系方式:</label>${cfbfBean.tel}</div>
                        <div class="col-lg-4"><label>邮箱:</label>${cfbfBean.email}</div>
                        <div class="col-lg-4"><label>总种植面积:</label>${sumBean.areas}亩</div>
                        <div class="col-lg-4"><label>详细地址:</label>${cfbfBean.detailaddr}</div>
                        <div class="col-lg-4"><label>官方网站:</label>${cfbfBean.homepage}</div>
                    </div>
                    <h5>主营产品：${cfbfBean.procategory}</h5>

                </dd>
                <div class="clear"></div>
            </dl>


            <div class="title">
                <h4 class="w-b-10" style="width:120px">生产者简介</h4>
            </div>
            <div class="company">
                <div class="fl companySub">
                    <ul>
                        <li id="showCpImg" class="current" ><a href="#">营业执照</a></li>
                        <li id="showCpVideo" ><a href="#" >企业视频</a></li>
                    </ul>
                    <div class="companyList">
                        <a id="companyImg"  class="fancybox" href="${ctx}/${cfbfBean.license}" data-fancybox-group="gallery" >
                        <img class="pic" src="${ctx}/${cfbfBean.license}" width="205" height="170"/>
                        </a>
                        <a id="companyVideo" class="nodisplay fancybox" href="" data-fancybox-group="gallery"> <img class="pic"  src="" width="205" height="170"/></a>
                    </div>
                </div>
                <div class="fl w-b-60 companyShow">
                    　                                  ${cfbfBean.introduction}
                </div>

                <div class="clear"></div>
            </div>
  <c:if test="${not empty tProdViewBeans}">
            <div class="title">
                <h4 class="w-b-10">三品一标</h4>
            </div>
             
            <div class="honorList" style="width:100%; height:180px; overflow:auto;">
                <ul >
              
                    <c:forEach items="${tProdViewBeans}" var="prodBean">
                      <li onclick="openThreeProd('${prodBean.threeprodId}')" >
                      <a href="#">
                      <img class="pic" src="${ctx}/${prodBean.content}" width="180" height="130">
                      <br />证书名称：${prodBean.cername}
                      <br />
                                                                    证书编号：${prodBean.cerno} 
                        </a> 
                      </li>
                    </c:forEach>
                
                    <div class="clear"></div>
                </ul>
            </div>
       </c:if>
            <div class="title">
                <h4 class="w-b-10">地理位置</h4>
            </div>
            <div class="mapList">
                
            </div>

        </div>


    </div>
    <!--right end-->
    <div class="clear"></div>
   
    <input type="hidden" value=" ${cfbfBean.cofarmerName}" id="cofarmerName" >
    
    
    
    
    
    
</body>
</html>
