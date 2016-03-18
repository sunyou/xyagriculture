<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/icon.css" rel="stylesheet" type="text/css">
  
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script language="javascript" src="${ctx}/js/jquery-1.11.3.js" ></script>
    <script language="javascript" src="${ctx}/js/bootstrap.min.js" ></script>
    <script language="javascript" src="${ctx}/js/jquery.placeholder.min.js" ></script>
    <script type="text/javascript">
        $(function () {
            // Invoke the plugin
            $('input, textarea').placeholder();
        });
    </script>
 
    <title>农产品溯源管理系统</title>
    <style>
    	  body,html{ background: url(${ctx}/images/processingBg.jpg) no-repeat;}
    </style>
</head>

<body>
    
    <!--right begin-->
    <div class="wrap100 right">

        <div class="processing">
            <ul>
                <li><a href="javascript:void(0)" onclick="openWin('农产品存储','${ctx}/Trade/GoodsStorage.html')"><img src="${ctx}/images/r-icon1.png" width="50%" /> <br />存 储 </a> </li>
                <li><div class="arrow-left"> <img src="${ctx}/images/arrow3.png" width="80%" /> </div></li>
                <li><a href="javascript:void(0)" onclick="openWin('农产品加工','${ctx}/Trade/Process.html')"><img src="${ctx}/images/r-icon2.png" width="50%" /> <br />加 工 </a> </li>
                <li><div class="arrow-left"> <img src="${ctx}/images/arrow3.png" width="80%" /> </div></li>
                <li><a href="javascript:void(0)" onclick="openWin('农产品包装','${ctx}/Package/Package.html')"><img src="${ctx}/images/r-icon3.png" width="50%" /> <br />包 装 </a> </li>
                <li><div class="arrow-left"> <img src="${ctx}/images/arrow3.png" width="80%" /> </div></li>
                <li><a href="javascript:void(0)" onclick="openWin('查看标签审核情况','${ctx}/Label/ApplyLabelList.html')"><img src="${ctx}/images/r-icon4.png" width="50%" /> <br />查看审核 </a> </li>
                <li><div class="arrow-left"> <img src="${ctx}/images/arrow3.png" width="80%" /> </div></li>
                <li><a href="javascript:void(0)" onclick="openWin('标签打印','${ctx}/Label/ApplyLabelPrint.html')"><img src="${ctx}/images/r-icon5.png" width="50%" /> <br />标 签 </a> </li>
                <li><div class="arrow-left"> <img src="${ctx}/images/arrow3.png" width="80%" /> </div></li>
                <li><a href="javascript:void(0)" onclick="openWin('农产品运输','${ctx}/Trade/TranSport.html')"><img src="${ctx}/images/r-icon6.png" width="50%" /> <br />运 输 </a> </li>
            </ul>
        </div>


    </div>
    <!--right end-->
  </body>
  <script language="javascript" >
 	function openWin(title,url){
 		window.parent.tab.addTabItem({text: title, 'url': url,closable:true});
 	}
   
  
 </script>
 
</html>
