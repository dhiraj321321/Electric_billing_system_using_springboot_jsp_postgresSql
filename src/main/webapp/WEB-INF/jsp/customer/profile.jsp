<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="My Profile"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2 class="mb-4"><i class="bi bi-person-circle"></i> Customer Profile</h2>

<div class="card">
    <div class="card-header">
        <h5>Welcome, ${user.fullName}!</h5>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-2 text-center">
                 <i class="bi bi-person-bounding-box" style="font-size: 5rem; color: #6c757d;"></i>
            </div>
            <div class="col-md-10">
                <p><strong>Username:</strong> ${user.username}</p>
                <p><strong>Email:</strong> ${user.email}</p>
                <p><strong>Meter Number:</strong> <span class="badge bg-secondary">${user.meterNumber}</span></p>
                <p><strong>Address:</strong> ${user.address}</p>
                <a class="btn btn-primary mt-3" href="${pageContext.request.contextPath}/customer/bills">
                    <i class="bi bi-receipt"></i> View My Bills
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>