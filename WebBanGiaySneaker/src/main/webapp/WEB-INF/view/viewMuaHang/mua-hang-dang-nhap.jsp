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

<body class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal">

<!--Nav-->
<%@include file="../layout/header-khach-hang-dang-nhap.jsp" %>
<section class="bg-white py-8">

    <div class="container mx-auto flex items-center flex-wrap pt-4 pb-12">

        <nav id="store" class="w-full z-30 top-0 px-6 py-1">
            <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">

                <a class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl "
                   href="#">
                    Store
                </a>

                <div class="flex items-center" id="store-nav-content">

                    <a class="pl-3 inline-block no-underline hover:text-black" href="#">
                        <svg class="fill-current hover:text-black" xmlns="http://www.w3.org/2000/svg" width="24"
                             height="24" viewBox="0 0 24 24">
                            <path d="M7 11H17V13H7zM4 7H20V9H4zM10 15H14V17H10z"/>
                        </svg>
                    </a>

                    <a class="pl-3 inline-block no-underline hover:text-black" href="#">
                        <svg class="fill-current hover:text-black" xmlns="http://www.w3.org/2000/svg" width="24"
                             height="24" viewBox="0 0 24 24">
                            <path d="M10,18c1.846,0,3.543-0.635,4.897-1.688l4.396,4.396l1.414-1.414l-4.396-4.396C17.365,13.543,18,11.846,18,10 c0-4.411-3.589-8-8-8s-8,3.589-8,8S5.589,18,10,18z M10,4c3.309,0,6,2.691,6,6s-2.691,6-6,6s-6-2.691-6-6S6.691,4,10,4z"/>
                        </svg>
                    </a>

                </div>
            </div>
        </nav>
    </div>

    </div>
</section>
<div class="row">
    <div class="col-1"></div>
    <div class="col-4">
        <img width="500px" height="348px" src="/images/${ctsp.anh}" class="hover:grow hover:shadow-lg">
        <br>

    </div>
    <div class="col-7">
        <h1>${ctsp.sanPham.ten}</h1>
        Đế giày: <br>
        <c:forEach items="${deGiay}" var="deGiay">
            <a href="#" class="${ctsp.deGiay.ten == deGiay.ten ? 'btn btn-primary' : 'btn btn-outline-dark'}"
               role="button">${deGiay.ten}</a>
        </c:forEach>
        <br>
        Dòng sản phẩm: <br>
        <c:forEach items="${dongSP}" var="dongSP">
            <a href="#" class="${ctsp.dongSP.ten == dongSP.ten ? 'btn btn-warning' : 'btn btn-outline-dark'}"
               role="button">${dongSP.ten}</a>

        </c:forEach>
        <br>
        Màu sắc: <br>
        <c:forEach items="${mauSac}" var="mauSac">
            <a href="#" class=" ${ctsp.mauSac.ten == mauSac.ten ? 'btn btn-danger' : 'btn btn-outline-dark'}"
               role="button">${mauSac.ten}</a>

        </c:forEach> <br>
        Kích cỡ: <br>
        <c:forEach items="${ctspKichCo}" var="ctspKichCo">
            <a href="/mua-hang/${ctspKichCo.id}" value="${ctspKichCo.kichCo}"
                    class="${ctsp.kichCo == ctspKichCo.kichCo ? 'btn btn-dark' : 'btn btn-outline-dark'}" role="button">${ctspKichCo.kichCo}</a>
        </c:forEach>
        <h2 class="font-weight-bold" style="color: crimson">${ctsp.donGia} $</h2>
        <h5>${ctsp.soLuong} sản phẩm có sẵn</h5>
       <div class="row">
           <div class="col-2">
               <form action="/nguoi-dung-add-cart/${ctsp.id}" method="get">
                   Số lượng: <br><input type="number" name="soLuong" class="form-control" style="width: 200px" placeholder="1"> <br>
                   <p style="color: red">${checkSoLuong}</p>
                   <button  class="btn btn-outline-dark" type="submit">Thêm vào giỏ hàng</button>
               </form>
           </div>
           <div class="col-3" style="margin-top: 87px;">
               <a href="/trang-chu/khach-hang" class="btn btn-outline-primary" role="button" style="width: 200px">Tiếp tục mua hàng</a>
           </div>
       </div>


    </div>
    <section class="bg-white py-8">

        <div class="container py-8 px-6 mx-auto">

            <a class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl mb-8"
               href="#">
                About
            </a>

            <p class="mt-8 mb-8">This template is inspired by the stunning nordic minamalist design - in particular:
                <br>
                <a class="text-gray-800 underline hover:text-gray-900" href="http://savoy.nordicmade.com/"
                   target="_blank">Savoy Theme</a> created by <a class="text-gray-800 underline hover:text-gray-900"
                                                                 href="https://nordicmade.com/">https://nordicmade.com/</a>
                and <a class="text-gray-800 underline hover:text-gray-900" href="https://www.metricdesign.no/"
                       target="_blank">https://www.metricdesign.no/</a></p>

            <p class="mb-8">Lorem ipsum dolor sit amet, consectetur <a href="#">random link</a> adipiscing elit, sed do
                eiusmod tempor incididunt ut labore et dolore magna aliqua. Vel risus commodo viverra maecenas accumsan
                lacus vel facilisis volutpat. Vitae aliquet nec ullamcorper sit. Nullam eget felis eget nunc lobortis
                mattis aliquam. In est ante in nibh mauris. Egestas congue quisque egestas diam in. Facilisi nullam
                vehicula ipsum a arcu. Nec nam aliquam sem et tortor consequat. Eget mi proin sed libero enim sed
                faucibus turpis in. Hac habitasse platea dictumst quisque. In aliquam sem fringilla ut. Gravida rutrum
                quisque non tellus orci ac auctor augue mauris. Accumsan lacus vel facilisis volutpat est velit egestas
                dui id. At tempor commodo ullamcorper a. Volutpat commodo sed egestas egestas fringilla. Vitae congue eu
                consequat ac.</p>

        </div>

    </section>

    <footer class="container mx-auto bg-white py-8 border-t border-gray-400">
        <div class="container flex px-3 py-8 ">
            <div class="w-full mx-auto flex flex-wrap">
                <div class="flex w-full lg:w-1/2 ">
                    <div class="px-3 md:px-0">
                        <h3 class="font-bold text-gray-900">About</h3>
                        <p class="py-4">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vel mi ut felis tempus
                            commodo nec id erat. Suspendisse consectetur dapibus velit ut lacinia.
                        </p>
                    </div>
                </div>
                <div class="flex w-full lg:w-1/2 lg:justify-end lg:text-right">
                    <div class="px-3 md:px-0">
                        <h3 class="font-bold text-gray-900">Social</h3>
                        <ul class="list-reset items-center pt-3">
                            <li>
                                <a class="inline-block no-underline hover:text-black hover:underline py-1" href="#">Add
                                    social links</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

</body>

</html>
