/**
*
*<input type="button" class="jhrzOpenHelper" />
*<div class='jhrzOpenHelper'><input type='button' value='....' title='请选择' /><div>
*/



(function ($) {

    function init(target) {
        var id = "btnChoose" + (new Date()).getTime().toString(36);
        var html = "<div class='jhrzOpenHelper' ";
        html += "style='width:120px;height:25px;lin-height:25px;border:1px solid #707070;padding:3px 0px 0px 0px;" + ($(target).attr("style") == undefined ? ";position:relative;" : $(target).attr("style")) + "'>";
        html += "<div id=\"jhrzHelper" + $(target).attr("id") + "\"></div>";
        html += "<input id='" + id + "' type='button' value='....' title='" + $(target).attr("data-title") + "' style='position:absolute;top:0px;right:2px;cursor:pointer;' />";
        html += "<div>";
        $(html).insertBefore($(target));
        $(target).css("display", "none");
        return { btn: $("#" + id), title: $(target).attr("data-title"),url: $(target).attr("data-url") };
    }
  
    //监听页面所有的.jhrzOpenHelper的元素
    $(document).ready(function () {

        if (typeof art == "undefined") {
            alert("请先引用/Content/js/artDialog/artDialog.js，/Content/js/artDialog/plugins/iframeTools.js");
            return false;
            /*
            var jss = ["/Content/js/artDialog/artDialog.js", "/Content/js/artDialog/plugins/iframeTools.js"];
            for (var js in jss) {
                if (js) {
                    var new_script = document.createElement("script");
                    new_script.setAttribute("src", jss[js]);
                    document.getElementsByTagName("HEAD")[0].appendChild(new_script);
                }
            }
            */
        }
        var _hps = $(".jhrzHelperOpen");
        $.each(_hps, function () {
            var options = init($(this));
            $(options.btn).bind("click", options, $.fn.openHelper.OnClick);
        })
    });
    //打开帮助方法
    $.fn.openHelper.OnClick = function (opt) {
        var options = $.extend({}, $.fn.openHelper.defaults, opt.data);
        art.dialog.open(options.url, {
            title: options.title,
            width: options.width,
            height: options.height,
            lock: true,
            // 在open()方法中，init会等待iframe加载完毕后执行
            init: function () {
               
               
            },
            cancel: true
        });
    };
    //配置选项
    $.fn.openHelper.defaults = {
        url: "",
        title: "",
        width: 400,
        height: 300
    };
})(jQuery);