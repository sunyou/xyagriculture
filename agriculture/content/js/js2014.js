


/**
*===========================
*description:后台管理公共函数
*author:叶明龙
*createTime:2014-02-20
*===========================
*/






/**
*@height:窗口的高度
*@url:窗口的高度
*@title:窗口的高度标题
*/
function ligerWin(width, height, url, title) {
    if (liger) {
        $.ligerDialog.open({
            width: width,
            height: height,
            url: url,
            showMax: true,
            isHidden: false,
            allowClose: true,
            isResize: true,
            slide: false,
            title: title
        });
    } else alert("请页面引用ligerui.js在刷新页面");
}



function ligerConfirm(lk) {
    if (liger) {
        $.ligerDialog.confirm('确定删除当前项吗', function (yes) {
            if (yes) {
                var chls = lk.children;
                for (var ch in chls) {
                    if (chls[ch].nodeName && chls[ch].nodeType == 1) {
                        chls[ch].click();
                    }
                }
            }

        });
        return false;
    } else alert("请页面引用ligerui.js在刷新页面");

}

