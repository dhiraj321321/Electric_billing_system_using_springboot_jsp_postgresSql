<%--
  Created by IntelliJ IDEA.
  User: parid
  Date: 9/20/2025
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Register"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row justify-content-center">
    <div class="col-md-8 col-lg-7">
        <div class="card p-4">
            <div class="card-body">
                 <div class="text-center mb-4">
                    <i class="bi bi-person-plus-fill" style="font-size: 3rem; color: var(--bs-primary);"></i>
                    <h2 class="card-title mt-2">Create a New Account</h2>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Username:</label>
                            <input type="text" name="username" class="form-control" value="${user.username}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Password:</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Full Name:</label>
                        <input type="text" name="fullName" class="form-control" value="${user.fullName}" required>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Email:</label>
                            <input type="email" name="email" class="form-control" value="${user.email}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Meter Number:</label>
                            <input type="text" name="meterNumber" class="form-control" value="${user.meterNumber}" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address:</label>
                        <textarea name="address" class="form-control">${user.address}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 btn-lg">Register</button>
                </form>
                <p class="mt-4 text-center">Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>