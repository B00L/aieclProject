<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row-fluid" ng-controller="Greeting">
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
		
		<a title='videoDetail'
						href="<c:url value='/protected/video'/>"><p>
								Video Detail
		</p></a>

		<video src="videosFiles/TestVid.mp4" width="720" controls>
		</video>
		<video src="{{greeting.videoPath}}" width="720" controls>
		</video>
		<p> {{greeting.name}} </p>
	</div>
</div>

<script src="<c:url value="/resources/js/pages/greeting.js" />"></script>