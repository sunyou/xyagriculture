
//***********************************��Ϊ��ҳ���ղؿ�ʼ*********************************************
function AddToFavorite() {
    if (document.all) {
        window.external.addFavorite(document.URL, document.title);
    } else if (window.sidebar) {
        window.sidebar.addPanel(document.title, document.URL, "");
    }
}

//��Ϊ��ҳ  
function setHomepage() {
    if (document.all) {
        document.body.style.behavior = 'url(#default#homepage)';
        document.body.setHomePage(document.URL);
    } else if (window.sidebar) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            } catch (e) {
                alert("�ò�����������ܾ�����������øù��ܣ����ڵ�ַ�������� about:config,Ȼ���� signed.applets.codebase_principal_support ֵ��Ϊtrue");
            }
        }
        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
        prefs.setCharPref('browser.startup.homepage', document.URL);
    }
}
//***********************************��Ϊ��ҳ���ղؽ���*********************************************

