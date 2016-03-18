<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>智能化诊断</title>
    <link rel="Stylesheet" type="text/css" href="${ctx}/content/css/Custom.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/css.css?v=2015081410080444" />
    <link rel="stylesheet" type="text/css" href="${ctx}/content/js/LigerUI/skins/green/css/ligerui-all.css" />
    <link href="${ctx}/content/css/default.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/content/js/jquery.Wookmark/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/content/js/jquery.Wookmark/css/magnific-popup.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/content/js/jquery.Wookmark/css/main.css" rel="stylesheet" type="text/css" />
	
</head>
<body>
  <div id="layout">
	<div position="top">
		<div class="rtittab">
			<div class="rtitbg2">
				<div class="rtxt left">农作物：</div>
				<div class="sert left">
					<input name="txt_GoodsName" type="text" id="txt_GoodsName" disabled="disabled" class="aspNetDisabled" />
					<input name="goodsId" id="goodsId" type="hidden" />
                       <input class="input_selectJSY" type="button" value="选择" onclick="openHelper('${ctx}/Goods/Helper/Goods_Helper.html', { id: 'txt_GoodsName,goodsId', key: 'GOODS_NAME,GOODS_ID' }, '农作物--选择帮助界面', 500, 400);" />
				</div>
				<div class="rtxt left">作物部位：</div>
				<div class="sert left">
					<select name="pestPartCode" id="pestPartCode">
						<option value="">请选择</option>
						<option value="80">叶片</option>
						<option value="81">根系</option>
						<option value="82">花朵</option>
						<option value="83">果实</option>
						<option value="84">茎蔓</option>
						<option value="113">幼苗</option>
						<option value="114">植株</option>
						<option value="115">幼苗或幼虫</option>
						<option value="116">成虫</option>
						<option value="117">卵</option>
						<option value="118">蛹</option>
						<option value="119">病原菌</option>
						<option value="99">其他</option>
					</select>
				</div>
				<div class="serb left">
					<input type="button" onclick="loadGoodsPestImg();" value="智能诊断" class="btn_tool_search" />
					<input type="button" onclick="reset();" value="重置" class="btn_tool_search" />
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div id="container">
	    <div id="main">
	      <ul id="tiles">
	        
	      </ul>
	    </div>
	  </div>
	</div>
	<input name="page" id="page" value="1" type="hidden" />
	<input name="limit" id="limit" value="30" type="hidden" />
    <script type="text/javascript" src="${ctx}/content/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/LigerUI/ligerui.all.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.cookie.js"></script>
    <script src="${ctx}/content/js/artDialog/artDialog.js?skin=green"></script>
    <script src="${ctx}/content/js/artDialog/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="${ctx}/content/js/public.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.Wookmark/libs/jquery.imagesloaded.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.Wookmark/libs/jquery.magnific-popup.min.js?v=2015081410080444"></script>
    <script type="text/javascript" src="${ctx}/content/js/jquery.Wookmark/jquery.wookmark.js?v=2015081410080444"></script>
	<script type="text/javascript">
	      var $tiles = $('#tiles'),
	          $handler = $('li', $tiles),
	          $main = $('#main'),
	          $window = $(window),
	          $document = $(document),
	          options = {
	            autoResize: true, // This will auto-update the layout when the browser window is resized.
	            container: $main, // Optional, used for some extra CSS styling
	            offset: 20, // Optional, the distance between grid items
	            itemWidth: 210 // Optional, the width of a grid item
	          };
	      /**
	       * Reinitializes the wookmark handler after all images have loaded
	       */
	      function applyLayout() {
	        $tiles.imagesLoaded(function() {
	          // Destroy the old handler
	          if ($handler.wookmarkInstance) {
	            $handler.wookmarkInstance.clear();
	          }

	          // Create a new layout handler.
	          $handler = $('li', $tiles);
	          $handler.wookmark(options);
	        });
	      }

	      /**
	       * When scrolled all the way to the bottom, add more tiles
	       */
	      function onScroll() {
	        // Check if we're within 100 pixels of the bottom edge of the broser window.
	        var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
	            closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);

	        if (closeToBottom) {
	          // Get the first then items from the grid, clone them, and add them to the bottom of the grid
	          /* var $items = $('li', $tiles),
	              $firstTen = $items.slice(0, 10);
	          $tiles.append($firstTen.clone());
	          applyLayout(); */
	          loadGoodsPestImg();
	        }
	      };

	   	  // Call the layout function for the first time
	   	  loadGoodsPestImg();

	      // Capture scroll event.
	      $window.bind('scroll.wookmark', onScroll);
	      
	      // prepare load render lightbox
	      // Init lightbox
	      $('#tiles').magnificPopup({
	        delegate: 'li:not(.inactive) a',
	        type: 'image',
	        gallery: {
	          enabled: true
	        }
	      });
	
		//call ajax to load goodspestImg
	    function loadGoodsPestImg(){
	  	  $.ajax({
		   		type:"POST",
		   		url:"${ctx}/Pest/GetPestDiag.ajax",
		   		data:{
		   			"goodsId":$("#goodsId").val(),
		   			"pestPartCode":$("#pestPartCode").val(),
		   			"page":Number($("#page").val()),
		   			"limit":Number($("#limit").val())
		   		},
		   		success:function(result){
		   			if(result.success){
		   				if(result.total == 0){
		   					$('#tiles').empty();
		   					return;
		   				}
		   				var li = 0;
		   				//页数加1
		   				$('#tiles').empty();
		   				$("#page").val(Number($("#page").val())+1);
		   				for(var i = 0,len = result.data.length; i < len; i++){
		   					var obj = result.data[i];
		   					if(obj.IMAGEURL){
		   						li = $('<li><a href="${ctx}/Download?filePath='+ obj.IMAGEURL +'"><img src="${ctx}/Download?filePath='+ obj.IMAGEURL +'" width="200"></a><p style="text-align:left;">农作物:'+obj.GOODS_NAME+'<br/>作物部位:'+getPestPartCodeName(obj.PESTPARTCODE)+'<br/>病虫害名称:'+obj.GOODPEST_NAME+'</p></li>');
		   					}else{
		   						li = $('<li><a href="${ctx}/images/IMGLOSE.GIF"><img src="${ctx}/upload/111.jpg" width="200" height="160"></a><p style="text-align:left;">农作物:'+obj.GOODS_NAME+'<br/>作物部位:'+getPestPartCodeName(obj.PESTPARTCODE)+'<br/>病虫害名称:'+obj.GOODPEST_NAME+'</p></li>');
		   					}
		   					$('#tiles').append(li);
		   				}
		   			    applyLayout();
		   			}else if(result.message){
		   				alert(result.message);
		   			}
		   		}
		   	});
	    }
		
		function reset(){
			$("#txt_GoodsName").val('');
			$("#goodsId").val('');
			$("#pestPartCode").val('');
			loadGoodsPestImg();
		}
		
		function getPestPartCodeName(pestPartCode){
			switch (pestPartCode) {
			case 80:
				return "叶片";
			case 81:
				return "根系";
			case 82:
				return "花朵";
			case 83:
				return "果实";
			case 84:
				return "茎蔓";
			case 113:
				return "幼苗";
			case 114:
				return "植株";
			case 115:
				return "幼苗或幼虫";
			case 116:
				return "成虫";
			case 117:
				return "卵";
			case 118:
				return "蛹";
			case 119:
				return "病原菌";
			case 99:
				return "其他";
			default:
				break;
			}
		}
	</script>
</body>
</html>
