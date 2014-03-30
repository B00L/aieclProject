<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row-fluid" ng-controller="Featured">
	<div class="jumbotron">
		<h1>
			<spring:message code='project.name' />
		</h1>

		<p class="lead">
			<spring:message code='welcomePage.description' />
		</p>
		
		<p class="lead">
			<spring:message code='welcomePage.featuredVideo' />
		</p>

		<video src="{{featured.videoPath}}" width="720" controls>
		</video>
		<p> {{featured.name}} </p>
	</div>
</div>

<script src="<c:url value="/resources/js/pages/featured.js" />"></script>