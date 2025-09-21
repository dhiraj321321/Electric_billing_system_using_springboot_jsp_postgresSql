<%--
  Created by IntelliJ IDEA.
  User: parid
  Date: 9/20/2025
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Login"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row justify-content-center">
    <div class="col-md-6 col-lg-5">
        <div class="card p-4">
            <div class="card-body">
                <div class="text-center mb-4">
                    <i class="bi bi-box-arrow-in-right" style="font-size: 3rem; color: var(--bs-primary);"></i>
                    <h2 class="card-title mt-2">Login to Your Account</h2>
                </div>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">Invalid username or password.</div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">You have been logged out successfully.</div>
                </c:if>
                <c:if test="${param.success != null}">
                    <div class="alert alert-success">Registration successful! Please log in.</div>
                </c:if>

                <form method="post" action="${pageContext.request.contextPath}/doLogin">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" id="username" name="username" class="form-control" required autofocus>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 btn-lg">Log In</button>
                </form>
                <p class="mt-4 text-center">Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>