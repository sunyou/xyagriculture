<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>饲料申请</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/home.css?v=2015081410080444" />
	<script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/My97DatePicker/WdatePicker.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/content/js/My97DatePicker/skin/default/datepicker.css" />
	<script type="text/javascript" src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
</head>
<body>
	<div class="edit_panel">
		<form method="post" action="FeedAudit.aspx" id="ctl00">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTQ2OTk2OTE5M2RkbNSHtc16jQcONWaoQpRpthULFDIEPL/MRhYfKRi4IeI=" />
</div>

			<table bgcolor="#68bdc4" border="0" cellpadding="3" cellspacing="1" width="801" style="width: 800px; margin: 0px auto;" class="tbgb">
			  <tr>
				<td width="110" align="center" bgcolor="#f1f6fa" class="thbg">饲料名</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">生产许可证号</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input2" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">产品执行标准</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input3" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">产品批准文号</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input4" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">净重</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input5" value="" class="inw Nonb" />
				  kg</td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">生产单位</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input6" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">有效成分</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input7" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">药理作用</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input8" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">功能</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input9" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">使用对象</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input10" value="" class="inw Nonb" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa" class="thbg">生产日期</td>
				<td bgcolor="#FFFFFF" class="tdbg">
				  <input type="text" name="input11" value="" class="inw Nonb" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });" readonly="readonly" />
				  </td>
			  </tr>
			  <tr>
				<td align="center" bgcolor="#f1f6fa">&nbsp;</td>
				<td bgcolor="#FFFFFF" class="tdbg"><label id="butt" class="butt">
					<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />
				  </label>
				  <label id="butt" class="butt">
					<input type="submit" name="btn_Save" value="提交" id="btn_Save" class="xybtn" />
				  </label></td>
			  </tr>
			</table>
		</form>	
	</div>
</body>
</html>
