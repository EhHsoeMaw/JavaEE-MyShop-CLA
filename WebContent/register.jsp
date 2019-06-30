<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="./layouts/header.jsp">
	<c:param name="title">Register Page</c:param>
</c:import>

<sql:query var="rs" dataSource="jdbc/TestDB">
	select * from categories
</sql:query>

<div class="container my-5">
	<c:if test="${!empty(error)}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>${error}</strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<div class="col-md-6 offset-md-3">
		<h1 class="text-center text-info mb-5">Register Here!</h1>
		<form method="post"
			action="${pageContext.request.contextPath}/UserController?action=register">
			<div class="form-group">
				<label for="email">Name</label> <input
					class="form-control rounded-0" id="name" name="name">
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="email"
					class="form-control rounded-0" id="email" name="email">
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control rounded-0" id="password" name="password">
			</div>
			<div class="row justify-content-between no-gutters">
				<a href="/MyShop/login.jsp" class="text-muted">Already member
					yet! Please Login Here!</a>
				<button type="submit" class="btn btn-primary btn-sm">Register</button>
			</div>
		</form>
	</div>
</div>

<c:import url="./layouts/footer.jsp"></c:import>

