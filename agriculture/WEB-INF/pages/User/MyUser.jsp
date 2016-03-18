<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的用户--修改密码</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/jquery-validation/messages_cn.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                //debug: true,
                errorPlacement: function (error, element) {
                    //".AreaList"
                    var placement = $(element).parents("td").next();
                    placement.text('');
                    error.appendTo(placement);
                },
                rules: {
                    txt_User_no: "required",
                    txt_User_Name: "required",
                    txt_PwdNew: "required",
                    txt_PwdNewSure: "required",
                    txt_Email: "required",
                    txt_Pwd: "required",
                    txt_Tel: {
                        required: true,
                        isPhone: true
                    },
                    uc_Areas$ddlTown: {
                        min: 1
                    }
                },
                messages: {
                    txt_User_no: "请填写农户名称",
                    txt_User_Name: "请填写生产者",
                    txt_PwdNew: "请填写密码",
                    txt_PwdNewSure: "请填写确认密码",
                    txt_Email: "请填写正确的邮箱",
                    txt_Pwd: "请填写原密码",
                    txt_Tel: {
                        required: "请填写联系电话",
                        isPhone: "请输入手机号或者固话"
                    },
                    uc_Areas$ddlTown: { min: "请选择乡镇" }
                }
            });

        });
    </script>
</head>
<body>
    <form method="post" action="MyUser.aspx" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTQ4MDY5NTI2NGRkgvq6HcWtvcgtOXCd46aIfwXIg+xsBlkZbB5niUB7dy0=" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWDQL3+fGZCgK+l8eVCALTtPDPAgK25eDbCgL+w6vSBQKkv77ZCQLfhqGSCALam6qxCQKjuu4fAszdto8BArWz2+IPApHZ4eYHAp/I+N4GEul29pjV7Ew0gfQbRgEDBsSYUETR7NQbYLV+nnhC1CI=" />
</div>
        <div class="edit_panel">
            <table class="edit_table" width="700" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="80">
                        <div class="th_text">用户账号:</div>
                    </td>
                    <td width="400">
                        <input name="txt_User_no" type="text" value="admin" id="txt_User_no" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="th_text">用户名称:</div>
                    </td>
                    <td>
                        <input name="txt_User_Name" type="text" value="*****" id="txt_User_Name" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="th_text">电话:</div>
                    </td>
                    <td>
                        <input name="txt_Tel" type="text" value="**" id="txt_Tel" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
               
                <tr>
                    <td>
                        <div class="th_text">邮箱:</div>
                    </td>
                    <td>
                        <input name="txt_Email" type="text" value="****" id="txt_Email" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                 <tr>
                    <td>
                        <div class="th_text">所在地区:</div>
                    </td>
                    <td>
                        
<script type="text/javascript">

    $(document).ready(function () {
        $('#ddlProvice').change(function () {
            var val = $(this).children('option:selected').val();//这就是selected的值      
            getAreas("ddlCity", val);
        })
        $('#ddlCity').change(function () {
            var val = $(this).children('option:selected').val();//这就是selected的值             
            getAreas("ddlCounty", val);
        })
        $('#ddlCounty').change(function () {
            var val = $(this).children('option:selected').val();//这就是selected的值             
            getAreas("ddlTown", val);
        })
        if (document.getElementById("Areas_hf_AreaID").value != undefined && document.getElementById("Areas_hf_AreaID").value != "") {
            valueChange();
        } else {
            getAreas("ddlProvice", 0);
        }
    })
    function setValue() {
        var provice = document.getElementById("ddlProvice");
        var proviceTxt = provice.options[provice.selectedIndex].text;
        var city = document.getElementById("ddlCity");
        var cityTxt = city.options[city.selectedIndex].text;
        var county = document.getElementById("ddlCounty");
        var countyTxt = county.options[county.selectedIndex].text;
        var town = document.getElementById("ddlTown");
        var townTxt = town.options[town.selectedIndex].text;
        var val = town.options[town.selectedIndex].value;
        document.getElementById("Areas_hf_AreaID").value = val;
        var fullName = proviceTxt + '-' + cityTxt + '-' + countyTxt + '-' + townTxt;
    }

    function valueChange() {
        var value = document.getElementById("Areas_txt_AreaID").value;
        if (value != undefined && value != "") {
            var provice = value.substring(0, 2);
            getAreas("ddlProvice", 0, provice);
            var city = value.substring(0, 4);
            getAreas("ddlCity", provice, city);
            var county = value.substring(0, 6);
            getAreas("ddlCounty", city, county);
            if (value.length > 6) {
                getAreas("ddlTown", county, value);
            }
        }
    }
    function getAreas(id, Parent, val) {
        document.getElementById(id).options.length = 0;
        document.getElementById(id).options.add(new Option("--请选择--", "-1"));
        if (val != "-1") {
            changLoader(true, "Msg");
            getAjax("/Areas/GetAreas/" + Parent, { "flag": (new Date()).getTime().toString(36) }, function (data) {
                if (data.success) {
                    var list = data.data, opt = "";
                    for (var i = 0; i < list.length; i++) {
                        document.getElementById(id).options.add(new Option(list[i]['Area_Name'], list[i]['Area_ID'], false, list[i]["Area_ID"] == val));
                    }
                }
                changLoader(false, "Msg");
            });
        }
    }
    function jsSelectItemByValue(objSelect, objItemValue) {
        var isExit = false;
        for (var i = 0; i < objSelect.options.length; i++) {
            if (objSelect.options[i].value == objItemValue) {
                objSelect.options[i].selected = true;
                break;
            }
        }
    }
    function ReadOnly(readOnly) {
        if (readOnly) {
            $("#ddlProvice").attr("disabled", "disabled");
            $("#ddlCity").attr("disabled", "disabled");
            $("#ddlCounty").attr("disabled", "disabled");
            $("#ddlTown").attr("disabled", "disabled");
        } else {
            $("#ddlProvice").removeAttr("disabled");
            $("#ddlCity").removeAttr("disabled");
            $("#ddlCounty").removeAttr("disabled");
            $("#ddlTown").removeAttr("disabled");
        }
    }
</script>
<input name="Areas$txt_AreaID" type="hidden" id="Areas_txt_AreaID" onchange="valueChange()" value="0" />
<input name="Areas$hf_AreaID" type="hidden" id="Areas_hf_AreaID" value="0" />
<div class="EditAreas">
    <span class="select">
        <select id="ddlProvice" name="ddlProvice" style="width: 90px;">
            <option value="-1">--省份--</option>
        </select></span>
    <span class="select">
        <select id="ddlCity" name="ddlCity" style="width: 90px;">
            <option value="-1">--城市--</option>
        </select></span>
    <span class="select">
        <select id="ddlCounty" name="ddlCounty" style="width: 90px;">
            <option value="-1">--区县--</option>
        </select></span>
    <span class="select">
        <select id="ddlTown" onchange="setValue()" name="ddlTown" style="width: 90px;">
            <option value="-1">--乡镇--</option>
        </select></span>
</div>

                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="th_text">原密码:</div>
                    </td>
                    <td>
                        <input name="txt_Pwd" type="password" id="txt_Pwd" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="th_text">新密码:</div>
                    </td>
                    <td>
                        <input name="txt_PwdNew" type="password" id="txt_PwdNew" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <div class="th_text">确认新密码:</div>
                    </td>
                    <td>
                        <input name="txt_PwdNewSure" type="password" id="txt_PwdNewSure" class="inw" />
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>

                <tr>
                    <td align="left">&nbsp;</td>
                    <td>
                        <label id="butt" class="butt">
                            <input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" /></label>
                    </td>
                    <td align="left" class="error_td">&nbsp;</td>
                </tr>
            </table>
        </div>
        <input type="hidden" name="CoFarmer_ID" id="CoFarmer_ID" />
        <input type="hidden" name="Farmer_ID" id="Farmer_ID" />
    </form>
</body>
</html>
