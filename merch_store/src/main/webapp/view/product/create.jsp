<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/2/2023
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
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
</head>
<style>
    .form-1 {
        border: 2px solid blue;
        border-radius: 10px;
        padding: 10px;
        background-color: black;
    }

    .text-content {
        color: white;
        font-size: 20px;
        font-weight: bold;
    }
    .coler1{
        color: wheat;
        font-size: 16px;
    }
</style>
<body>
<%@include file="/view/carts/store-header.jsp" %>
<%--<h2 id="success">--%>
<%--    <c:if test="${requestScope['message'] != null}">--%>
<%--        <span style="color: blue"><i class="fa-solid fa-square-check"></i>${requestScope['message']}</span>--%>
<%--    </c:if>--%>
<%--</h2>--%>
<!-- Modal success -->
<%--<div class="modal fade" id="modal-success" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h4>${message}</h4>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button name="no" type="button" class="btn btn-info" data-bs-dismiss="modal">Close</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<c:if test="${message != null}">--%>
<%--    <script>--%>
<%--        // Get the modal element--%>
<%--        let myModal = document.querySelector("#modal-success");--%>

<%--        // Create a new Modal instance--%>
<%--        let modal = new bootstrap.Modal(myModal);--%>

<%--        // Show the modal--%>
<%--        modal.show();--%>
<%--    </script>--%>
<%--  --%>
<%--</c:if>--%>

<div class="row ">
    <div class="col-md-4 col-sm-0"></div>
    <div class="col-md-4 col-sm-12 ">
        <form action="/products?action=create" method="post" class="form-1" id="form-1">
            <h4  style="text-align: center;color:white; font-size: 30px ">Create Product Account </h4>
            <div class="mb-3">
                <label for="image" class="form-label " ><span class="text-content coler1">Image</span></label>
                <input type="text" class="form-control" name="image" id="image">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label "><span class="text-content coler1">Name</span> </label>
                <input type="text" class="form-control" id="name" name="name">
                <%--                       pattern="^([\p{Lu}][\p{Ll}]{1,8})(\s([\p{Lu}]|[\p{Lu}][\p{Ll}]{1,10})){0,5}$">--%>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label "><span class="text-content coler1">Description</span></label>
                <input type="text" class="form-control" id="description" name="description"
                       aria-describedby="emailHelp">
                <%--                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">--%>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label "><span class="text-content coler1">price</span></label>
                <input type="number" class="form-control" id="price" name="price" aria-describedby="emailHelp">
                <%--                       pattern="^[0][0-9]{9}$">--%>
            </div>
            <div class="mb-3">
                <label for="productType" class="form-label "><span class="text-content coler1">Product Type</span></label>
                <select name="productType" class="form-select" id="productType" aria-label="Default select example">
                    <c:forEach var="productType" items="${productTypeList}">
                        <option value="${productType.productTypeId}">${productType.productTypeName}</option>
                    </c:forEach>
                </select>

            </div>
            <div style="text-align: center ">
                <button type="submit" form="form-1" class="btn btn-primary "><span
                        style="font-weight: bold;color:white">Add New Product</span></button>
            </div>
        </form>
    </div>
    <div class="col-md-4 col-sm-0"></div>
</div>
<!-- Modal success -->



<script>
    setTimeout(function () {
        document.getElementById("success").style.display = "none";
    }, 1000)
</script>
<%@include file="/view/carts/footer.jsp" %>
</body>
</html>
