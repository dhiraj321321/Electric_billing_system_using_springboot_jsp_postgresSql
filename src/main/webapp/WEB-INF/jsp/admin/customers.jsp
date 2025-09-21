<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Manage Customers"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2><i class="bi bi-people-fill"></i> Manage Customers</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
        <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
    </a>
</div>

<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <span>All Customer Accounts</span>
        <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/customers/new">
            <i class="bi bi-plus-circle-fill"></i> Add New Customer
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Meter No.</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.username}</td>
                            <td>${customer.fullName}</td>
                            <td>${customer.email}</td>
                            <td>${customer.meterNumber}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>