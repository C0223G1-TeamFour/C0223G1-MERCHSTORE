<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<%@include file="header.jsp" %>
<section class="log-in">
    <div class="container">
        <div
                class="row flex-column align-items-center justify-content-center mt-4">
            <h1 class="col-auto mb-5">Login</h1>
            <form class="col-10 col-lg-6" method="post" action="/login">
                <div class="form-floating">
                    <input
                            name="username"
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
                <a class="d-block mt-3" href="">Forgot your password?</a>

                <c:if test="${message != null}">
                    <div class="messages mt-2">
                        <h6 class="alert alert-danger" role="alert">${message}</h6>
                    </div>
                </c:if>

                <div
                        class="row flex-column justify-content-center align-items-center">
                    <button
                            type="submit"
                            class="col-auto btn bg-black mt-5 py-2 px-5 text-white">
                        Sign in
                    </button>
                    <a class=" text-center col mt-3" href="/view/sign-up.jsp">Create account</a>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>

<script>
    setTimeout( function (){
        document.querySelector(".messages").style.display = "none";
    }, 2000)
</script>

</body>
</html>
