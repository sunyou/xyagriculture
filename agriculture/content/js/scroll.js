/**
*author:王涛
*des:首页新闻滚动，和新闻图片切换
*timer:2013-08-29 周四
*/

/*新闻滚动*/
$(function(){
        var $this = $(".scrollNews");
		var scrollTimer;
		$this.hover(function(){
			  clearInterval(scrollTimer);
		 },function(){
		   scrollTimer = setInterval(function(){
						 scrollNews( $this );
					}, 3000 );
		}).trigger("mouseleave");
});
function scrollNews(obj){
   var $self = obj.find("ul:first"); 
   var lineHeight = $self.find("li:first").height(); //获取行高
   $self.animate({ "marginTop" : -lineHeight +"px" }, 900 , function(){
         $self.css({marginTop:0}).find("li:first").appendTo($self); //appendTo能直接移动元素
   })
}




/*首页图片新闻切换效果*/
$(function() {
    var len = $(".num > li").length;
    var index = 0;
    var adTimer;
    $(".num li").mouseover(function() {
        index = $(".num li").index(this);
        showImg(index);
    }).eq(0).mouseover();
    //滑入 停止动画，滑出开始动画.
    $('.ad').hover(function() {
        clearInterval(adTimer);
    }, function() {
        adTimer = setInterval(function() {
            showImg(index)
            index++;
            if (index == len) { index = 0; }
        }, 3000);
    }).trigger("mouseleave");
})
// 通过控制top ，来显示不同的幻灯片
function showImg(index) {
    var adHeight = $(".content_right .ad").height();
    $(".slider").stop(true, false).animate({ top: -adHeight * index }, 1000);
    $(".num li").removeClass("on")
			.eq(index).addClass("on");
}