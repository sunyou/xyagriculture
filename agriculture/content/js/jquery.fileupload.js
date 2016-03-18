/** 
 * @author songxiaoliang
 */
(function ($) { 
    $.fn.fileupload = function(options){
        var settings = {
			width : '100%',
			module : '',
			filePathId : '',	//文件上传成功后，返回保存路径
			validTypes : '' //文件有效后缀验证，值如：jpg,jpeg,gif,bmp,png
        }
        $.extend(settings, options);

		var targetId = $(this).attr('id');
		var $target = $('#'+targetId);
		
		//alert($('#'+settings.filePathId).prop("outerHTML"));
        appendHtml();
        bindEvents();
        
        $target.find('#FUMsg').html($('#'+settings.filePathId).val());
        
        function appendHtml(){
        	var html = [
				'<form action="/file/upload?cofarmeId=" enctype="multipart/form-data" method="post" id="ff">',
					'<table style="margin:0;width:'+settings.width+';" cellpadding="3" cellspacing="0">',
						'<input type="hidden" name="module" value="'+settings.module+'" />',
						'<tr>',
							'<td>',
								'<input style="width: 180px" id="fi" name="file" type="file">',
							'</td>',
							'<td style="width:40px">',
								'<input id="FUButton" value="上传" type="button">',
							'</td>',
							'<td style="text-align:center;width:200px">',
								'<div id="FUMsg"></div>',
							'</td>',
						'</tr>',
					'</table>',
				'</form>'
        		];
        		
        	$target.append(html.join(""));
        }
        
        function bindEvents(){
        	$target.find('#FUButton').click(function(){
        		if(!validate()) return;
        		
        		$target.find('form').ajaxSubmit({
			        type: "post",
			        dataType: "json",
				    returnType:"json",
			        contentType: "application/x-www-form-urlencoded",
			        url: "../file/upload.ajax",
			        success: function (jsonData) {
						//后台操作成功
						if(jsonData.success && jsonData.success == true){
							var originalName = jsonData.originalName;	//原文件名
							var suffixName = jsonData.suffixName;		//文件后缀名
							var saveName = jsonData.saveName;			//保存名：时间戳+原文件后缀
							var savePath = jsonData.savePath;			//保存路径
							//alert(originalName+" | "+savePath);
							var tips = "文件<font style='color:blue'> ["+originalName+"] </font>上传成功！";
							$target.find('#FUMsg').html(tips);

							$('#'+settings.filePathId).val(savePath);
						}
						//后台操作失败
						else{
							openDialogInDiv('操作失败，失败原因：'+jsonData.message,function(){});
						}
			        },
			       error : function(XMLResponse) {
						openDialogInDiv(XMLResponse.responseText,function(){});
					},
			    });
        	});
        }
        var illegalTypes = 'html,jsp,js,css,htm,swf';	//非法类型
        function validate(){
        	var fileName = $target.find("[name='file']").val();
        	var suffix = fileName.substring(fileName.lastIndexOf('.')+1);
        	//文件为空验证
       		if(fileName==''){
       			openDialogInDiv('请选择文件！',function(){});
       			$('#fi').focus();
       			return false;
       		}
       		//文件后缀验证
       		if(settings.validTypes!='' && settings.validTypes.indexOf(suffix.toLowerCase())==-1){
       			openDialogInDiv('文件格式不正确，必须为：'+settings.validTypes,function(){});
       			return false;
       		}
       		//非法类型验证
       		if(illegalTypes.indexOf(suffix.toLowerCase())!=-1){
       			openDialogInDiv('文件格式不正确!',function(){});
       			return false;
       		}
       		return true;
        }
    };
})(jQuery);
