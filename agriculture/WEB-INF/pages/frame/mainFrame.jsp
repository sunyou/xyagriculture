<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<c:set var="user" value="${sessionScope._USER_INFO_MAP_}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>农产品溯源管理系统</title>
    <%@ include file="/common/meta.jsp" %>
    <link rel="stylesheet" type="text/css" href="${ctx}/content/css/home.css?v={JS_VERSION}" />
	<style type="text/css">
		.expand  { overflow:visible;}
		.collapse  {overflow:hidden;}
	</style>

    <script type="text/javascript">
        var tab = null;
        var accordion = null;
        $(document).ready(function () {
        	
            //布局
            $("#layout1").ligerLayout({
                allowLeftResize: true,
                leftWidth: 200,
                height: '100%',
                heightDiff: -34,
                space: 4,
                onHeightChanged: f_heightChanged
            });
            var height = $(".l-layout-center").height();
            $("#framecenter").ligerTab(
            { height: height }
            );
            //面板
            //$("#accordion1").ligerAccordion({ height: height - 24, speed: null });
            $(".l-link").hover(function () {
                $(this).addClass("l-link-over");
            }, function () {
                $(this).removeClass("l-link-over");
            });
            
            tab = $("#framecenter").ligerGetTabManager();
            //accordion = $("#accordion1").ligerGetAccordionManager();
            $("#pageloading").hide();
            
            
            queryMenuTree(currentMenuPid);
            
            //密码修改
            $("#changeUserPwd").click(function(){
            	var userNo = $("#userNo").val();
				art.dialog.open("sysmanage/sysUserPwdChange.html?userNo="+userNo, { title: '密码修改', background: '#FFFFFF', opacity: 0.8, width: 450, height: 250, lock: true }, false);
				
			});
            
        });

        //增加支持“父标题选中,取消”展开菜单
        function treeExpandNode(node, cls) {
            if (node.data.isexpand != undefined) {
                tree.collapseAll();
                $(node.target).find(cls).trigger("click");
            }
        }

        function f_heightChanged(options) {
            if (tab)
                tab.addHeight(options.diff);
            if (accordion && options.middleHeight - 24 > 0)
                accordion.setHeight(options.middleHeight - 24);
        }
        function f_addTab(tabid, text, url) {
            tab.addTabItem({ tabid: tabid, text: text, url: url });
        }
        
        function clearTab() {
        	tab.removeAll();
        }
        
        <c:if test="${!empty sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems}">
			var currentMenuPid = ${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems[0].menuId};
			var currentmainPageId;
			var currentmainPageTitle;
			var currentmainPageUrl;
			<c:if test="${!empty sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems[0].childMenuItems}">
				currentmainPageId = ${sessionScope['_USER_INFO_MAP_'].menuTree.childMenuItems[0].childMenuItems[0].menuId};
				currentmainPageTitle = '${user.menuTree.childMenuItems[0].childMenuItems[0].menuItem.menuName}';
				currentmainPageUrl = '${user.menuTree.childMenuItems[0].childMenuItems[0].menuItem.menuUrl}';
			</c:if>
		</c:if>
		
		
		function setCurrentMenu(menu_pid) {

			var allChild = $('#menuHead').children();
			if (allChild[0]) {
				
				$("a[name='smenu']").removeClass("current");
				$('#menu_head_' + menu_pid).addClass("current");
			}

		}

		function queryMenuTree(menu_pid,menu_ptitle,flagt) {
			if (!menu_pid)
				return;
			if (currentMenuPid && currentMenuPid == menu_pid) {

			} else {
				currentMenuPid = menu_pid;
			}
			
			/*if(currentmainPageId && currentmainPageUrl){
				tab.addTabItem({text:currentmainPageTitle,tabid:currentmainPageId,url:currentmainPageUrl});
		    }*/
			setCurrentMenu(menu_pid);

			var url = GLOBAL.WEBROOT + '/loginframe/getLeftMenu.html?catalogId='+currentMenuPid;
			$.ajax({
				url : url,
				type : 'post',
				dataType : 'text',
				error : function(XMLHttpRequest, textStatus) {
					alert("error:" + XMLHttpRequest.status);
				},
				success : function(result) {
					$('#childMenuDiv').html(result);
					var textv = $("#childMenuDiv a:eq(0)").attr("text");
					var urlv = $("#childMenuDiv a:eq(0)").attr("url");
					var tabidv = $("#childMenuDiv a:eq(0)").attr("tabid");
					if(urlv && tabidv) {
						if(flagt) {
							tab.addTabItem({text:textv,tabid:tabidv,url:urlv});
						}
					}
				}

			});
			
			
			
		}
		
		function toggleTreeLevelTree(menuPid) {
			if($("#"+menuPid+" a").attr("class")=="left-arrow-right") {
				$("#"+menuPid+" a").removeClass("left-arrow-right");
				$("#"+menuPid+" a").addClass("left-arrow-bottom");
			} else {
				$("#"+menuPid+" a").removeClass("left-arrow-bottom");
				$("#"+menuPid+" a").addClass("left-arrow-right");
			}
			if($("#three_"+menuPid).attr("class")=="collapse") {
				$("#three_"+menuPid).removeClass("collapse");
				$("#three_"+menuPid).addClass("expand");
			} else {
				$("#three_"+menuPid).removeClass("expand");
				$("#three_"+menuPid).addClass("collapse");
			}
			//1.9后这个不起作用 屏蔽
			/*$("#three_"+menuPid).toggle(
				  function(){
					  
					  $(this).removeClass("collapse");
					  $(this).addClass("expand");
				  },
				  function(){
					  
					  $(this).removeClass("expand");
					  $(this).addClass("collapse");
				  }
			);*/
		}
		
		function addCurrentClass(obj) {
			alert($(obj).html());
		}
		
		
		var TABM = {};
		TABM.index = 0;
		TABM.count = 1;
		TABM.homeTitle = "工作台";
		//添加页签
		TABM.add = function(option){
			TAB.index++;
			var title = option.title||"新页签_"+TAB.index;
			var url = option.url||"about:blank";	
			var menuId = option.menuId||"0";
			var content = option.content;
			var callback = option.callback;
			url = WEB.trim(url);	
			var httpReg = /^http/;
			if(httpReg.test(url)){
			  ///以http开头，替换参数
			  url = WEB.replaceAll(url,"{userNo}","${user.loginUser.userNo}");
			} else {
			  if(url!="about:blank"){
				url = GLOBAL.WEBROOT+"/"+url;
			  }
			}
			
			tab.addTabItem({ tabid: menuId, text: title, url: url, content: content, callback: callback });
		};

		//根据tabid选择页签
		TABM.select = function(tabid){
			tab.selectTabItem(tabid);
		};
		

		//根据tabid关闭页签
		TABM.close = function(tabid){
			tab.removeTabItem(tabid);
		}
		
    </script>
    <script language="javascript" src="${ctx}/js/bootstrap.min.js" ></script>
    <script language="javascript" src="${ctx}/js/jquery.placeholder.min.js" ></script>
    <script type="text/javascript">
        $(function () {
            // Invoke the plugin
            $('input, textarea').placeholder();
        });
    </script>
    
</head>
<body style="overflow: hidden">
    <form method="post" action="Index.aspx" id="form1">
    	<input type="hidden" id="userNo" name="userNo" value="${user.loginUser.userNo}" />
		<div class="aspNetHidden">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE0MTcwNDQ1MjNkZIsNFwHsGd8MqCczZb20hvCYl80dOFwCXhO0fKTe6xnZ" />
		</div>
		<div id="pageloading"></div>
		
		<!--header begin-->
<div class="wrap100 header">
    <div class="logo"><a href="#"><img src="${ctx}/images/logo1.gif" /></a><h3>(${userTypeName})</h3></div>
    
    <!--menu begin-->
    <div class="menu">
        <ul class="fl" id="menuHead">
            <c:set var="className" value="menu02"/>
	        <c:forEach items="${MENU_LEVEL1_FOLDER}" var="menuBean" varStatus="menuBeanStat">
	        	<c:if test="${menuBean.menuType != 4 || menuBean.menuType != '4'}">
		     		<li>
				     	<c:choose>
							<c:when test="${menuBeanStat.first}">
								<div class='${className}' id='pmenuId_${menuBean.menuId}'> <a href="javascript:void(0)" 
					      	 name="smenu" id="menu_head_${menuBean.menuId}" onclick="javascript:clearTab();javascript:queryMenuTree('${menuBean.menuId}','${menuBean.menuName}',false);"  > 
					     	 ${menuBean.menuName}</a> </div>
							</c:when>
							<c:otherwise>
								<div class='${className}' id='pmenuId_${menuBean.menuId}'> <a href="javascript:void(0)" 
					      	 name="smenu" id="menu_head_${menuBean.menuId}" onclick="javascript:clearTab();javascript:queryMenuTree('${menuBean.menuId}','${menuBean.menuName}',true);"  > 
					     	 ${menuBean.menuName}</a> </div>
							</c:otherwise>
						</c:choose>
		     		</li>
		     	</c:if>
	 		</c:forEach>
        </ul>
        <div class="cl"></div>
    </div>
    <!--menu end-->
    <!--quickMenu begin-->
    <div class="quickMenu">
        <div class="fl loginInfo"><i class="t-icon1" ></i>欢迎您!&nbsp;${user.loginUser.userName}(${user.loginUser.userNo})</div>
		<div class="fl loginInfo"><i class="t-icon3" ></i><a id="changeUserPwd" href="javascript:void(0)">修改密码</a></div>
		<div class="fl loginInfo"><i class="t-icon2" ></i><a href="${ctx}/loginframe/logout.html">注销</a></div>
        <div class="cl"></div>
    </div>
    <!--quickMenu end-->

</div>
</div>
        <div id="layout1" style="width: 99.2%; margin: 0 auto; margin-top: 4px; font-weight: bolder; font-size: 14px" >
             
            <div position="left" id="accordion1" class="content" title="">
            <!--left begin-->
		    <div class="fl left" id="childMenuDiv">
		    </div>
		    <!--left end-->
		
            </div>
            <div position="center" id="framecenter" style="height: 100%;">
            	<c:if test="${user.loginUser.usertypeId!=0}">
	                <div tabid="home" title="工作台" style="height: 100%">
	                    <iframe frameborder="0" name="home" id="home" src="${ctx}/loginframe/home.html"></iframe>
	                </div>
				</c:if>
            </div>
        </div>
        <div class="copyright_info">欢迎进入农产品溯源管理系统&nbsp;&nbsp;&nbsp;</div>
        <p>
            &nbsp;
        </p>
        <input id="dataMsg" type="hidden" value="" />
    </form>
</body>
</html>
