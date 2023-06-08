<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 07-06-2023
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <c:import url="header.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
    <h2 style="text-align: center">
        ORDER DETAILS LIST
    </h2>
    <table class="table table-bordered" id="tableOrderDetails">
        <thead class="table-dark">
        <tr>
            <th>STT</th>
            <th>ORDER DETAILS ID</th>
            <th>NAME PRODUCTS</th>
            <th>PRICE</th>
            <th>QUANTITY</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderDetailList}" var="orderDetails" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${orderDetails.id}</td>
                <td>${orderDetails.product.getName()}</td>
                <td>${orderDetails.price}</td>
                <td>${orderDetails.quantity}</td>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableOrderDetails').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<c:import url="footer.jsp"></c:import>
</body>
</html>
