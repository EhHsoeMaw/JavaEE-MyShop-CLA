<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="./layouts/header.jsp">
	<c:param name="title">Home Page</c:param>
</c:import>


<div class="container my-5">
	<!-- Table Start -->
	<table class="table table-bordered">
		<thead>
			<tr class="bg-dark text-white text-center">
				<th scope="col">No</th>
				<th scope="col">Name</th>
				<th scope="col">Image</th>
				<th scope="col">Price</th>
				<th scope="col">Action</th>
				<th scope="col">Total</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
		<tbody>
			<tr>
				<td colspan="5"><span class="float-right">Total</span></td>
				<td colspan="5"><span id="gTotal"></span></td>
			</tr>
			<tr>
				<td colspan="5"><span class="float-right">Gov Tax</span></td>
				<td colspan="5"><span id="gTax"></span></td>
			</tr>
			<tr>
				<td colspan="5"><span class="float-right">Grand Total</span></td>
				<td colspan="5"><span id="ggTotal">$ 5400</span></td>
			</tr>
			<tr>
				<td colspan="6"><button
						class="btn btn-primary btn-sm float-right" onClick="billOut()">Bill
						Out</button></td>
			</tr>
		</tbody>
	</table>
	<!-- Table End -->
</div>


<c:import url="./layouts/footer.jsp"></c:import>
<script>
	loadCartItems();
</script>





