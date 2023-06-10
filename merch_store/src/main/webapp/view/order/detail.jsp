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

    <c:import url="/view/carts/store-header.jsp"></c:import>
</head>
<style>
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
<body>
<div class="container px-2">
    <h2 class="mt-3"> DETAILS LIST </h2>
    <table class="table table-bordered col-10" id="tableOrderDetails">
        <thead class="table-dark">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ORDER DETAILS ID</th>
            <th scope="col">NAME PRODUCTS</th>
            <th scope="col">PRICE</th>
            <th scope="col">QUANTITY</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderDetailList}" var="orderDetails" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${orderDetails.id}</td>
                <td>${orderDetails.product.getName()}</td>
                <td>${orderDetails.price} EUR</td>
                <td>${orderDetails.quantity}</td>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableOrderDetails').dataTable({
            "bInfo": false,
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<c:import url="/view/carts/footer.jsp"></c:import>
</body>
</html>
