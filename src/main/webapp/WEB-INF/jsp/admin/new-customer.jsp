<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="New Customer"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2><i class="bi bi-person-plus-fill"></i> Create New Customer</h2>
    <a href="${pageContext.request.contextPath}/admin/customers" class="btn btn-secondary">
        <i class="bi bi-arrow-left-circle"></i> Back to Customers
    </a>
</div>

<div class="card">
    <div class="card-body">
        <form method="post" action="${pageContext.request.contextPath}/admin/customers">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Username</label>
                    <input name="username" class="form-control" required/>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required/>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input name="fullName" class="form-control" required/>
            </div>
             <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required/>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Meter Number</label>
                    <input name="meterNumber" class="form-control" required/>
                </div>
            </div>
             <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control" rows="3"></textarea>
            </div>
            <button class="btn btn-success w-100 btn-lg" type="submit">
                <i class="bi bi-check-circle-fill"></i> Create Customer
            </button>
        </form>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>