<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="All Bills"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2><i class="bi bi-card-list"></i> All Bills</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
        <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
    </a>
</div>

<div class="card">
    <div class="card-header">
        <span>Billing History for All Customers</span>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Bill ID</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>Billing Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bill" items="${bills}">
                        <tr>
                            <td>${bill.id}</td>
                            <td>${bill.customer.fullName}</td>
                            <td>₹${bill.amount}</td>
                            <td>${bill.billingDate}</td>
                            <td>
                                <c:if test="${bill.paid}">
                                    <span class="badge bg-success">Paid</span>
                                </c:if>
                                <c:if test="${not bill.paid}">
                                    <span class="badge bg-danger">Unpaid</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>