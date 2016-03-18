/**  
*使用方法   
*$(文本域选择器).insertContent("插入的内容");   
*$(文本域选择器).insertContent("插入的内容"，数值); //根据数值选中插入文本内容两边的边界, 数值: 0是表示插入文字全部选择，-1表示插入文字两边各少选中一个字符。   */
//在光标位置插入内容, 并选中
(function($) {
    $.fn.extend({ insertContent: function(myValue, t) {
        var $t = $(this)[0]; if (document.selection) {
            //ie   
            this.focus();
            var sel = document.selection.createRange();
            sel.text = myValue; this.focus();
            sel.moveStart('character', -l);
            var wee = sel.text.length;
            if (arguments.length == 2) {
                var l = $t.value.length;
                sel.moveEnd("character", wee + t); t <= 0 ? sel.moveStart("character", wee - 2 * t - myValue.length) : sel.moveStart("character", wee - t - myValue.length);
                sel.select();
            }
        }
        else if ($t.selectionStart || $t.selectionStart == '0') {
            var startPos = $t.selectionStart; var endPos = $t.selectionEnd; var scrollTop = $t.scrollTop; $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
            this.focus();
            $t.selectionStart = startPos + myValue.length;
            $t.selectionEnd = startPos + myValue.length;
            $t.scrollTop = scrollTop;
            if (arguments.length == 2) {
                $t.setSelectionRange(startPos - t, $t.selectionEnd + t);
                this.focus();
            }
        }
        else {
            this.value += myValue;
            this.focus();
        }
    }
    })
})(jQuery);

var MyContol = {
    //ctrl=undefine,    
    getPositionForInput: function() {
        var CaretPos = 0;
        if (document.selection) {
            // IE Support      
            this.ctrl.focus();
            var Sel = document.selection.createRange();
            Sel.moveStart('character', -this.ctrl.value.length);
            CaretPos = Sel.text.length;
        }
        else if (this.ctrl.selectionStart || this.ctrl.selectionStart == '0') {
            // Firefox support    
            CaretPos = this.ctrl.selectionStart;
        }
        return (CaretPos);
    }, setCursorPosition: function(pos) {
        if (this.ctrl.setSelectionRange) {
            this.ctrl.focus();
            this.ctrl.setSelectionRange(pos, pos);
        } else if (this.ctrl.createTextRange) {
            var range = this.ctrl.createTextRange();
            range.collapse(true);
            range.moveEnd('character', pos);
            range.moveStart('character', pos);
            range.select();
        }
    }
}
/*      
*数据框设置值
*/
function SetPlortValue(t) {
    var plort = document.getElementById("_PLotHarvest_No");
    MyContol.ctrl = plort; plort.focus();
    //退格            
    if (t == -1) {
        var star = MyContol.getPositionForInput();
        var plotVal = $("#_PLotHarvest_No").val();
        //获取当前光标的下标    
        if (star > 0) {
            $("#_PLotHarvest_No").val(plotVal.substring(0, star - 1) + plotVal.substring(star));
            MyContol.setCursorPosition(star - 1);
        }
        else {
            if (MyContol.getPositionForInput() > 0) {
                $("#_PLotHarvest_No").val(plotVal.substring(0, plotVal.length - 1));
            }
        }
    } else {
        $("#_PLotHarvest_No").insertContent(t);
    }
    return false;
}
function showDialog(url, width, height) {
    var x = parseInt(screen.width / 2.0) - (width / 2.0); var y = parseInt(screen.height / 2.0) - (height / 2.0);
    if (document.all) {
        retval = window.showModalDialog(url, window, "dialogWidth:" + width + "px; dialogHeight:" + height + "px; dialogLeft:" + x + "px; dialogTop:" + y + "px; status:no; directories:yes;scrollbars:no;Resizable=no; ");
    }
    else {
        var win = window.open(url, "mcePopup", "top=" + y + ",left=" + x + ",scrollbars=" + scrollbars + ",dialog=yes,modal=yes,width=" + width + ",height=" + height + ",resizable=no");
        eval('try { win.resizeTo(width, height); } catch(e) { }');
        win.focus();
    }
}
/*
*检查是否有值
*/
function checkForm() {
    var plotNO = searchForm._PLotHarvest_No.value;
    if (plotNO == "")
        alert("请输入或者扫描一个溯源码");
    else
        showDialog("http://nbw.j01.cc/Pages/QueryResult.aspx?_PLotHarvest_No=" + plotNO,1000,720);
    return false;
    // art.dialog.open("http://nbw.j01.cc/Pages/QueryResult.aspx?_PLotHarvest_No=" + plotNO, { title: "溯源查询结果", background: '#FFFFFF', opacity: 0.8, width: 1000, height: 720 }, false);

}
