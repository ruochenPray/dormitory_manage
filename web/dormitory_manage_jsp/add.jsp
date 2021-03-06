<%--
  Created by IntelliJ IDEA.
  User: 若尘
  Date: 2020/12/1
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="repid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<repid:override name="title">添加信息</repid:override>

<repid:override name="css">
    <style>
        .add {
            margin-top: 30px;
        }

        .add .title {
            font-size: 25px;
            font-weight: bold;
            text-align: center;
        }

        .error-msg {
            color: red;
            position: absolute;
            font-size: 13px;
        }
    </style>
</repid:override>

<repid:override name="js">
    <script>
        // 页面框架加载完后自动执行
        $(function () {
            bindClickSubmit();
        });

        function bindClickSubmit() {
            $('#btnSubmit').click(function () {
                $('.error-msg').empty();

                $.ajax({
                    url: "${pageContext.request.contextPath}/UserServlet?method=addUser",
                    type: "get",
                    data: $('#addForm').serialize(),
                    dataType: "JSON",
                    success: function (result) {
                        var res = eval(result);
                        if (res.status) {
                            window.location = "${pageContext.request.contextPath}/Manage?method=userList";
                        } else {
                            $.each(res.error, function (k, v) {
                                $('#' + k).text(v);
                            });
                        }
                    }, error: function () {
                        location.href = "${pageContext.request.contextPath}/dormitory_manage_jsp/add.jsp";
                    }
                })
            });
        }
    </script>
</repid:override>

<repid:override name="content">
    <form class="form-horizontal add" id="addForm" method="get">
        <input type="hidden" name="method" value="addUser">
        <div class="title" style="margin-bottom: 20px"> 添加信息</div>
        <div class="form-group">
            <label class="col-sm-2 control-label">床号</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" name="bed_number" placeholder="请输入床号">
                <span id="bedNumberError" class="error-msg"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">学号</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="user_id" placeholder="请输入学号">
                <span id="userIdError" class="error-msg"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="user_name" placeholder="请输入姓名">
                <span id="userNameError" class="error-msg"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-8">
                    <%--                <input type="text" class="form-control" name="user_sex" placeholder="请输入性别">--%>
                <select class="form-control" name="user_sex">
                    <option>男</option>
                    <option>女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" name="user_age" placeholder="请输入年龄">
                <span id="userAgeError" class="error-msg"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" name="telephone" placeholder="请输入联系方式">
                <span id="phoneError" class="error-msg"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">地址</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="address" placeholder="请输入地址">
                <span id="addressError" class="error-msg"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button id="btnSubmit" type="button" class="btn btn-primary">添加</button>
            </div>
        </div>
    </form>
</repid:override>

<%@include file="layout/manage.jsp" %>
