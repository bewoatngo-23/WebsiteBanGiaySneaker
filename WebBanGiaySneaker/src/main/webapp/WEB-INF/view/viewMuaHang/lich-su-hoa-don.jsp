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

<%@include file="../layout/header-khach-hang-dang-nhap.jsp" %>
<%--Gio Hang--%>
<hr>
<div class="row" style="text-align: center">
    <h1>Hoàn Tất</h1>
</div>
<hr>
<div style="border: solid black; width: 1300px" >
    <div style="margin-top: 20px">
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Sản phẩm</th>
                <th>Ảnh</th>
                <th>Màu sắc</th>
                <th>Kích cỡ</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
                <th>Tình trạng đơn hàng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${lichSuHoaDon}" var="l" varStatus="s">
                <tr>
                    <td>${s.index+1}</td>
                    <td>${l.chiTietSanPham.sanPham.ten}</td>
                    <td>
                        <img width="150px" height="100px" src="/images/${l.chiTietSanPham.anh}" alt="...">
                    </td>
                    <td>${l.chiTietSanPham.mauSac.ten}</td>
                    <td>${l.chiTietSanPham.kichCo}</td>
                    <th>${l.soLuong}</th>
                    <th>${l.donGia}</th>
                    <th>${l.soLuong * l.donGia}</th>
                    <th>
                        <c:if test="${l.hoaDon.trangThai == 0}">
                            <p style="color: coral">Chờ thanh toán</p>
                        </c:if>
                        <c:if test="${l.hoaDon.trangThai == 1}">
                            <p style="color: limegreen">Đơn hàng thành công</p>
                        </c:if>
                        <c:if test="${l.hoaDon.trangThai == 2}">
                            <p style="color: goldenrod">Đang vận chuyển</p>
                        </c:if>
                        <c:if test="${l.hoaDon.trangThai == 3}">
                            <p style="color: red">Đang chuẩn bị hàng</p>
                        </c:if>
                    </th>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
</body>

</html>
