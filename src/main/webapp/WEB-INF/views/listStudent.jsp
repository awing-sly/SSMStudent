<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

    <title>学生管理系统</title>

    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });

        });

        function del() {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }
        }

    </script>
</head>

<body>
<div class="container">
    <h2 class="text-center">学生管理系统</h2>

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">操作</h3>
        </div>
        <div class="panel-body">
            <div class="container">
                <a href="${ctx}/reqAddStudent"><span class="glyphicon-plus">添加</span></a>
            </div>
        </div>
    </div>

    <table class="table table-striped table-bordered table-hover table-condensed">

        <caption>学生列表 - 共${page.total}人</caption>
        <thead>
        <tr class="info">
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>出生日期</th>

            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${students}" var="s" varStatus="status">
            <tr>
                <td>${s.student_id}</td>
                <td>${s.name}</td>
                <td>${s.age}</td>
                <td>${s.sex}</td>
                <td>${s.birthday}</td>

                <td><a href="${ctx}/editStudent?id=${s.id}"><span class="glyphicon glyphicon-edit"></span> </a></td>
                <td><a href="${ctx}/deleteStudent?id=${s.id}" onclick="javascript:return del();"><span
                        class="glyphicon glyphicon-trash"></span> </a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<nav class="pageDIV">
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=0">
                <span class="glyphicon glyphicon-backward"></span>
            </a>
        </li>

        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=${page.start-page.count}">
                <span class="glyphicon glyphicon-triangle-left"></span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

            <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.start+page.count}">
                <span class="glyphicon glyphicon-triangle-right"></span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.last}">
                <span class="glyphicon glyphicon-forward"></span>
            </a>
        </li>
    </ul>
</nav>

</body>
</html>
