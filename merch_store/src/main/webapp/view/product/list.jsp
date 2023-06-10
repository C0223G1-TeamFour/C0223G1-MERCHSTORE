<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/2/2023
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
            integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha384-KWI/x1YonRENGIFUfdTvf/zUoVZiE8OgDmKNu8VAnmQUDf1G/+x0yTHvYbD0b6Q6"
            crossorigin="anonymous"></script>

    <!-- Include Bootstrap JavaScript -->
    <script src="<URL>"
            integrity="<URL>"
            crossorigin="<URL>"></script>
    <style>
        .center {
            text-align: center;
        }

        .pagination {
            float: right;
        }

        .content {
            margin-left: 50px;
            margin-right: 50px;
        }

        table {
            border-collapse: collapse;
            margin: 0;
            padding: 0;
            width: 100%;
            table-layout: fixed;
        }

        table caption {
            font-size: 1.5em;
            margin: .5em 0 .75em;
        }

        table tr {
            padding: .35em;
        }

        table th,
        table td {
            padding: .625em;
            text-align: center;
        }

        @media screen and (max-width: 600px) {
            table {
                border: 0;
            }

            .content {
                margin: 0;
            }

            table thead {
                border: none;
                clip: rect(0 0 0 0);
                height: 1px;
                margin: -1px;
                overflow: hidden;
                padding: 0;
                position: absolute;
                width: 1px;
            }

            table tr {
                border-bottom: 3px solid #ddd;
                display: block;
                margin-bottom: .625em;
            }

            table td {
                border-bottom: 1px solid #ddd;
                display: block;
                font-size: .8em;
                text-align: right;
            }

            table td::before {
                /*
                * aria-label has no advantage, it won't be read inside a table
                content: attr(aria-label);
                */
                content: attr(data-label);
                float: left;
                font-weight: bold;
                text-transform: uppercase;
            }

            table td:last-child {
                border-bottom: 0;
            }

            .search {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
<%@include file="/view/carts/store-header.jsp" %>
<div class="container">
    <div class="d-flex">
        <div class="col-6 mb-3">
            <a href="/products?action=create">
                <button type="submit" class="btn btn-primary bg-black text-white">
                    Add new products
                </button>
            </a>
        </div>
        <form class="col-6 d-flex" role="search" action="/products?action=search" method="post">
            <div class="row">
                <div class="col-xl-1 col-md-3">
                    <label for="inputPassword6" class="col-form-label"><span>Name</span></label>
                </div>
                <div class="col-xl-6 col-md-8 m-lg-0">
                    <input type="name" id="inputPassword6" class="form-control" name="name">
                </div>
                <div class="col-xl-1 col-md-3">
                    <label for="price" class="col-form-label"><span>Price</span></label>
                </div>
                <div class="col-xl-3 col-md-8 m-lg-0">
                    <input type="number" name="price" id="price" class="form-control"
                           aria-describedby="passwordHelpInline">
                </div>
                <div class="col-xl-1 col-md-3 search">
                    <button type="submit" class="btn btn-dark"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
        <%--            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
        <%--            <button class="btn btn-outline-success bg-black text-white" type="submit">Search</button>--%>
        </form>
    </div>
    <%--    <div id="success">--%>
    <%--        <p >--%>
    <%--            <c:if test="${requestScope['message'] != null}">--%>
    <%--                <span style="color: blue"><i class="fa-solid fa-square-check">${requestScope['message']}</span>--%>
    <%--            </c:if>--%>
    <%--        </p>--%>
    <%--    </div>--%>
    <div class="modal fade" id="modal-success" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-bg-success">
                    <h4><i class="fa-solid fa-square-check"></i>${message}</h4>
                </div>
                <div class="modal-footer">
                    <button name="no" type="button" class="btn btn-info" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <c:if test="${message != null}">
        <script>
            // Get the modal element
            let myModal = document.querySelector("#modal-success");

            // Create a new Modal instance
            let modal = new bootstrap.Modal(myModal);

            // Show the modal
            modal.show();
        </script>

    </c:if>
    <%--    table--%>
    <h2 class="mt-3"> PRODUCTS LIST </h2>
    <table class="container table table-bordered mt-0" id="tableStudent">
        <thead class="table-dark">
        <tr>
            <th class="center" scope="col">STT</th>
            <th class="center" scope="col">ID</th>
            <th class="center" scope="col">IMAGE</th>
            <th class="center" scope="col">NAME</th>
            <th class="center" scope="col">DESCRIPTION</th>
            <th class="center" scope="col">TYPE</th>
            <th class="center" scope="col">PRICE</th>
            <th class="center" scope="col">EDIT</th>
            <th class="center" scope="col">DELETE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product" varStatus="status">
            <tr>
                <td class="center">
                    <c:out value="${status.count}"></c:out>
                </td>
                <td class="center">
                    <c:out value="${product.id}"></c:out>
                </td>
                <td>
                    <img src="<c:out value="${product.image}"></c:out>" width="70px">
                </td>
                <td class="center">
                    <c:out value="${product.name}"></c:out>
                </td>
                <td class="center">
                    <c:out value="${product.description}"></c:out>
                </td>
                <td class="center">
                    <c:out value="${product.productTypeId.productTypeName}"></c:out>
                </td>
                <td class="center">
                    <c:out value="${product.price} €"></c:out>
                </td>
                <td>
                    <a href="/products?action=edit&id=${product.id}">
                        <button type="button" class="btn btn-primary">
                            <i class="fa-solid fa-pen-to-square"></i></button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" style="background-color: red"
                            data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="remove(${product.id},'${product.name}')">
                        <i class="fa-solid fa-trash-can"></i>
                    </button>
                </td>
            </tr
        </c:forEach>

        </tbody>
    </table>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <h1 class="modal-title fs-1  text-white " id="exampleModalLabel">Delete Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body ">
                <h3>Confirm Delete
                    <span style="color:#e02d2d; font-size: 30px" id="nameDelete"></span>
                </h3>
            </div>
            <div class="modal-footer ">
                <form action="/products?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "bInfo": false,
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(productId, productName) {
        document.getElementById("nameDelete").innerText = productName;
        document.getElementById("idDelete").value = productId;
    }
</script>
<script>
    setTimeout(function () {
        document.getElementById("success").style.display = "none";
    }, 1000)
</script>

</body>
<%@include file="/view/carts/footer.jsp" %>
</html>
