<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>经销商申请</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=Keywords
	content=食品,溯源,追溯,系统,中国食品安全农产品溯源,中国食品安全农产品溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源>
<META name=Description
	content=农产品溯源,中国食品安全农产品溯源,食品溯源,中国食品安全农产品溯源,食用菌溯源,中国食品安全农产品溯源,安全农产品标准化生产溯源>
<LINK rel=Stylesheet type=text/css href="${ctx}/content/css/Custom.css?v=2015081410080444">
<LINK rel=Stylesheet type=text/css href="${ctx}/content/css/home.css?v=2015081410080444">
<LINK rel=stylesheet href="${ctx}/content/css/FileUpload.css">
<LINK rel=stylesheet href="${ctx}/content/js/artDialog/skins/opera.css?4.1.7">

</HEAD>
<BODY id=cbody windowc_onresizez="true">
	<DIV style="POSITION: absolute; DISPLAY: none" @cache1446108512761="2">
		<DIV class=aui_outer>
			<TABLE class=aui_border>
				<TBODY>
					<TR>
						<TD class=aui_nw></TD>
						<TD class=aui_n></TD>
						<TD class=aui_ne></TD>
					</TR>
					<TR>
						<TD class=aui_w></TD>
						<TD class=aui_c>
							<DIV class=aui_inner>
								<TABLE class=aui_dialog>
									<TBODY>
										<TR>
											<TD class=aui_header colSpan=2>
												<DIV class=aui_titleBar>
													<DIV style="DISPLAY: none; CURSOR: move" class=aui_title></DIV>
													<A style="DISPLAY: none" class=aui_close
														href="javascript:;">×</A>
												</DIV>
											</TD>
										</TR>
										<TR>
											<TD style="DISPLAY: none" class=aui_icon>
												<DIV
													style="BACKGROUND: none transparent scroll repeat 0% 0%"
													class=aui_iconBg></DIV>
											</TD>
											<TD style="WIDTH: auto; HEIGHT: auto" class=aui_main>
												<DIV
													style="PADDING-BOTTOM: 20px; PADDING-LEFT: 25px; PADDING-RIGHT: 25px; PADDING-TOP: 20px"
													class=aui_content></DIV>
											</TD>
										</TR>
										<TR>
											<TD class=aui_footer colSpan=2>
												<DIV style="DISPLAY: none" class=aui_buttons>&nbsp;</DIV>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
						</TD>
						<TD class=aui_e></TD>
					</TR>
					<TR>
						<TD class=aui_sw></TD>
						<TD class=aui_s></TD>
						<TD style="CURSOR: se-resize" class=aui_se></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</DIV>
	<FORM id=form1 method=post action=SupplierApply.aspx
		360chrome_form_autofill="2">
		<DIV class=aspNetHidden>
			<INPUT id=__VIEWSTATE
				value=/wEPDwUKMTk1ODg0NDgwOQ9kFgJmD2QWBAIBDxYCHgdWaXNpYmxlaBYSZg8PFgIeBFRleHQFD+e7j+mUgOWVhuWQjeensGRkAgEPDxYCHwEFBuazleS6umRkAgIPDxYCHwEFCzEzNDc4NDkwOTg3ZGQCAw8PFgIfAQUNMjM0MjM0QHFxLmNvbWRkAgQPZBYCAgEPFgIeBXZhbHVlBQk0NjAxMDUwMDJkAgUPDxYCHwEFDm5vbmdqaXpob25neGluZGQCBg8PFgIfAQUHdmluY2VudGRkAggPDxYCHwEFA3p6ZGRkAgkPDxYCHwEFBnNkYXNkYWRkAgMPFgIfAGdkZF7+H92xaV2LMqd64OMLSjjsyOENjO5J0QHMwPYD2lX+
				type=hidden name=__VIEWSTATE>
		</DIV>
		<DIV style="MARGIN: 0px auto; WIDTH: 670px">
			<DIV style="MARGIN-TOP: 100px" id=cofarmerTop class=cofarmerTop>
				<DIV id=cofar_title_pic>
					<IMG src="${ctx }/images/jinxiaoshang.png">
				</DIV>
				<DIV class=cofar_title>
					<SPAN class=title_cn>经销商申请</SPAN> <SPAN class=title_en>Supplier
						to apply for</SPAN>
				</DIV>
			</DIV>
			<DIV class=cofarmerMiddle>
				<DIV id=regresult>
					<DIV class=result_content>
						<DIV id=mess_title class=mess_title>
							<SPAN class=mess_icon_success></SPAN><SPAN class=mess_text>注册成功啦</SPAN>
						</DIV>
						<P>
							^_^ 恭喜您提交的申请已被受理，我们将在<BR>3-5个工作日审核通过后通过邮件或者短信通<BR>知您。请您注意查收邮件或者短信。<BR>请提交以下资料到杨凌安全产品公司。
						
						<OL>
							<LI>营业执照复印件
							<LI>机构代码证复印件
							<LI>税务登记证复印件
							<LI>法人证复印件
							<LI>书面申请
							<LI>法人身份证复印件
							<LI>认证基地种植情况说明
							<LI>经销商，企业简介</LI>
						</OL>
						<DIV>
							<P>
								<FONT color=red>*</FONT>以上资料必须加盖公章<BR>基地准入流程:<BR>网上注册→提交资料→资料审核→基地认证→发放ID卡及帐号→准备设备存放处→溯源公司审核→安装设备
							</P>
						</DIV>
						<P></P>
					</DIV>
				</DIV>
			</DIV>
			<DIV class=cofarmerBottom></DIV>
		</DIV>
		<DIV style="DISPLAY: none" id=divMsg name="divMsg"></DIV>
	</FORM>
	<DIV
		style="POSITION: fixed; FILTER: alpha(opacity=0); WIDTH: 100%; DISPLAY: none; BACKGROUND: #fff; HEIGHT: 100%; TOP: 0px; CURSOR: move; LEFT: 0px; opacity: 0"></DIV>
</BODY>
</html>
