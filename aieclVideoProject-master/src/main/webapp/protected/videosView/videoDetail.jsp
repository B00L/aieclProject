<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row-fluid" ng-controller="videoDetailController">
	<div class="jumbotron">
		Video detail

		

		<video src="{{video.videoPath}}" width="720" controls>
		</video>
		<p class="lead">{{video.name}}</p>
		<p>{{video.duration}}</p>
		<p>{{video.viewCount}}</p>
		<p>{{video.uploadDate}}</p>

	</div>
</div>

<script src="<c:url value="/resources/js/pages/videos.js" />"></script>
