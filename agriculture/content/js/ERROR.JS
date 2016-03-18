var second = 5;
setInterval("redirect()", 1000);
function redirect() {
    if (second < 0) {
        location.href = '/default.aspx';
    } else {
        $("#totalSecond").html(second--);
    }
}
