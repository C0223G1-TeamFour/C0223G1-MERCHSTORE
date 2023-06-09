<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <style>
        #modal-body {

        }
    </style>
    <c:import url="/view/carts/store-header.jsp"></c:import>
</head>
<body>
<div class="container px-2">
    <div class=" row mb-4">
        <form class="col-md-8 col-sm-10" action="/orders?action=search" method="post">
            <div class="row">
                <div class="col-xl-2 col-md-3">
                    <label for="inputPassword6" class="col-form-label"><span>Name</span></label>
                </div>
                <div class="col-xl-3 col-md-8">
                    <input type="name" id="inputPassword6" class="form-control" name="name">
                </div>
                <div class="col-xl-2 col-md-1 search">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<table class="table table-bordered" id="tableOrder">
    <thead class="table-dark">
    <tr>
        <th>STT</th>
        <th>ORDER ID</th>
        <th>ORDER DATE</th>
        <th>CUSTOMER NAME</th>
        <th>EMPLOYEE NAME</th>
        <th>STATUS</th>
        <th>TOTAL PRICE</th>
        <th>ORDER DETAIL</th>
        <th>DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderManagement}" var="orders" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${orders.id}</td>
            <td>${orders.date}</td>
            <td>${orders.customer.getName()}</td>
            <td>${orders.employee.getName()}</td>
            <td>${orders.status}</td>
            <td>${integerMap.get(orders.id)} EUR</td>
            <td>
                <button type="submit" class="btn">
                    <a class="btn btn-outline-secondary"
                       href="/orders?action=details&id=${orders.id}">DETAILS</a>
                </button>

            <td>
                <button type="button" class="btn btn-primary" style="background-color: red; align-content: center"
                        data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="remove(${orders.id},'${orders.customer.getName()}')">
                    <i class="fa-solid fa-trash-can"></i>
                </button>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">DELETE ORDER</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Are You Sure Delete The Order With The Name:
                    <span style="color:red" id="nameDelete">?</span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/orders?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-primary">YES</button>
                </form>
            </div>
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
        $('#tableOrder').dataTable({
            "bInfo": false,
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
<c:import url="/view/carts/footer.jsp"></c:import>
</body>

</html>
