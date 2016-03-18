
<%
	response.sendRedirect("loginframe/login.html");
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>安全农产品标准化生产溯源标识管理系统</title>
    <meta name="Keywords" content="食品,溯源,追溯,系统,中国食品安全农产品溯源,中国食品安全农产品溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源" />
    <meta name="Description" content="食品,溯源,追溯,系统,中国食品安全农产品溯源,中国食品安全农产品溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源" />
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="${ctx }/css/demo.css" />
    <link type="text/css" rel="stylesheet" href="${ctx }/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/js/flexslider.css" />
    <script type="text/javascript" src="${ctx }/js/comm.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery.Slide.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery.selection.js"></script>
    <script type="text/javascript" src="${ctx }/js/dialog.min.js?skin=green"></script>
    <script type="text/javascript" src="${ctx }/js/iframeTools.js"></script>
</head>
<body>
	<div id="topTools">
	<div id="topHead">
		<div class="content">
		<img src="${ctx }/images/201411021537266093.jpg"  border="0"  title="安全农产品标准化生产溯源标识管理系统" />
		<span id="sys_title" style="display:none;">安全农产品标准化生产溯源官方网站<span>安全农产品标准化生产溯源标识管理系统</span></span>
		<ul id="top_bars">
			<li><span onclick="setHomepage();"><span class="setHomepage">&nbsp;</span>设为主页</span></li>
			<li>|</li>
			<li><span onclick="AddToFavorite();"><span class="AddToFavorite">&nbsp;</span>收藏本页</span></li>
		</ul>
		</div>
	</div>
</div>
<div id="head">
<div class="content">
    <ul id="nav_list">
        <li><a href="/" class="first">首页</a></li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                新闻中心
            </a>
        </li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                产品中心
            </a>
        </li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                系统概况
            </a>
        </li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                政府监管
            </a>
        </li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                物流查询
            </a>
        </li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                下载中心
            </a>
        </li>
        
		<li class="split">&nbsp;</li>
        <li>
            <a href="javascript:;">
                关于我们
            </a>
        </li>
        
    </ul>
<script type="text/javascript">
	$(document).ready(function(){
		$("#_PLotHarvest_No").focus();
	
		$(window).keydown(function(e){
			if(e.keyCode==13){
			   checkForm();
			   return false;
			}
		})
	});
	
	function SetPlortValue(tp){
		if(tp=='-1'){
			$("#_PLotHarvest_No").iDelField(1);
			return false;
		}
		$("#_PLotHarvest_No").iAddField(tp);

	}
	function checkForm() {
		var plotNO=$("#_PLotHarvest_No").val();
		if(plotNO==""){
			art.dialog.tips('请输入溯源码！',1.5);
			setTimeout(function(){document.getElementById('_PLotHarvest_No').focus();},1800);
			return false;
		}
		plotNO=plotNO.substring(plotNO.lastIndexOf("=")+1);
		var dialogURL="${ctx}/trace/traceReport.aspx?_Label_No=" + plotNO
		var dialog=art.dialog.open(dialogURL,{	
			id: 'LHG1976D',
			title:"溯源查询结果",
			lock: true,
			width:'100%',
			height:'100%',
			button: [{
			name: '关闭',
			callback: function(){
			   $("#_PLotHarvest_No").val("");
			},
			focus: true
			}],
			close: function () {
				$("#_PLotHarvest_No").val("");
				$("#_PLotHarvest_No").focus();
			}
		});
	}
	


	(function(){
		var links = $("#nav_list a");
		var _cur_location = window.top.location.href;
		var _ags=_cur_location.split("/");
		if(_ags[_ags.length-1].lastIndexOf("html")==-1 || _ags[_ags.length-1].lastIndexOf("index.html")>0){
			$(links).first().attr("class", "first");
			return false;
		}
		$.each(links, function (i, a) {
			var _cags=$(this).attr("href").split("/");
			if(_cags[_cags.length-1]==_ags[_ags.length-1] || (_ags[_ags.length-2]=="gbook" && _cags[_cags.length-2]=="gbook")){
				$(this).attr("class", "first");
			
			}else {
			$(this).attr("class", "");
			}
		});
	}());
	</script>
	</div>
    <div class="clearfix"></div>
</div>
<div class="content">
		<!--咨询--->
		<div class="zixun">
			<span class="zx_title">【咨询】</span>
			<ul id="zx_list">
				
				<li><a class="news_title" href="javascript:;">溯源系统升级-标签申请打印</a></li>
				
				<li><a class="news_title" href="javascript:;">溯源系统升级了，请注意下载最新的打印控件</a></li>
				
				<li><a class="news_title" href="javascript:;">安全农产品标准化生产溯源标识管理系统上线</a></li>
				
			</ul>
			<script type="text/javascript">
				$('.zixun').slide({ mainCell: 'ul', autoPlay: true, effect: 'topLoop',vis: 7 });
			</script>
		</div>
		<!--咨询--->
</div>
<div id="top" class="content">
	<div id="step_content">
		<div class="step_round_bg">
		</div>
		<dl class="step_box" id="step_box01">
			<dt><span class="step_roundActive" id="step_round01"></span></dt>
			<dd><a href="${ctx }/register/cofarmer_apply.html" class="step_round_content" id="step_round_content01" target="_blank" onmouseover="ActiveStep('step_round01');"></a></dd>
		</dl>
		<dl class="step_box" id="step_box02">
			<dt><span class="step_round" id="step_round02"></span></dt>
			<dd><a href="${ctx }/register/supplier_apply.html" class="step_round_content" id="step_round_content02" target="_blank" onmouseover="ActiveStep('step_round02');"></a></dd>
		</dl>
		<dl class="step_box" id="step_box03">
			<dt><span class="step_round" id="step_round03"></span></dt>
			<dd><a href="${ctx }/loginframe/login.html" class="step_round_content" id="step_round_content03" target="_blank" onmouseover="ActiveStep('step_round03');"></a></dd>
		</dl>
		<script type="text/javascript">

			function ActiveStep(id){
			
				$(".step_box dt span").attr("class","step_round");
				$("#"+id).attr("class","step_roundActive");
			
			}
		</script>
	</div>
	<div id="input_control">
		<ul id="control_ul">
			<li id="searh-line">
				<form id="searchForm" name="searchForm" method="get" action="#" target="_blank">
					<div id="link_search"><input type="text" name="_PLotHarvest_No" id="_PLotHarvest_No" value="" class="search-text" /><input type="button" value="查询" id="searh_btn_submit" onclick="checkForm();" /></div>
					<div id="keybord">
						<div id="keysin">
							<ul>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >1</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >2</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >3</a></li>
							</ul>
							<ul>		
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >4</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >5</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >6</a></li>
							</ul>	
							<ul>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >7</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >8</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);" >9</a></li>
							</ul>	
							<ul>
								<li><a href="javascript:;" class="lastbtn" onclick="return SetPlortValue(this.innerHTML);">0</a></li>
								<li><a href="javascript:;" onclick="return SetPlortValue(this.innerHTML);">-1</a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>
				</form>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
</div>
<script type="text/javascript">
    $(function () {

        //$('.flexslider').flexslider({
        //    animation: "slide",
        //    slideshowSpeed: 3000,
        //    animationLoop: true,//是否循环滚动
        //    directionNav: false,//否显示左右控制按钮
        //    smoothHeight: true,
        //    slideshow: true,// 载入页面时，是否自动播放
        //    keyboardNav: true//键盘左右方向键控制图片滑动
        //    //controlNav: false
        //})

        $('#searh-line').hover(function () {
            $('#keybord').stop().slideDown();
        }, function () {
            $('#keybord').stop().slideUp("fast");
        });

      
    });
</script>

    <div class="content">
        <div class="clearfix"></div>
        <div id="mainContent">
            <ul id="itembox" class="clearfix">
                <li class="first" style="width:634px;">
                    <dl>
                        <dt class="label_head">
							<div class="label_title"><img src="${ctx }/images/news_pic.jpg" border="0" width="634" height="38" /></div>
                            <div class="link_more">
                                <a class="more" title="新闻动态" href="/jhrz/newslist/list-172-1.html">更多</a>
                            </div>
                        </dt>
                        <dd class="label_content">
                            <div class="item_list">
                                <ul class="clearfix">
                                    
                                        <li><a class="news_title" href="javascript:;">李克强：推进以人为核心的新型城镇化-杨凌...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">农业部要求——坚定稳粮增收目标 切实抓好...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">加快区域性标准化高产高效技术模式推广-杨...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">李克强：促改革调结构惠民生 使经济发展行...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">全面推进城乡发展一体化—关于破除双重城乡...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">国外农民合作社发展政策与启示-杨凌示范区...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">农业部召开全国农产品质量安全监管工作会议...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">韩长赋在天津调研时强调 大力推进农业节水...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">商务部等13部门联手推进农产品市场体系建...</a><span class="datetime">10-09</span></li>
                                    
                                        <li><a class="news_title" href="javascript:;">关于我国农产品加工业发展问题的思考-杨凌...</a><span class="datetime">10-09</span></li>
                                    
                                </ul>
                            </div>
                        </dd>
                    </dl>
                </li>
                <li class="last">
                    <dl>
                        <dt class="label_head">
							<div class="label_title"><img src="${ctx }/images/cofarmer_list.jpg" border="0" width="353" height="33" /></div>
                            <div class="link_more">
                                <a class="more" title="" href="javascript:;">更多</a>
                            </div>
                        </dt>
                        <dd class="label_content">
                            <div class="item_list">
                                <ul class="clearfix">
								
									<li><a class="news_title" href="javascript:;">杨凌奥达果蔬专业合作社</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌美庭两岸农业开发有限公司</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌丽桦果蔬专业合作</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌沃邦生态农业有限公司</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">陕西巨农科技农业有限公司</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌永凯瓜菜种苗专业合作社</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌竹园村果蔬花卉专业合作社</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌秦岭山现代农业股份有限公司</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌伏波专业合作社</a><span class="datetime">10-09</span></li>
								
									<li><a class="news_title" href="javascript:;">杨凌千玉西甜瓜专业合作社</a><span class="datetime">10-09</span></li>
								
                                </ul>
                            </div>
                        </dd>
                    </dl>
                </li>
            </ul>
            <div class="clearfix"></div>
            <div id="products_list" class="label_head">
                <div class="label_title"><img src="${ctx }/images/ProductScroll.jpg" border="0" width="1000" height="31" /></div>
                <div class="link_more" style="position:absolute;right:0px;top:0px;"><a href="javascript:;" class="more">更多</a></div>
            </div>
            <div class="picMarquee-left">
                <div class="bd">
                    <ul>
                        <!-- 
                        <li>
                            <a title="洛川苹果" href="/jhrz/news/2014-7-15/51.html">
                                <img src="/upLoad/product/month_1407/201407151602531040.png" style=' width:165px; height:120px;' alt="" />
                                <p class="title">洛川苹果</p>
                            </a>
                        </li>
                        
                          -->
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531040.png" title="马铃薯" />
                            </a>
                            <p class="title">马铃薯</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531041.png" title="大白菜" />
                            </a>
                            <p class="title">大白菜</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531042.png" title="紫白菜" />
                            </a>
                            <p class="title">紫白菜</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531043.png" title="小白菜" />
                            </a>
                            <p class="title">小白菜</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531040.png" title="马铃薯" />
                            </a>
                            <p class="title">马铃薯</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531041.png" title="大白菜" />
                            </a>
                            <p class="title">大白菜</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531042.png" title="紫白菜" />
                            </a>
                            <p class="title">紫白菜</p>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <img src="${ctx }/images/201407151602531043.png" title="小白菜" />
                            </a>
                            <p class="title">小白菜</p>
                        </li>
                    </ul>
					<div class="clearfix"></div>
                </div>
				<a class="prev" href="javascript:void(0)"></a>
				<a class="next" href="javascript:void(0)"></a>
            </div>
            <script type='text/javascript'>$('.picMarquee-left').slide({ mainCell: 'ul', autoPlay: true, effect: 'leftMarquee', interTime: 50, vis: 7,pnLoop:"click" });</script>
        </div>
    </div>
	<script type="text/javascript" src="/inc/AspCms_Statistics.asp"></script><div>
	<div class="content">
		<div id="footTop">
			<div class="nr">
				<a href="http://www.agri.gov.cn" target="_blank">中国农业信息网</a>
				<a href="http://www.sxny.gov.cn/templet/sxny_gov_cn/" target="_blank">陕西农业网</a>
				<a href="http://www.guoye.sn.cn" target="_blank">果业信息网</a>
				<div class="cleafix"></div>
			</div>
		</div>
	</div>
    <div id="foot">
        <p>
            <br />
            公司地址： 联系方式：    <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/' type='text/javascript'%3E%3C/script%3E"));
</script>
<br>
			推荐您使用IE6+ firefox chrome 1024*768分辨率浏览以保持最佳效果。
        </p>
    </div>
</div>

<div id="weibo_me" style="display:none;">
	关注我们
	<a href="javascript:;" id="weibo_close" onclick="document.getElementById('weibo_me').style.display='none';"></a>
	<a href="javascript:;"><img src="${ctx }/images/weibo.png" alt="" style="border:none;" /></a>
	手机APP下载
	<a href="javascript:;"><img src="${ctx }/images/app.png" alt="" style="border:none;" /></a>
</div>


</body>
</html>
