function showtime(id)
{
    today=new Date(); 
    var year=today.getYear();
    var month=today.getMonth()+1;
    var day=today.getDate();
    var hours = today.getHours(); 
    var minutes = today.getMinutes(); 
    var seconds = today.getSeconds(); 
    var timeValue= hours;//((hours >12) ? hours -12 :hours);
    timeValue += ((minutes < 10) ? ":0" : ":") + minutes+""; 
    //timeValue += (hours >= 12) ? "PM" : "AM"; 
    timeValue+=((seconds < 10) ? ":0" : ":") + seconds+"";
    var timetext=year+"-"+month+"-"+day+" "+timeValue
    //document.write("<span  onclick=\"document.getElementById('time').value='"+timetext+"'\">"+timetext+"</span>"); 
    document.getElementById(id).innerText = timetext; //div的html是now这个字符串 
    setTimeout("showtime('"+id+"')",1000); //设置过1000毫秒就是1秒，调用showtime方法 
}