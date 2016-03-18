
//***********************************设为首页，收藏开始*********************************************
function AddToFavorite() {
    if (document.all) {
        window.external.addFavorite(document.URL, document.title);
    } else if (window.sidebar) {
        window.sidebar.addPanel(document.title, document.URL, "");
    }
}

//设为首页  
function setHomepage() {
    if (document.all) {
        document.body.style.behavior = 'url(#default#homepage)';
        document.body.setHomePage(document.URL);
    } else if (window.sidebar) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            } catch (e) {
                alert("该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true");
            }
        }
        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
        prefs.setCharPref('browser.startup.homepage', document.URL);
    }
}
//***********************************设为首页，收藏结束*********************************************

