<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="My Bills"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2><i class="bi bi-receipt"></i> My Bills</h2>
    <a href="${pageContext.request.contextPath}/customer/profile" class="btn btn-secondary">
        <i class="bi bi-arrow-left-circle"></i> Back to Profile
    </a>
</div>

<div class="card">
    <div class="card-header">
        <span>Your Billing History</span>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Bill ID</th>
                        <th>Billing Date</th>
                        <th>Units</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bill" items="${bills}">
                        <tr>
                            <td>${bill.id}</td>
                            <td>${bill.billingDate}</td>
                            <td>${bill.units}</td>
                            <td>₹${bill.amount}</td>
                            <td>
                                <c:if test="${bill.paid}">
                                    <span class="badge bg-success">Paid</span>
                                </c:if>
                                <c:if test="${not bill.paid}">
                                    <span class="badge bg-danger">Unpaid</span>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${not bill.paid}">
                                    <form method="post" action="${pageContext.request.contextPath}/customer/pay/${bill.id}" style="display:inline;">
                                        <button class="btn btn-success btn-sm" type="submit">
                                            <i class="bi bi-credit-card-fill"></i> Pay Now
                                        </button>
                                    </form>
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