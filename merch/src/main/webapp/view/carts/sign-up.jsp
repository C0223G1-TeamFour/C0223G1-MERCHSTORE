<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<%@include file="header.jsp" %>
<section class="sign-up">
    <div class="container">
        <div class="row flex-column align-items-center justify-content-center mt-4">
            <h1 class="col-auto mb-5">Create account</h1>
            <form class="col-10 col-lg-6" action="/signup" method="post">
                <div class="form-floating">
                    <input
                            type="text"
                            name="firstName"
                            id="firstName"
                            class="form-control"
                            placeholder="Place your first name here"
                            required />
                    <label for="firstName">First name</label>
                </div>

                <div class="form-floating mt-4">
                    <input
                            type="text"
                            name="lastName"
                            id="lastName"
                            class="form-control"
                            placeholder="Place your last name here"
                            required
                    />
                    <label for="lastName">Last name</label>
                </div>
                <div class="form-floating mt-4">
                    <input
                            name="email"
                            type="email"
                            id="email"
                            class="form-control"
                            placeholder="Place your email here"
                            required
                    />
                    <label for="email">Email</label>
                </div>

                <div class="form-floating mt-4">
                    <input
                            name="password"
                            type="password"
                            id="password"
                            class="form-control"
                            placeholder="Place your password here"
                            required
                    />
                    <label for="password">Password</label>
                </div>

                <c:if test="${message != null}">
                    <div class="messages mt-2" style="display: block">
                        <h6 class="alert alert-danger" role="alert">${message}</h6>
                    </div>
                </c:if>

                <div class="row flex-column justify-content-center align-items-center">
                    <button type="submit" class="col-auto btn bg-black mt-5 py-2 px-5 text-white">Create</button>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
<script>
    setTimeout( function (){
        document.querySelector(".messages").style.display = "none";
    }, 3000)
</script>
</body>
</html>

