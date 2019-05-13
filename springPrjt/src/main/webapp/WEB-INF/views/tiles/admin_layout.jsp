<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.container {
	width: 100%;
	border: 1px solid gray;
}

header, footer {
	padding: 1em;
	color: white;
	background-color: yellow;
	clear: left;
	text-align: center;
}

nav {
	float: left;
	max-width: 160px;
	margin: 0;
	padding: 1em;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>City Gallery</h1>
		</header>
		<nav>
			<a href="#">게시판 관리</a>
			<a href="#">게시판 관리</a>
			<a href="#">게시판 관리</a>
			<a href="#">게시판 관리</a>
		</nav>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer> 저작권 표시 </footer>
	</div>
</body>
</html>