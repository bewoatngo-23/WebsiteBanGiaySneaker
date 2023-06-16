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

<%@include file="../layout/header-khach-hang.jsp" %>
<%--Gio Hang--%>
<hr>
<div class="row" style="text-align: center">
    <h1>Hoàn Tất</h1>
</div>
<hr>
<div style="border: solid black; width: 1000px" >
    <div style="margin-top: 20px; margin-left: 20px">
<p>Mã đơn hàng của bạn là : #122345544434</p>
<p>Ngày đặt hàng: 24/05/2023</p>
<p>Phương thức thanh toán: Thanh toán khi nhận hàng</p>
<br>
<h3>Thông tin đơn hàng</h3>
    <table class="table">
        <thead>
        <tr>
            <th>STT</th>
            <th>Sản Phẩm</th>
            <th>Hình Ảnh</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="subtotal" value="0" />
        <c:forEach items="${cart}" var="l" varStatus="s">
            <tr>
                <td>${s.index+1}</td>
                <td>${l.tenSP}</td>
                <td><img style="width: 200px; height: 180px" src="/images/${l.anh}" class="hover:grow hover:shadow-lg"></td>
                <td>${l.gia} đ</td>
                <td>
                        ${l.soLuong}
                </td>
                <td>${l.gia * l.soLuong}</td>
            </tr>
            <c:set var="subtotal" value="${subtotal + (l.soLuong * l.gia)}"/>
        </c:forEach>
        </tbody>
    </table>
    <h1>Tổng Thanh Toán: ${subtotal}đ</h1>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
</body>

</html>
