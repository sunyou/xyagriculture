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

	<script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/public.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.blockUI.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/area.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/js/cofarmer.register.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.fileupload.js"></script>
	<script type="text/javascript" src="${ctx}/js/login.js"></script>
    
</head>
<style type="text/css">
select{width:90px}
</style>

<script>
$(function(){
	if(false){
		$('#txt_UserNo').val('vincent_11');
		$('#txt_pwd').val('111111');
		$('#txt_pwd2').val('111111');
		$('#txt_CoFarmer_Name').val('福建省福州市某农民');
		$('#txt_Legal_Represent').val('梅郎苏');
		$('#txt_RecordDate').val('1983-08-21');
		$('#txt_RegCapital').val('1000');
		$('#txt_QQ').val('56887543');
		$('#txt_Tel').val('13898777899');
		$('#txt_Email').val('26483267@qq.com');
		$('#txt_DetailAddr').val('福建省福州市铜盘路10号');
		$('#txt_ProCategory').val('土豆、地瓜、西红柿');
		$('#txt_HomePage').val('http://www.asiainfo.com');
		$('#txt_Notes').val('本公司特产土豆、地瓜、西红柿');
		$('#txt_Fax').val('2726298');
		$('#checkCode').val('1111');
	}

    $("#txt_UserNo").blur(function () {

    });

	$("#linkOpenMap").click(function(){
		openBdmap();
	});
	
    $(document).keydown(function (e) {
        if (e.keyCode == 13) {
			return false;
        }
    });
    
    $('#fileUpload1').fileupload({
     	filePathId:'license',
     	validTypes:'jpg,jpeg,gif,bmp,png'
     });
    
})

function submitForm(){
	//alert($('#lng').val() +" : "+$('#lat').val()); return;
	if(CheckFrom('tb_03')){
		setButtonDisabled(true);
		openBlock();
		
		$.ajax({
			type:"POST",
			url : '<%=ApplicationUtil.getBasePath(request)%>register/saveCoFarmerApply.ajax',
			data : $('#saveForm').serialize(),
			returnType:'json',
			success : function(jsonData) {
				//关闭“覆盖层”
				closeBlock();
				//后台操作成功
				if (jsonData.success && jsonData.success == true) {
					window.location.href = '<%=ApplicationUtil.getBasePath(request)%>register/cofarmer_apply_finished.html';
				}
				//后台操作失败
				else {
					setButtonDisabled(false);
					if(jsonData.code==1001) newCheckcode();
					art.dialog.alert(jsonData.message);
				}
			},
			error : function(XMLResponse) {
				openDialogInDiv(XMLResponse.responseText);
			}
		});
	}
}

var GLOBAL = {
	WEBROOT : "${ctx}"
};
var _basePath = '<%=ApplicationUtil.getBasePath(request)%>';//应用基本路径

</script>

<body id="cbody">
    <form method="post" action="<%=ApplicationUtil.getBasePath(request)%>register/saveCoFarmerApply.ajax" id="saveForm">

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
                <div id="regcontent">
                    <div id="tb_01" class="viewner" style="height: 240px; display: block;padding-top:30px;">

                        <dl class="regbox">
                            <dt>
                                <span class="sp_text">用　户　名：</span></dt>
                            <dd>
                                <input name="userNo" type="text" id="txt_UserNo" class="inw1" style="width:245px;" /></dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">密　　　码：</span></dt>
                            <dd>
                                <input name="password" type="password" id="txt_pwd" class="inw1" style="width:245px;" /></dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">确 认 密 码：</span></dt>
                            <dd>
                                <input name="txt_pwd2" type="password" id="txt_pwd2" class="inw1" style="width:245px;" /></dd>
                        </dl>
                        <dl class="regbox">
                            <dt>&nbsp;</dt>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">&nbsp;</span></dt>
                            <dd>
                                <label class="next_step">
                                    <input type="button" value="下一步" onclick="return CheckFrom('tb_01');" class="btntt" /></label></dd>
                        </dl>

                    </div>
                    <div id="tb_02" class="viewner" style="display: none;">

                        <dl class="regbox">
                            <dt><span class="sp_text">生产者名称:</span></dt>
                            <dd>
                                <input name="cofarmerName" type="text" id="txt_CoFarmer_Name" class="inw" /></dd>
                            <dt><span class="sp_text" id="label_Represent">法人:</span></dt>
                            <dd>
                                <input name="legalRepresent" type="text" id="txt_Legal_Represent" class="inw" /></dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">成立日期:</span></dt>
                            <dd>
                                <input name="recordDate" type="text" id="txt_RecordDate" class="inw Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', readOnly: true })" readonly="readonly" /></dd>
                            <dt><span class="sp_text">注册资金:</span></dt>
                            <dd>
                                <input name="regCapital" type="text" id="txt_RegCapital" class="inw" style="width:105px;" />万元</dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">生产者类型:</span></dt>
                            <dd>
                                <asia:select id="cofarmer_type" name="cofarmertype"
									dictId="cofarmer_type" nullOption="false" nullText="请选择"
									defaultValue=""></asia:select>
                            </dd>
                            <dt><span class="sp_text">生产者性质:</span></dt>
                            <dd>
                                <asia:select id="cofarmer_property" name="property"
									dictId="cofarmer_property" nullOption="false" nullText="请选择"
									defaultValue=""></asia:select>
                            </dd>
                        </dl>

                        <dl class="regbox">
                            <dt><span class="sp_text">联系电话:</span></dt>
                            <dd>
                                <input name="tel" type="text" id="txt_Tel" title="请输入正确的手机号码，这是找回密码的重要依据。" class="inw" />
                            </dd>
                            <dt><span class="sp_text">传　　　真:</span></dt>
                            <dd>
                                <input name="fax" type="text" id="txt_Fax" class="inw" />
                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">Q　　　Q:</span></dt>
                            <dd>
                                <input name="qq" type="text" id="txt_QQ" class="inw" />
                            </dd>
                            <dt><span class="sp_text">邮　　　箱:</span></dt>
                            <dd>
                                <input name="email" type="text" id="txt_Email" class="inw" />
                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">所在地区:</span></dt>
                            <dd>
                                
						<div class="EditAreas">
							<select name="provinceAid" class="input-select"
								id="province" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="cityAid" class="input-select" id="city"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="countyAid" class="input-select"
								id="county" style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select> <select name="townAid" class="input-select" id="town"
								style="margin-right:10px;">
								<option value="">--请选择--</option>
							</select>
						</div>
						<input type="hidden" id="areaId" name="areaId" />

                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">详细地址:</span></dt>
                            <dd>
                                <input name="detailaddr" type="text" id="txt_DetailAddr" class="inw leng" />
                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">主要产品:</span></dt>
                            <dd>
                                <input name="procategory" type="text" id="txt_ProCategory" class="inw leng" />
                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">企业官网:</span></dt>
                            <dd>
                                <input name="homepage" type="text" id="txt_HomePage" class="inw leng" />
                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">介　绍:</span></dt>
                            <dd>
                                <textarea name="introduction" rows="5" cols="60" id="txt_Notes" class="inw leng">
</textarea>
                            </dd>
                        </dl>
                        <dl class="regbox">
                            <dt><span class="sp_text">&nbsp;</span></dt>
                            <dd>
                                <div style="padding-top: 5px;">
                                    <label class="ybtns">
                                        <input type="button" value="上一步" onclick="toStep('tb_01');" class="btntt" /></label>
                                    <label class="ybtns">
                                        <input type="button" value="下一步" onclick="return CheckFrom('tb_02');" class="btntt" /></label>
                                </div>
                            </dd>
                        </dl>

                    </div>
                    <div id="tb_03" class="viewner" style="display: none;">

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regbox" align="left">
                            <tr>
                            	<td align="right">我的位置：</td>
                                <td>
                                     <div class="inline">
                                        <label class="butt">
                                            <a href="javascript:void(0);" id="linkOpenMap" class="xybtn">
                                                <img style="float: left; position: relative; top: -2px;" src="${ctx}/images/GPS.png" width="26" height="26" border="0" /><span style="float: left; position: relative; left: 5px; top: -8px; width: 70px; height: 30px; display: block;">定位我的位置</span></a>
                                        </label>
                                        <input type="hidden" name="longitude" id="lng" />
                                        <input type="hidden" name="latitude" id="lat"  />
                                        <input type="hidden" name="zoom" id="zoom" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">营业执照:</td>
                                <td>
			                        <div id="fileUpload1"></div>
			                        <input type="hidden" name="license" id="license" />
			                    </td>
                            </tr>
                            <tr>
                                <td align="right">验证码:</td>
                                <td>
                                	<input type="text" id="checkCode" name="checkCode" placeholder="验证码" /><a href="#"><img name="checkcodeImage" src="${ctx}/checkCode/code" /> </a>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <div class="inline">
                                        <input type="button" value="上一步" onclick="toStep('tb_02');" class="btntt" /></label>
                                        <input type="button" value="提交" onclick="submitForm()" class="xybtn" /></label>
                                    </div>
                                </td>
                            </tr>
                        </table>

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
    