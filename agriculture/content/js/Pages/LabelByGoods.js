var grid=null,chart=null;
$(document).ready(function () { 
    $("#layout1").ligerLayout({ 
        leftWidth: 150, rightWidth: 250, 
        space: 4, isRightCollapse: true, 
        allowLeftCollapse: true, allowTopResize: false, 
        topHeight: 40 }); 
    var url='/areas/getAreasTree/'+AreaID.toString()+'/3';         
    MyLoading(true,".l-layout-left");
    getAjax(url,null,function(data){
        MyLoading(false);
        $("#tree1").ligerTree({ 
            nodeWidth: 200,
            data : data,
            checkbox: false,
            idFieldName: 'Area_ID', 
            textFieldName:'Area_Name',
            isExpand: false, 
            slide: false,
            onSelect: function (node, e) {
                AreaID = node.data["Area_ID"];
                $("#hd_CoFarmerId").val('');
                $("#div_CoFarmers").html('');
                Query();
            }
        });
    });
            
    grid =  $("#maingrid4").createLigerGrid({
        header: [
            { display: '时间', name: 'Goods_Name' },
            { display: '数量', name: 'LabelNum' }
        ],
        leftBtns:{show:false},
        ID: "maingrid4",
        ajaxURL: "/Chart/getLabelChartByGoods",
        param: { 'AreaID': AreaID, 'CoFarmerIDs': $("#hd_CoFarmerId").val(), 'GoodsID': $("#hd_GoodsId").val(), "StartDate": $("#txt_StartDate").val(), "EndDate": $("#txt_Month").val() },
        onLoaded: function () {
            DrawChart(type);
        }
    });                        
});
var LabelCount=0;   
function DrawChart(type) {
    try {
        if (grid.data.data.length > 0) {
            var Ydatas = [], 
                xlabels = [], 
                jdatas = grid.data.data                    
            ;
            LabelCount=0;
            for (var p in jdatas) {
                if (jdatas[p] && jdatas[p] != undefined) {
                    Ydatas.push({ name: jdatas[p]["Goods_Name"], y: Number(jdatas[p]["LabelNum"]) });
                    LabelCount+=Number(jdatas[p]["LabelNum"]) 
                    xlabels.push(jdatas[p]["Goods_Name"]);
                }
            }                       
        }
        chart=$('#container').highcharts({
            chart: {
                type: type
            },
            title: {
                text: '标签数量统计'
            },
            subtitle:{
                text:"符合条件的总计打印了："+LabelCount+"张标签"
            },
            xAxis: {
                lineWidth: 3,
                categories: xlabels,
                labels: {
                    rotation: -45,
                    align: 'right',
                    style: {
                        font: 'normal 13px Verdana, sans-serif'
                    }
                }
            },
            yAxis: [{
                allowDecimals: false,
                lineWidth:2,
                lineColor:"#5E8BC0",
                title: {
                    text: '标签数量(张)'
                }
            }],
            tooltip: {
                formatter: function () {
                    return '<b>' +this.key+'</b><br/>' +
                     this.series.name + ':' +this.y+'张';
                }
            },
            series: [{
                name: '标签数量',
                step: 'right',
                yAxis: 0,
                color: '#4572A7',
                data: Ydatas
            }]
        });
    } catch (ex) {
        console.log(ex.message);
    }
}    
var type='column'
function ChartChange(t){
    type=t;
    DrawChart(type);
}
function Query() {
    grid.setParm('AreaID',AreaID);
    grid.setParm("CoFarmerIDs", $("#hd_CoFarmerId").val());
    grid.setParm("GoodsID", $("#hd_GoodsId").val());
    grid.setParm("StartDate", $("#txt_StartDate").val());
    grid.setParm("EndDate", $("#txt_EndDate").val());
    grid.reload();
}
function openParam()
{
    artDialog({ content: $("#div_Param").html(), width: 400, height: 200,title:'设置报表参数' });
}
function GetCoFarmer()
{
    multiCheckHelper('/Pages/Helper/CoFarmer_Helper.aspx?__CheckBox=true', { id: 'txt_CoFarmerName,hd_CoFarmerId', key: 'CoFarmer_Name,CoFarmer_ID' }, '生产者--选择帮助界面', 450, 450,true,
        function(){
            var html='';
            var value=$("#txt_CoFarmerName").val();
            var vals=value.split(',');
            for (var i = 0; i < vals.length; i++) {                        
                html+='<div id="div_CoF'+i+'" onmouseover="javascript:$(\'#deleteCoF'+i+'\').show();" onmouseout="javascript:$(\'#deleteCoF'+i+'\').hide();">';
                html+='<span class="liger-button l-button" style="width:100px;float:left;margin-left:3px;margin-top:3px;"  >'+vals[i]+'</span><span class="liger-button l-button" style="width:8px;float:left;margin-left:0px;margin-top:3px;display:none;" onclick="DelCoF(\'div_CoF'+i+'\','+i+')" id="deleteCoF'+i+'">x</span>';
                html+="</div>";
            }
            $("#div_CoFarmers").html(html);
        });           
}
function DelCoF(obj,index){
    $("#"+obj).hide();
    var value=$("#hd_CoFarmerId").val();
    var vals=value.split(',');
    vals.splice(index,1);
    $("#hd_CoFarmerId").val(vals.toString());
}
function GetGoods()
{
    multiCheckHelper('/Pages/Helper/Goods_Helper.aspx?__CheckBox=true', { id: 'txt_GoodsName,hd_GoodsId', key: 'Goods_Name,Goods_ID' }, '农作物--选择帮助界面', 450, 450,true,
        function(){
            var html='';
            var value=$("#txt_GoodsName").val();
            var vals=value.split(',');
            for (var i = 0; i < vals.length; i++) {                        
                html+='<div id="div_Good'+i+'" onmouseover="javascript:$(\'#deleteGood'+i+'\').show();" onmouseout="javascript:$(\'#deleteGood'+i+'\').hide();">';
                html+='<span class="liger-button l-button" style="width:100px;float:left;margin-left:3px;margin-top:3px;" >'+vals[i]+'</span><span class="liger-button l-button" style="width:8px;float:left;margin-left:0px;margin-top:3px;display:none;" onclick="DelGood(\'div_Good'+i+'\','+i+')" id="deleteGood'+i+'">x</span>';
                html+="</div>";
            }
            $("#div_Goods").html(html);
        });
}
function DelGood(obj,index){
    $("#"+obj).hide();
    var value=$("#hd_GoodsId").val();
    var vals=value.split(',');
    vals.splice(index,1);
    $("#hd_GoodsId").val(vals.toString());
}