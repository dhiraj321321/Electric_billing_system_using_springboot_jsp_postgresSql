<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Admin Dashboard"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2 class="mb-4"><i class="bi bi-speedometer2"></i> Admin Dashboard</h2>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card text-center text-white bg-primary">
            <div class="card-body">
                <h5 class="card-title"><i class="bi bi-people-fill"></i> Total Customers</h5>
                <p class="display-4">${customers.size()}</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
         <div class="card text-center text-white bg-success">
            <div class="card-body">
                <h5 class="card-title"><i class="bi bi-receipt"></i> Total Bills Issued</h5>
                <p class="display-4">${bills.size()}</p>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        <h5><i class="bi bi-lightning-fill"></i> Quick Actions</h5>
    </div>
    <div class="card-body">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/customers"><i class="bi bi-person-lines-fill"></i> Manage Customers</a>
        <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/generate-bill"><i class="bi bi-file-earmark-plus-fill"></i> Generate Bill</a>
        <a class="btn btn-info" href="${pageContext.request.contextPath}/admin/bills"><i class="bi bi-card-list"></i> View All Bills</a>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>