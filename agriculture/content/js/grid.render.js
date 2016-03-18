
/** 采收批次详情 **/
function renderPlotharvest(rowdata,index,value){
     var url=_basePath+"/PlotHarvest/PlotHarvestDet.html?plotharvestNo="+rowdata["PLOTHARVEST_NO"];
     var title="采收批次详情";
     var name = value;
     var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
     html = html.replace('#url', url);
     html = html.replace('#title', title);
     html = html.replace('#name',name);
     
     return html;
} 
/** 种植批次详情 **/
function renderPlantLot(rowdata,index,value){
     var url=_basePath+"/Plant/Vegetables/PlantLotDet.html?id="+rowdata["PLANTLOT_ID"];
     var title="种植批次详情";
     var name = value;
     var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
     html = html.replace('#url', url);
     html = html.replace('#title', title);
     html = html.replace('#name',name);
     
     return html;
} 
/** 包装详情 **/
function renderPackage(rowdata,index,value){
	 if(!value) return '';
     var url=_basePath+"/Package/toPackageEdit.html?type=3&id="+rowdata["PACKAGE_UID"];
     var title="包装详情";
     var name = value;
     var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
     html = html.replace('#url', url);
     html = html.replace('#title', title);
     html = html.replace('#name',name);
     
     return html;
} 
/** 生产商详情 **/
function renderCoFarmer(rowdata,index,value){
	 if(!value) return '';
     var url=_basePath+"/Base/Info/CoFarmerBaseInfo.html?type=3&id="+rowdata["COFARMER_ID"];
     var title="生产商详情";
     var name = value;
     var tabId = rowdata["COFARMER_ID"];
     var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByParentTab(\'#url\',\'#title\',\'#tabId\')">#name</a>';
     html = html.replace('#url', url);
     html = html.replace('#title', title);
     html = html.replace('#tabId',tabId);
     html = html.replace('#name',name);
     
     return html;
} 
/** 农产品召回详情 **/
function renderRecall(rowdata,index,value){
	 var url=_basePath+"/Warning/recall_detail.html?id="+rowdata["RECALL_ID"];
    var title="农产品召回详情";
    var name = value;
    var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
    html = html.replace('#url', url);
    html = html.replace('#title', title);
    html = html.replace('#name',name);
    
    return html;
} 
/** 农产品预警详情 **/
function renderSalert(rowdata,index,value){
	 var url=_basePath+"/Warning/salert_detail.html?id="+rowdata["ALERT_ID"];
    var title="农产品预警详情";
    var name = value;
    var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
    html = html.replace('#url', url);
    html = html.replace('#title', title);
    html = html.replace('#name',name);
    
    return html;
} 
/** 农产品检测详情 **/
function renderDetection(rowdata,index,value){
    var url=_basePath+"/Detection/detection_detail.html?id="+rowdata["DETECTION_UID"];
    var title="农产品检测详情";
    var name = value;
    var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
    html = html.replace('#url', url);
    html = html.replace('#title', title);
    html = html.replace('#name',name);
    
    return html;
} 
/** 经销商详情 **/
function renderSupplier(rowdata,index,value){
	var url=_basePath+"/Audit/audit_supplier_detail.html?id="+rowdata["APPLY_ID"];
	var title="经销商详情";
	var name = value;
	var html = '<a href="javascript:;" class="ligerBtnDetail" onclick="showDetailByDialog(\'#url\',\'#title\')">#name</a>';
	html = html.replace('#url', url);
	html = html.replace('#title', title);
	html = html.replace('#name',name);
	
	return html;
} 
