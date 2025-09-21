<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Generate Bill"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2><i class="bi bi-receipt-cutoff"></i> Generate New Bill</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
        <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
    </a>
</div>

<div class="card">
    <div class="card-body">
        <form method="post" action="${pageContext.request.contextPath}/admin/generate-bill">
            <div class="mb-3">
                <label for="customerId" class="form-label">Select Customer</label>
                <select name="customerId" id="customerId" class="form-select">
                    <c:forEach var="customer" items="${customers}">
                        <option value="${customer.id}">${customer.fullName} (Meter: ${customer.meterNumber})</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="units" class="form-label">Units Consumed</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-speedometer"></i></span>
                    <input type="number" name="units" id="units" class="form-control" required min="0" placeholder="e.g., 150"/>
                </div>
            </div>
            <button class="btn btn-primary w-100 btn-lg" type="submit">
                <i class="bi bi-file-earmark-plus-fill"></i> Generate Bill
            </button>
        </form>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>