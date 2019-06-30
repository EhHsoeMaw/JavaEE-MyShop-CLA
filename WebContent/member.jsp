<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="./layouts/header.jsp">
	<c:param name="title">Member Page</c:param>
</c:import>


<div class="container my-5">
	<c:if test="${!empty(success)}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>${success}</strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
</div>

<c:import url="./layouts/footer.jsp"></c:import>

