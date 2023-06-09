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
<style>
    .center{
        text-align: center;
    }
</style>
</head>
<body>
<%@include file="/view/carts/store-header.jsp" %>
<div class="container">
    <div class="d-flex">
            <div class="col-6 mb-3">
                <a href="/products?action=create"><button type="submit" class="btn btn-primary bg-black text-white">
                    Add new products</button></a>
            </div>
        <form class="col-6 d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success bg-black text-white" type="submit">Search</button>
        </form>
    </div>
    <div id="success">
        <p>
            <c:if test="${requestScope['message'] != null}">
                <span style="color: blue">${requestScope['message']}</span>
            </c:if>
        </p>
    </div>
    <%--    table--%>
        <h2 class="mt-3"> PRODUCTS LIST </h2>
    <table class="container table table-bordered mt-0" id="tableStudent">
        <thead class="table-secondary">
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
                <td>
                    <c:out value="${status.count}"></c:out>
                </td>
                <td>
                    <c:out value="${product.id}"></c:out>
                </td>
                <td>
                    <img src="<c:out value="${product.image}"></c:out>" width="70px">
                </td>
                <td>
                    <c:out value="${product.name}"></c:out>
                </td>
                <td>
                    <c:out value="${product.description}"></c:out>
                </td>
                <td>
                    <c:out value="${product.productTypeId.productTypeName}"></c:out>
                </td>
                <td>
                    <c:out value="${product.price} €"></c:out>
                </td>
                <td>
                    <a href="/products?action=edit&id=${product.id}">
                        <button type="button" class="btn btn-primary">
                            <i class="fa-solid fa-pen-to-square"></i></button></a>
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
<div class="d-flex" style="justify-content: center">
    <img src="/view/images/cards.png" height="82" width="684"/></tr>
</div>
</div>
</div>
<script
        defer
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"
></script>
<script
        src="https://kit.fontawesome.com/4bf93b0ca4.js"
        crossorigin="anonymous"

></script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
<script>
    document.getElementById()
</script>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Confirm Delete
                    <span style="color:red" id="nameDelete"></span>
                </h3>
            </div>
            <div class="modal-footer">
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
    },1000)
</script>
<%@include file="/view/carts/footer.jsp" %>
</body>
</html>
