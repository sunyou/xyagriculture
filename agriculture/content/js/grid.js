$(document).ready(function() {
    $(".data_grid tr").first().find("th").css({ 'background': '#3da81e' });
    $(".data_grid tr").not($(".data_grid tr").first()).hover(function() {
        $(this).css({ 'background': '#B3E457' });
    }, function() {
        $(this).css({ 'background': '#FFFFFF' });
    });
});