<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="masthead">
	<h3 class="muted">
		<spring:message code='header.message' />
		<span style="float: right">
		    <a href="?lang=en">en</a>
		    |
		    <a href="?lang=fr">fr</a>
		</span>
	</h3>

	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav" ng-controller="LocationController">
					<li
						ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}">
						<a href="<c:url value="/"/>"
						title='<spring:message code="header.home"/>'>
							<p>
								<spring:message code="header.home" />
							</p>
					</a>
					</li>
					<li
						ng-class="{'gray': activeURL == 'videosAdmin', '': activeURL != 'videosAdmin'}"><a
						title='<spring:message code="header.videosAdmin"/>'
						href="<c:url value='/protected/videosAdmin'/>"><p>
								<spring:message code="header.videosAdmin" />
							</p></a></li>
							
					<li
						ng-class="{'active': activeURL == 'videoView', '': activeURL != 'videoView'}">
						<a href="<c:url value="/protected/videoView/"/>"
						title='<spring:message code="header.videoView"/>'>
							<p>
								<spring:message code="header.videoView" />
							</p>
					</a>
					</li>
					
					<li
						ng-class="{'gray': activeURL == 'about', '': activeURL != 'about'}"><a
						title='<spring:message code="header.about"/>'
						href="<c:url value='/protected/about'/>"><p>
								<spring:message code="header.about" />
							</p></a></li>				
					
					
				</ul>

				<ul class="nav pull-right">
					<li><a href="<c:url value='/logout' />"
						title='<spring:message code="header.logout"/>'><p
								class="displayInLine">
								<spring:message code="header.logout" />
								&nbsp;(${user.name})
							</p></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
