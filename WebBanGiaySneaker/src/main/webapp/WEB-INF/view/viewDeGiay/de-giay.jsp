<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Shoe Store</title>
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
            crossorigin="anonymous"
    />

    <style>
        .work-sans {
            font-family: 'Work Sans', sans-serif;
        }

        #menu-toggle:checked + #menu {
            display: block;
        }

        .hover\:grow {
            transition: all 0.3s;
            transform: scale(1);
        }

        .hover\:grow:hover {
            transform: scale(1.02);
        }

        .carousel-open:checked + .carousel-item {
            position: static;
            opacity: 100;
        }

        .carousel-item {
            -webkit-transition: opacity 0.6s ease-out;
            transition: opacity 0.6s ease-out;
        }

        #carousel-1:checked ~ .control-1,
        #carousel-2:checked ~ .control-2,
        #carousel-3:checked ~ .control-3 {
            display: block;
        }

        .carousel-indicators {
            list-style: none;
            margin: 0;
            padding: 0;
            position: absolute;
            bottom: 2%;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 10;
        }

        #carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
        #carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
        #carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet {
            color: #000;
            /*Set to match the Tailwind colour you want the active one to be */
        }
    </style>

</head>

<body class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal container">

<%@include file="../layout/header.jsp" %>
<%--Chuc Vu--%>
<div class="row" style="text-align: center">
    <h1>Đế giày</h1>
</div>
<br>
<div class="row">
    <%--@elvariable id="deGiay" type=""--%>
    <form:form action="/de-giay/addOrUpdate" method="post" modelAttribute="deGiay">
        <div class="row">
            <div class="col-4">
                <div class="col-8">
                    <form:input path="id" hidden="true" class="form-control"/>
                   <br><form:input path="ma"  hidden="true" class="form-control"/>
<%--                    <p style="color: red">${checkMa}</p>s--%>
<%--                    <form:errors path="ma" cssClass="text-danger"/> <br>--%>
                    Tên: <br><form:input path="ten" class="form-control"/>
                    <form:errors path="ten" cssClass="text-danger"/> <br>
                </div>
            </div>
        </div>
        <br>
        <form:button type="submit" class="btn btn-success">Add or Update</form:button>
    </form:form>
</div>
<br>
<div class="row">
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listDG.content}" var="l" varStatus="s">
            <tr>
                <td>${s.index+ 1}</td>
                <td>${l.ma}</td>
                <td>${l.ten}</td>

                <td>
                    <a class="btn btn-primary" href="/de-giay/edit/${l.id}" role="button">Edit</a>
                    |
                    <a class="btn btn-danger" href="/de-giay/remove/${l.id}" role="button">Remove</a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <div class="row">
        <div class="col-5">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <li class="page-item">
                        <a class="page-link" href="/de-giay?pageNo=${listDG.number - 1}&pageSize=${listDG.size}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:if test="${not empty listDG}">
                        <c:forEach var="i" begin="0" end="${listDG.totalPages - 1}">
                            <li class="page-item"><a class="page-link"
                                                     href="/de-giay?pageNo=${i}&pageSize=${listDG.size}">${i + 1}</a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <li class="page-item">
                        <a class="page-link" href="/de-giay?pageNo=${listDG.number + 1}&pageSize=${listDG.size}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
</body>

</html>
