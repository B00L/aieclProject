<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html id="ng-app" ng-app="angularJSApp">
<head>
<title><spring:message code="project.title" /></title>
<link href="<c:url value='/resources/css/bootstrap.min.css'  />"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/bootstrap-responsive.min.css'  />"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/project_style.css'  />"
	rel="stylesheet" />
<script src="<c:url value='/resources/js/jquery-1.9.1.min.js' />"></script>
<script src="<c:url value='/resources/js/angular.min.js' />"></script>
<script src="<c:url value="/resources/js/pages/app.js" />"></script>
<script src="<c:url value="/resources/js/pages/videosAdmin.js" />"></script>
<script src="<c:url value="/resources/js/pages/videosView.js" />"></script>
</head>
<body>
	<div id="header-wrapper">
            
	</div>

	<div class="container">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="body" />
	</div>

	<!--[if IE]>
            <script src="<c:url value='/resources/js/bootstrap.min.ie.js' />"></script>
        <![endif]-->
	<!--[if !IE]><!-->
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<!--<![endif]-->

	<tiles:insertAttribute name="footer" />
</body>
</html>