<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
</style>
<link rel="stylesheet" href="<c:url value='/resources/test.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/scroll.css'/>"
	type="text/css">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap.min.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/bootstrap.min.js'/>"></script>
</head>
<body class="back">
	<div class="container ">
		<h1>Add Person</h1>

		<c:url var="addAction" value="/person/add" />
		<form:form action="${addAction}" modelAttribute="person">
			<table class="table" id="abc">
				<c:if test="${person.name ne null}">
					<tr>
						<td><form:label path="id">Enter Id : </form:label></td>
						<td><form:input path="id" readonly="true" disabled="true"
								size="8" /></td>
					</tr>
				</c:if>
				<tr>
					<td><form:label path="name">Name : </form:label></td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td><form:label path="country">Country : </form:label></td>
					<td><form:input path="country" /></td>
				</tr>
				<tr>
					<td><c:if test="${person.name ne null }">
							<input type="submit" value="Edit Person" class="btn btn-primary">
						</c:if> <c:if test="${person.name eq null }">
							<input type="submit" value="Add Person" class="btn btn-primary">
						</c:if></td>
				</tr>
			</table>
		</form:form>
		<br>
		<h2 class="text-center big">Persons List</h2>
		<c:if test="${personList ne null}">
			<div>
				<table id="t1" class="table table-striped ">
					<thead >
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Country</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${personList}">

							<tr>
								<td>${p.id}</td>
								<td>${p.name}</td>
								<td>${p.country}</td>
								<td><a href="<c:url value='/edit/${p.id}'/>">Edit</a></td>
								<td><a href="<c:url value='/remove/${p.id}'/>">Delete</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
</body>
</html>