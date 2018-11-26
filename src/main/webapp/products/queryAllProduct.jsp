<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/icon.css">
    <script type="text/javascript">
        $(function () {
            // 数据展示框
            $("#prodatagrid").datagrid({
                url: "/ddm/product/getAll",
                //queryParams:{"categoryId":${param.categoryId}},
                //resizable:true,
                pagination: true, // 在DataGrid控件底部显示分页工具栏
                columns: [[
                    {checkbox: true, field: ""}, // 复选框

                    {title: "书名", field: "book_name", width: 100, align: "center"},
                    {
                        title: '图书封面', field: 'product_image', width: 100, align: 'center',
                        formatter: function (value, row, index) {
                            //如下的写法太复杂了,注意只有数字才这么写.
                            //console.log(value);
                            //console.log(row);
                            //console.log(index);
                            return "<img src='${pageContext.request.contextPath}/productImages/" + value + "' width='50px' height='70px'>";
                        }
                    },

                    {title: "原价", field: "book_price", width: 100, align: "center"},
                    {title: "当当价", field: "dangprice", width: 100, align: "center"},
                    {title: "库存", field: "inventory", width: 100, align: "center"},
                    {title: "作者", field: "author", width: 100, align: "center"},
                    {title: "出版社", field: "press", width: 100, align: "center"},
                    {title: "销量", field: "salenum", width: 100, align: "center"},
                    {title: "上架时间", field: "groundingDate", width: 200, align: "center"},
                    {title: "内容", field: "messages", width: 250, align: "center"},

                ]],
                //title:"数据展示",
                width: 800,
                pageSize: 6,
                pageList: [6, 10, 20, 30],
                toolbar: "#myToolbar",
                fit: true
                //iconCls:"icon-search"
                // 双击一行触发选中(双击一行打开修改框)
                /* onDblClickRow:function(rowIndex,rowData){
                     console.log(rowData);
                     //alert(rowData);
                     $("#update_user_id").val(rowData.user_id);
                     $("#update_user_name").val(rowData.user_name);
                     $("#update_user_password").val(rowData.user_password);
                     $("#update_user_card_no").val(rowData.user_card_no);
                     $("#update_user_tel").val(rowData.user_tel);
                     $("#update_user_address").val(rowData.user_address);
                     $("#update_user_post_number").val(rowData.user_post_number);
                     $("#update_user_question").val(rowData.user_question);
                     $("#update_user_answer").val(rowData.user_answer);
                     $("#update_dialog").dialog("open");
                 }*/
                // 双击一行触发选中(双击一行打开修改框)==END

            });
        });
        // 数据展示对话框======END

        //=============添加数据==================================
        $(function () {
            // 添加对话框
            $("#addProdia").dialog({
                title: "添加对话框",
                width: 580,
                height: 450,
                resizable: true,
                closed: true,
                maximizable: true,
                modal: true,
                //closable:true
            });
            // 添加对话框=========END
        });

        // 打开添加对话框
        function toOpenAddDialog() {
            //alert(0);
            $.ajax({
                url: "/ddm/category/getAllCategory",
                type: "post",
                //data:{"auctionId":auctionId},
                dataType: "json",
                async: false,
                success: function (data) {
                    console.log(data.categorys);
                    //alert(data.categorys[1].category_id);
                    var option = "<option value = '' >" + "--选择图书类别--" + "</option>";
                    for (var i = 0; i < data.categorys.length; i++) {
                        option = option + "<option value = '" + data.categorys[i].category_id + "'>" + data.categorys[i].category_name + "</option>"
                    }
                    $("#prosele1").html(option);
                }
            });
            $("#addProdia").dialog("open");
        }

        // 打开添加对话框=====END

        function pro1() {
            alert(0);
            // 添加表单提交
            $("#prof1").form("submit", {
                // 通过form控件的submit方法提交数据
                url: "/ddm/product/addProduct",
                success: function (data) {
                    //alert(0);
                    // 回调函数，后台响应结果data是json串
                    console.log(data);
                    /* // 回调函数从后台响应回来的结果是一个json串
                    if(data){
                        alert("添加成功！");
                    }else{
                        alert("添加失败！");
                    } */
                    data = JSON.parse(data);
                    if (data) {
                        // 添加成功后关闭添加对话框并重新加载数据
                        $("#addProdia").dialog("close");
                        $("#prodatagrid").datagrid("load");
                    } else {
                        $.messager.alert("提示消息", "添加失败！", "info");
                    }
                }
            });
            // 添加表单提交========END

            // 取消
            function quxiao() {
                alert(0);
                $("#addProdia").dialog("close");
            }

            // 取消====END
        }

        // ================添加数据=======END=================

        // ================修改================================
        $(function () {
            // 修改对话框
            $("#updateProdia").dialog({
                title: "修改对话框",
                width: 580,
                height: 480,
                //resizable:true,
                closed: true,
                maximizable: true,
                modal: true,
                //closable:true //定义是否显示关闭按钮
            });
            // 修改对话框=========END
        });

        // 打开修改对话框(通过工具栏中的修改按钮打开修改对话框)
        function toOpenUpdateDialog() {
            //alert(0);
            var selectRow = $("#prodatagrid").datagrid("getSelections");
            //alert(selectRow);
            console.log(selectRow);
            if (selectRow.length == 1) {

                $.ajax({
                    url: "/ddm/category/getAllCategory",
                    type: "post",
                    //data:{"auctionId":auctionId},
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        //console.log(data.categorys);
                        //alert(data.categorys[1].category_id);
                        var option = "<option value='" + selectRow[0].cid + "'>" + selectRow[0].category.category_name + "</option>";
                        for (var i = 0; i < data.categorys.length; i++) {
                            if (data.categorys[i].category_id == selectRow[0].cid) {
                                continue;
                            }
                            option = option + "<option value = '" + data.categorys[i].category_id + "'>" + data.categorys[i].category_name + "</option>"
                        }
                        $("#prosele").html(option);
                    }
                });

                //alert(selectRow.user_name);
                $("#proId").val(selectRow[0].book_id);
                $("#proName").val(selectRow[0].book_name);
                $("#proPrice").val(selectRow[0].book_price);
                $("#dangPrice").val(selectRow[0].dangprice);
                $("#inventory").val(selectRow[0].inventory);
                $("#author").val(selectRow[0].author);
                $("#press").val(selectRow[0].press);
                $("#salenum").val(selectRow[0].salenum);
                $("#custome_core").val(selectRow[0].custome_score);
                $("#recommend").val(selectRow[0].recommend);
                $("#messages").val(selectRow[0].messages);
                $("#image").html("<img src='${pageContext.request.contextPath}/productImages/" + selectRow[0].product_image + "' width='50px' height='70px'>");
                $("#updateProdia").dialog("open");

                // 文件上传(文件域)的改变事件
                $(':file').change(function (event) {
                    //  HTML5 js 对象的获取
                    var files = event.target.files, file;
                    if (files && files.length > 0) {
                        // 获取目前上传的文件
                        file = files[0];
                        // 文件的限定类型什么的道理是一样的
                        if (file.size > 1024 * 1024 * 2) {
                            alert('图片大小不能超过 2MB!');
                            return false;
                        }
                        // file对象生成可用的图片
                        var URL = window.URL || window.webkitURL;
                        // 通过 file 生成目标 url
                        var imgURL = URL.createObjectURL(file);
                        // 用这个 URL 产生一个 <img> 将其显示出来
                        //$("img").prop('src', imgURL);
                        $("#image").html("<img src='" + imgURL + "'width='50px' height='70px'>");
                    }
                });


            } else {
                if (selectRow.length == 0) {
                    $.messager.alert("提示消息", "请选择修改数据！", "info");
                } else {
                    $.messager.alert("提示消息", "请选择一行修改数据！", "info");
                }
            }
        }

        // 打开修改对话框(通过工具栏中的修改按钮打开修改对话框)=====END

        // 修改提交表单
        function pro() {
            //alert(0);
            $("#prof2").form("submit", {
                url: "/ddm/product/updateProduct",
                success: function (data) {
                    console.log(data);
                    data = JSON.parse(data);
                    if (data) {
                        $("#updateProdia").dialog("close");
                        $("#prodatagrid").datagrid("reload");
                    } else {
                        $.messager.alert("提示消息", "修改失败！", "info");
                    }
                }
            });
        }
        // 修改提交表单=======END
        // ================修改==========END====================

        // ================删除================================
        // 批量删除
        function toOpenMultiRemove() {
            //alert(0);
            // 获取要删除的数据的id
            var deleteIds = $("#prodatagrid").datagrid("getSelections");
            console.log(deleteIds);
            if (deleteIds.length == 0) {
                $.messager.alert("提示信息", "请选择删除数据！", "info");
            } else {
                // 确认是否删除
                var isConfirm = confirm("确认要删除选中的内容吗？");
                if (isConfirm) {
                    // 获取选中数据的id值
                    var ids = new Array(deleteIds.length);
                    for (var i = 0; i < deleteIds.length; i++) {
                        ids[i] = deleteIds[i].book_id;
                    }
                    alert(ids);
                    $.ajax({
                        url: "/ddm/product/deleteMultiProduct",
                        type: "post",
                        data: "ids=" + ids,
                        dataType: "json",
                        success: function (data) {
                            console.log(data);
                            //alert(data);
                            if (data) {
                                $.messager.alert("提示信息", "删除成功！", "info");
                                $("#prodatagrid").datagrid("reload");
                            } else {
                                $.messager.alert("提示信息", "删除失败！", "info");
                            }
                        }
                    });
                }
            }
        }

        // 批量删除================END
        // ================删除==========END====================
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body>
<!-- 工具栏div -->
<div id="myToolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
       onclick="toOpenAddDialog()">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
       onclick="toOpenUpdateDialog()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
       onclick="toOpenMultiRemove()">批量删除</a>
</div>
<!-- 工具栏div===END -->

<%--数据展示--%>
<table id="prodatagrid"></table>
<%--数据展示=====END--%>

<%--添加数据--%>
<div id="addProdia" class="easyui-dialog" data-options="closed:true">
    <form id="prof1" style="margin:30px" enctype="multipart/form-data" method="post">
        <table>
            <tr>
                <td>
                    图书名字：<input class="easyui-validatebox" name="book_name"
                                data-options="required:true,missingMessage:'请填写商品名字'"/><br/><br/>
                    图书封面：<input class="easyui-filebox" name="uploadFile"
                                data-options="required:true,missingMessage:'请选择封面'"/><br/><br/>
                </td>
                <td>
                    图书原价：<input class="easyui-validatebox" name="book_price" type="number" step="0.1"
                                data-options="required:true,missingMessage:'请输入价格'"/> <br/><br/>
                    当当价格：<input class="easyui-validatebox" name="dangprice" type="number" step="0.1"
                                data-options="required:true,missingMessage:'请输入价格'"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>
                    库存：&nbsp;&nbsp;<input class="easyui-validatebox" name="inventory"
                                          data-options="required:true,missingMessage:'请输入库存'"/><br/><br/>
                    作者：&nbsp;&nbsp;<input class="easyui-validatebox" name="author"
                                          data-options="required:true,missingManage:'请输入作者名称'"/><br/><br/>
                </td>
                <td>
                    出版社：&nbsp;<input class="easyui-validatebox" name="press"
                                     data-options="required:true,missingManage:'请输入出版社名称'"/><br/>
                    &nbsp;销量：&nbsp;&nbsp;<input class="easyui-validatebox" type="number" name="salenum"
                                                data-options="required:true,missManage:'请输入销量记录'"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>
                    顾客评分：<input class="easyui-validatebox" name="custome_score"
                                data-options="required:true,missingManage:'请输入顾客评分'"/><br/><br/>
                    编辑推荐：<input class="easyui-validatebox" name="recommend"
                                data-options="required:true,missManager:'请输入编辑推荐'"><br/><br/>
                </td>
                <td>
                    类别所属：<select id="prosele1" name="cid"></select><br/><br/>
                    简介内容：<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="5" cols="22"
                                                                      name="messages"></textarea><br/><br/>
                </td>
            </tr>
        </table>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro1()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="exit();">取消</a>
        </center>
    </form>
</div>
<%--添加数据=======END--%>

<%--修改数据--%>
<div id="updateProdia" class="easyui-dialog" data-options="closed:true">
    <form id="prof2" style="margin:30px" enctype="multipart/form-data" method="post">
        <table>
            <tr>
                <td>
                    <input id="proId" name="book_id" type="hidden"/>
                    图书名字：<input class="easyui-validatebox" id="proName" name="book_name"
                                data-options="required:true,missingMessage:'请填写商品名字'"/><br/><br/>
                    图书封面：<input class="easyui-filebox" name="uploadFile" id="update_filebox"
                                data-options="required:true,missingMessage:'请选择封面'"/><br/><br/>
                </td>
                <td>
                    图书原价：<input class="easyui-validatebox" id="proPrice" name="book_price" type="number" step="0.1"
                                data-options="required:true,missingMessage:'请输入价格'"/> <br/><br/>
                    当当价格：<input class="easyui-validatebox" id="dangPrice" name="dangprice" type="number" step="0.1"
                                data-options="required:true,missingMessage:'请输入价格'"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td colspan="2"><p id="image"></p></td>
            </tr>
            <tr>
                <td>
                    库存：&nbsp;&nbsp;<input class="easyui-validatebox" id="inventory" name="inventory"
                                          data-options="required:true,missingMessage:'请输入库存'"/><br/><br/>
                    作者：&nbsp;&nbsp;<input class="easyui-validatebox" id="author" name="author"
                                          data-options="required:true,missingManage:'请输入作者名称'"/><br/><br/>
                </td>
                <td>
                    出版社：&nbsp;<input class="easyui-validatebox" id="press" name="press"
                                     data-options="required:true,missingManage:'请输入出版社名称'"/><br/>
                    销量：&nbsp;&nbsp;<input class="easyui-validatebox" id="salenum" type="number" name="salenum"
                                          data-options="required:true,missManage:'请输入销量记录'"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>
                    顾客评分：<input class="easyui-validatebox" id="custome_core" name="custome_score"
                                data-options="required:true,missingManage:'请输入顾客评分'"/><br/><br/>
                    编辑推荐：<input class="easyui-validatebox" id="recommend" name="recommend"
                                data-options="required:true,missManager:'请输入编辑推荐'"><br/><br/>
                </td>
                <td>
                    类别所属：<select id="prosele" name="cid"></select><br/><br/>
                    简介内容：<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="5" cols="22" name="messages"
                                                                      id="messages"></textarea><br/><br/>
                </td>
            </tr>
        </table>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro();">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onClick="exit();">取消</a>
        </center>
    </form>
</div>
<%--修改数据=========END--%>

<script type="text/javascript">

</script>
</body>
</html>