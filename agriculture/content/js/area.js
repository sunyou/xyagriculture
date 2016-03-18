/**
 * 区域下拉框
 * 
 * 注：以下为下拉框的selectType(下拉框类型)
 * 
 * 省 PROVINCE
 * 市 CITY
 * 县 COUNTY
 * 乡 TOWN
 * 村 VILLAGE
 * 
 * @author hejm
 * @since 2015-3-4
 * 
 */
//-------------------------------地址对象 (开始)----------------------------------------------//
var ADD = {
		initFlag:true,
		/**
		 * selectId : 当前下拉框
		 * nextSelectId ：下一个下拉框
		 * currentSelectType:下拉框类型 省 province
		 *  例如： 省 selectId = "province"
		 *       市 nextSelectId = "city"
		 */
		init:function(selectId,nextSelectId,currentSelectType,nextSelectType,fillData){  
			var areaId= $("#areaId").val();
			if(areaId>0) {
				$.ajax({
					url:GLOBAL.WEBROOT +'/sysmanage/getAreaInitValueByAreaId',
					type:'post',
					async: false,   //设置为同步
					dataType:'json',
					data:{"areaId":areaId},
					success:function(rdata){
						
						var data = rdata.data;
						if(data!=null){
							 if(data!=null){
								  for(var i= 0;i<data.length;i++) { 
									  if(data[i].treelevel=="1"){
										  fillData.provinceValue=data[i].areaId;
									  }
									  if(data[i].treelevel=="2"){
										  fillData.cityValue=data[i].areaId;
									  }
									  if(data[i].treelevel=="3"){
										  fillData.countyValue=data[i].areaId;
									  }
									  if(data[i].treelevel=="4"){
										  fillData.townValue=data[i].areaId;
									  }
								  } 
							  }
								
						}
						
						
						ADD.fillSelect("",currentSelectType,selectId,fillData);
					}
				});
			} else {
				ADD.fillSelect("",currentSelectType,selectId,fillData);
			}
			
			//ADD.change(selectId,nextSelectId,nextSelectType);
		},
		/**
		 * currentSelectValue:下拉框选中的值
		 * type: city 市， county 县， town 乡
		 * targetId:目标控件的id，如：city，town，county
		 */
		fillSelect:function(currentSelectValue,selectType,targetId,fillData){                                //填充下拉框
			$.ajax({
				  url:GLOBAL.WEBROOT +'/sysmanage/getAreaSelect',
				  type:'post',
				  async: false,   //设置为同步
				  dataType:'json',
				  data:{"currentSelectValue":currentSelectValue,"selectType":selectType},
				  success:function(rdata){
					  var data = rdata.data;
					  if(data!=null){
						  ADD.clear(targetId);
						  for(var i= 0;i<data.length;i++)
						  { 
						    $("#"+targetId+"").append("<option value=\""+data[i].areaId+"\">"+data[i].areaName+"</option>");
						  } 
						  //-----------回填 （开始）----------------//
						  if(data.length>0 && ADD.initFlag == true){
							  if(data[0].treelevel=="1" && fillData.provinceValue!=""){
								  $("select#"+fillData.provinceId+" option[value^='"+fillData.provinceValue+"']").attr("selected",true);
								  ADD.change(fillData.provinceId,fillData.cityId,fillData.cityType,fillData);
							  }
							  if(data[0].treelevel=="2" && fillData.cityValue!=""){
								  $("select#"+fillData.cityId+" option[value^='"+fillData.cityValue+"']").attr("selected",true);
								  ADD.change(fillData.cityId,fillData.countyId,fillData.countyType,fillData);
							  }
							  if(data[0].treelevel=="3" && fillData.countyValue!=""){
								  $("select#"+fillData.countyId+" option[value^='"+fillData.countyValue+"']").attr("selected",true);
								  ADD.change(fillData.countyId,fillData.townId,fillData.townType,fillData);
							  }
							  if(data[0].treelevel=="4" && fillData.townValue!=""){
								  $("select#"+fillData.townId+" option[value^='"+fillData.townValue+"']").attr("selected",true);
								  ADD.change(fillData.townId,fillData.villageId,fillData.villageType,fillData);
							  }
							  if(data[0].treelevel=="5" && fillData.villageValue!=""){
								  $("select#"+fillData.villageId+" option[value^='"+fillData.villageValue+"']").attr("selected",true);
							  }
						    }
						   //-----------回填 （结束）----------------//
						  
					  }
				  }
				});
		},       
		/**
		 * selectId : 当前下拉框
		 * nextSelectId ：下一个下拉框
		 * nextSelectType:下拉框类型 省 province
		 *  例如： 省 selectId = "province"
		 *       市 nextSelectId = "city"
		 */
		change:function(selectId,nextSelectId,nextSelectType,fillData){                                       //改变事件     
			var currentSelectValue = $("#"+selectId+"").val();
			if(currentSelectValue>0) {
				$("#areaId").val(currentSelectValue);
			}
			ADD.fillSelect(currentSelectValue,nextSelectType,nextSelectId,fillData);
		}, 
		/**
		 * id : 需要清除的下拉框的id
		 */
		clear:function(id){                                                          //清除下拉框
			var select = $("#"+id+""); 
			$("#"+id+"").empty();//清空下拉框
			$("#"+id+"").append("<option value=''>--请选择--</option>");	
		}
}
//-------------------------------地址对象 (结束)----------------------------------------------//



$(function(){
//-------------------------户口地址（开始）----------------------//
	var fillData2 = {
		provinceId:"province",
		provinceValue:$("#provinceValue").val(),
		provinceType:"PROVINCE",
		cityId:"city",
		cityValue:$("#cityValue").val(),
		cityType:"CITY",
		countyId:"county",
		countyValue:$("#countyValue").val(),
		countyType:"COUNTY",
		townId:"town",
		townValue:$("#townValue").val(),
		townType:"TOWN",
		villageId:"village",
		villageValue:$("#villageValue").val(),
		villageType:"VILLAGE"
	}
	//初始化地域
	if($("#"+fillData2.provinceId+"").length==1){
	  ADD.init(fillData2.provinceId,fillData2.cityId,fillData2.provinceType,fillData2.cityType,fillData2);
	}
	  //省改变
	$("#"+fillData2.provinceId+"").change(function(){
		ADD.initFlag = false;
		ADD.change(fillData2.provinceId,fillData2.cityId,fillData2.cityType);
		ADD.clear(fillData2.countyId);
		ADD.clear(fillData2.townId);
		ADD.clear(fillData2.villageId);
	});
	//市改变
	$("#"+fillData2.cityId+"").change(function(){
		ADD.initFlag = false;
		ADD.change(fillData2.cityId,fillData2.countyId,fillData2.countyType);
		ADD.clear(fillData2.townId);
		ADD.clear(fillData2.villageId);
	});
	//县改变
	$("#"+fillData2.countyId+"").change(function(){
		ADD.initFlag = false;
		ADD.change(fillData2.countyId,fillData2.townId,fillData2.townType);
		ADD.clear(fillData2.villageId);
	});
	//镇改变
	$("#"+fillData2.townId+"").change(function(){
		ADD.initFlag = false;
		ADD.change(fillData2.townId,fillData2.villageId,fillData2.villageType);
	});
	
//---------------------户口地址（结束）-----------------------------//
	


});
