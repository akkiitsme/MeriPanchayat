<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="header">
<nav class="navbar navbar-expand-sm bg-success navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link" href="/">Meri Panchayat 1.0.0 - 2023</a></li>
		<c:if test="${not empty dashboard}">
			<li class="nav-item active"><a class="nav-link" href="/dashboard">Dashboard</a></li>
		</c:if>
	</ul>
	

	<c:if test="${not empty user.name}">
	<ul class="navbar-nav ml-auto">
		<li class="nav-item"><a class="btn btn-outline-success text-white nav-link" href="/logout"> Logout </a></li>
	</ul>
	</c:if>
</nav>
</header>