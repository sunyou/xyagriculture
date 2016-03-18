/*设置location的hash的value*/

var sethash = function() {
    hashH = document.documentElement.scrollHeight; //获取页面的高度
    var hash = window.location.hash.slice(1); //获取锚记的参数
    location.hash = "#height=" + hashH;//设置锚记的高度
    var frameid = GetQueryString("FrameId");//获取frame的elementid
    var iObj = parent.document.getElementById(frameid);
    iObj.style.height = hashH + "px";
    setTimeout(sethash, 1000);
};
window.onload = sethash;

