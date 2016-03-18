<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="食品,溯源,追溯,系统,中国食品安全农产品溯源,中国食品安全农产品溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源" />
    <meta name="Description" content="农产品溯源,中国食品安全农产品溯源,食品溯源,中国食品安全农产品溯源,食用菌溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源" />
    <title>生产者申请</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/home.css" />
    
</head>
<body id="cbody">
    <form method="post" action="CoFarmerApply.aspx" id="form1">

        <div style="width: 670px; margin: 0px auto;">
            <div id="cofarmerTop" class="cofarmerTop" style="margin-top: 97px;">
                <div id="cofar_title_pic">
                    <img src="${ctx}/images/shenzhanzhe.png" />
                </div>
                <div class="cofar_title">
                    <span class="title_cn">生产者申请</span>
                    <span class="title_en">Products to apply for</span>
                </div>
            </div>
            <div class="cofarmerMiddle">
                <div id="regresult">
                    <div class="result_content">
                        <div id="mess_title" class="mess_title"><span class="mess_icon_success"></span><span class="mess_text">注册成功啦</span></div>
                        <p>
                            ^_^ 恭喜您提交的申请已被受理，我们将在<br />
                            3-5个工作日审核通过后通过邮件或者短信通<br />
                            知您。请您注意查收邮件或者短信。
                        </p>
                    </div>
                </div>
                
                <div id="siteInfo">
                    <a href="#" target="_blank"></a>
                </div>
            </div>
            <div class="cofarmerBottom">
            </div>
        </div>
        <div id="divMsg" style="display: none;" name="divMsg"></div>
    </form>
</body>
</html>
    