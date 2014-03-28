<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row-fluid" ng-controller="videoDetailController">
	<div class="jumbotron">
		<nav>
            Barre de navigation
            <input type="search" name="searchParam"/>
            <a href="#/videolist">Liste des vidéos</a>
        </nav>
        <div ng-view></div>
	</div>
</div>

<script src="<c:url value="/resources/js/pages/videosView.js" />"></script>
