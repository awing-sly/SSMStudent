<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

    <title>学生管理页面 - 编辑页面</title>

    <script>
        $(function () {
            $("#addEditForm").submit(function () {
                if (!checkEmpty("student_id", "学号"))
                    return false;
                if (!checkEmpty("name", "姓名"))
                    return false;
                if (!checkEmpty("age", "年龄"))
                    return false;
                return true;
            });
            <%-- handle click cancel --%>
            $("#cancelBtn").click(function () {
                window.location.href = "${ctx}/listStudent";
            });
        });
        function checkEmpty(id, name) {
            var value = $("#" + id).val();
            if (value.length == 0) {
                alert(name + "不能为空");
                $("#" + id).focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>

<div class="editDIV">

    <div class="panel panel-info">
        <div class="panel-heading">
            <c:choose>
                <c:when test="${reqAddStudent == 1}">
                    <h3 class="panel-title">新增学生</h3>
                </c:when>
                <c:otherwise>
                    <h3 class="panel-title">编辑学生</h3>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="panel-body">

            <c:choose>
                <c:when test="${reqAddStudent == 1}">
                    <form method="post" id="editForm" action="${ctx}/addStudent" role="form">
                </c:when>
                <c:otherwise>
                    <form method="post" id="editForm" action="${ctx}/updateStudent" role="form">
                </c:otherwise>
            </c:choose>

                <table class="editTable">
                    <tr>
                        <td>学号：</td>
                        <td><input type="text" name="student_id" id="student_id" value="${student.student_id}"
                                   placeholder="请在这里输入学号"></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" id="name" value="${student.name}" placeholder="请在这里输入名字">
                        </td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input type="text" name="age" id="age" value="${student.age}" placeholder="请在这里输入年龄"></td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td><input type="radio" <c:if test="${student.sex == '男' || reqAddStudent == 1}">checked</c:if> class="radio radio-inline" name="sex" value="男"> 男
                            <input type="radio" <c:if test="${student.sex == '女'}">checked</c:if> class="radio radio-inline" name="sex" value="女"> 女
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期：</td>
                        <td><input type="date" name="birthday" id="birthday" value="${student.birthday}"
                                   placeholder="请在这里输入出生日期"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${student.id}">
                            <button type="submit" class="btn btn-success">提 交</button>

                            <button id="cancelBtn" type="button" class="editCancelBtn btn btn-info">取 消</button>
                        </td>

                        </td>

                    </tr>

                </table>
            </form>
        </div>
    </div>

</div>

</body>
</html>
