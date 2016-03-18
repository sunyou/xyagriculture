/*
*title:动态加载script文件
*description:动态加载scrip
*time：2012-05-16
*/

function load_script(url, callback) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    if (script.readyState) {  //IE 
        script.onreadystatechange = function() {
            if (script.readyState == 'loaded' || script.readyState == 'complete') {
                script.onreadystatechange = null;
                callback();
            }
        }
    } else {  //others 
        script.onload = function() {
            callback();
        }
    }
    script.src = url;
    document.getElementsByTagName('head')[0].appendChild(script);
}


/**
*动态加载js 摘自:http://www.zhangjingwei.com/archives/asynchronous-loading-js/
*description:同步加载，按顺序加载javascript文件
*/
var loadscript =
{
    $$: function(id) { return document.getElementById(id) },
    tag: function(element) { return document.getElementsByTagName(element) },
    ce: function(element) { return document.createElement(element) },
    ls: function(url) {
        var req = this.createXmlHttp();
        req.open('GET', url, false);
        req.send(null);
        try {
            if (req.status == 200 || req.status == 0)
                window.eval(req.responseText);
        } catch (e) { }
    },
    createXmlHttp: function() {
        var xmlHttp;
        if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        } else if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        }
        return xmlHttp;
    }
}