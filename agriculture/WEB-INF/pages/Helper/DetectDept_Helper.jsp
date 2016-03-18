<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检测部门--选择帮助界面</title>
    <%@ include file="/common/include.jsp"%>
    
    <script type="text/javascript">
        var grid = null;
        $(document).ready(function () {
            grid=$("#grid").createLigerGrid({
                header: [
					{display:'选择',render:function(record, rowindex, value, column){return "<input type='radio' name='radiobtns' value='' />";}},
                    { display: '编号', name: 'Dept_No' },
                    { display: '检测部门', name: 'Dept_Name' }

                ],
                leftBtns: { show: false },
				onSelectRow:function(rowdata, rowid, rowobj){
					$(rowobj).find("input[type='radio']").attr("checked","checked");
				
				},
                param: { 'flag': 1 },
                keyID: "DEPT_ID",
                ajaxURL: "../detectdept/getDetectDeptList.ajax"
            });

            $("#btn_Search").click(function () {
                grid.setParm("deptName", $("#Dept_Name").val());
                grid.reload();
            })

        });
    </script>
</head>
<body>
     <table>
            <tr>
                <td>检测部门：
                </td>
                <td>
                    <input type="text" name="Dept_Name" id="Dept_Name" value="" class="serchInput" />
                </td>
                <td>
                    <input type="button" id="btn_Search" value="查询" class="btn_tool_search" />
                </td>
            </tr>
        </table>
    <div id="grid"></div>
</body>
</html>
