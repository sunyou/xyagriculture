function createHtml(obj) {

    var id = (new Date()).getTime().toString(36);
    var htmstr = [];
    htmstr.push("<form id='_fileForm_" + id + "' enctype='multipart/form-data'>");
    htmstr.push("<table cellspacing=\"0\" cellpadding=\"3\" style=\"margin:margin-top:20px;\">");
    htmstr.push("<tr>");
    htmstr.push("<td class=\"tdt tdl\"><input id=\"loadcontrol\" type=\"file\" style=\"width:181px\" name=\"filepath\" id=\"filepath\" /></td>");
    htmstr.push("<td class=\"tdt tdl tdr\"><input type=\"button\" onclick=\"fileloadon('_fileForm_" + id + "','"+obj.attr('data-FileName')+"')\" value=\"上传\"/></td>");
    htmstr.push("</tr>");
    htmstr.push("<tr> <td class=\"tdt tdl tdr\" colspan='3'style='text-align:center;'><div id=\"msg\">&nbsp;</div></td> </tr>");
    htmstr.push("</table>")
    htmstr.push("</form>");
    obj.html(htmstr.join(""));
}

function fileloadon(formID,fildName) {
    $("#msg").html("");
   // $("img").attr({ "src": "/project/Images/processing.gif" });
    $("#" + formID).ajaxSubmit({
        type: "post",
        contentType: "application/x-www-form-urlencoded",
        url: "/fileUpload/FileUpload?CoFarmeID=" + $.cookie("Dept_ID"),
        success: function (data1) {
            var remsg = data1.split("|");
            var name = remsg[1].split("\/");
            if (remsg[0] == "1") {
                var type = name[name.length - 1].substring(name[name.length - 1].indexOf("."), name[name.length - 1].length);
                $("#msg").html("文件名：" + name[name.length - 1] + "   ---  " + remsg[2] );
                $("#divMsg").append("<input type='hidden' name='"+fildName+"' value='" + remsg[3] + "' />");
                switch (type) {
                    case ".jpg":
                    case ".jpeg":
                    case ".gif":
                    case ".bmp":
                    case ".png":
                        //$("img").attr({ "src": remsg[1] });
                        break;
                    default:
                       // $("img").attr({ "src": "/project/Images/msg_ok.png" });
                        break;
                }
            } else {
                alert("文件上传失败：" + remsg[2]);
               // $("#msg").html("文件上传失败：" + remsg[2]);
                //$("img").attr({ "src": "/project/Images/msg_error.png" });
            }
        },
        error: function (msg) {
            alert("文件上传失败");
        }
    });
    return false;
    $("#" + formID).submit();
}
