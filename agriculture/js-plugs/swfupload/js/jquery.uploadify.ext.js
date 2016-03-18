/** 
 * @author songxiaoliang
 */
(function ($) { 
    $.fn.uploadifyExt = function(options){
    	var baseUrl = options && options.baseUrl ? options.baseUrl : "";
    	var sessionId = options && options.sessionId ? options.sessionId : "";
		if(baseUrl == '') {
			alert('请定义应用根路径！');
			return;
		}
		if(sessionId == '') {
			alert('请传入sessionId！');
			return;
		}
		
		var swf = baseUrl+'js-plugs/swfupload/css/uploadify.swf';
		var uploader = baseUrl+'/file/upload.ajax;jsessionid='+sessionId;
		var cancelImg = baseUrl+'js-plugs/swfupload/images/uploadify-cancel.png';
        var settings = {
			'height': '20',//上传按钮的高度
			'width': '120',//上传按钮的长度
			'fileObjName':'file',
			'buttonText': '上传附件',//上传按钮的名字
			'swf'      : swf,//对应的SWF文件
			'uploader' : uploader,//上传文件请求url
			'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png;*.doc;*.docx;*.xls;*.xlsx;*.ppt;*.pptx;*.pdf;*.rar;*.zip',//文件格式
			'auto':true,//选定文件后是否自动上传
			'fileSizeLimit':'10MB',//上传文件的大小限制。
			'successTimeout' : 9999,//超时时间
			'simUploadLimit':1,
			'multi':true,//是否允许同时上传多文件，可设定true或false
			'onFallback':function(){//检测FLASH失败调用
				alert("未安装FLASH插件");
	        },
	        //上传到服务器，服务器返回相应信息到data里
	        'onUploadSuccess':function(file, data, response){
	        	var jd =JSON.parse(data);
	        	alert(jd.success);
	        	var success = validateSize(file.name, file.size);
	        	if(success){
	        		removeProgress(file.name);
		            insertRows(file.name,data,file.size);//上传成功后返回处理，这里是将上传后的文件名字返回回来，设置给隐藏域。同时显示本地文件名和文件大小。
	        	}
	        },
	        //选择上传文件后调用
	        'onSelect' : function(file) {
	        },
	        //每次更新上载的文件的进展
	        'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
	            //$('#progress').html(totalBytesUploaded + ' bytes uploaded of ' + totalBytesTotal + ' bytes.');
	        },
	        'onUploadComplete':function(file, data, response){
	        },
	        'onError' :function (event,queueId,fileObj,errorObj){
	        	alert(errorObj.type+":\t"+errorObj.info);
	        }
		};
        $.extend(settings, options);

		var fileType = options && options.type ? options.type : 'N';	//文件类型，区分一个表单多个文件情况
		var currFileSize = options && options.currFileSize ? options.currFileSize : 0;//当前用户上传文件总大小（单位:字节长度）
		var maxSize = options && options.maxSize ? options.maxSize : 9999;	//单位M
		
		var targetId = $(this).attr('id');
		var $target = $('#'+targetId);

        appendHtml();
        uploadify();
        
        function appendHtml(){
        	var _html = [
				'<table border="0" cellpadding="0" cellspacing="0">',
					'<tr>',
						'<td style="border:0;">',
							'<input id="_swfupload" name="file" type="file" multiple="true"/>',
						'</td>',
					'</tr>',
					'<tr>',
						'<td style="border: 0;height: 0px" id="_swfuploadFiles"></td>',
					'</tr>',
		         '</table>',
        		];
        	$html = $(_html.join(""));
        	$target.append($html);
        }
        
        function uploadify(){
        	$target.find('#_swfupload').uploadify(settings);
        } 
        function validateSize(fileName, uploadSize){
			if((currFileSize+uploadSize) > maxSize*1024*1024){
				alert('上传失败：文件总量已超过'+maxSize+'M！');
				return false;
			}else{
				currFileSize+=uploadSize;
				return true;
			}
		}
		function removeProgress(fileName){
			fileName = fileName.substr(0,25);
			$('.uploadify-queue-item').each(function(){
				var content = $(this).find('.fileName').html();
				if(content.indexOf(fileName)!=-1){
					$(this).remove();
					return;
				}
			})
		}
		function insertRows(originalName, saveName, size){
			var html = '<div>' +
							'<input type="hidden" name="originalName" value="#originalName"/> ' +
							'<input type="hidden" name="saveName" value="#saveName"/> ' +
							'<input type="hidden" name="fileSize" value="#fileSize"/> ' +
							'<a href="#" style="color:blue">#originalName (#fileSizeDes)</a>' +
							'<img src="'+cancelImg+'" title="删除" style="cursor: pointer;margin-left: 10px"/>' +
						'</div>';
			html = html.replaceAll('#originalName',originalName);
			html = html.replaceAll('#saveName',saveName);
			html = html.replaceAll('#fileSize',size);
			var fileSizeDes;
			var disSize = size/1024;
			if(disSize<1000){
				fileSizeDes = Math.round(disSize) +'KB';
			}
			else{
				disSize = disSize/1024;
				fileSizeDes = Math.round(disSize) +'MB';
			}
			html = html.replaceAll('#fileSizeDes',fileSizeDes);
			var $html = $(html);
			$html.find('a').click(function(){
				alert('下载');
				//download(fileName, saveName);
			})
			$html.find('img').click(function(){
				$(this).parent().remove();
			})
			
			$('#_swfuploadFiles').append($html);
		}
    };
})(jQuery);
