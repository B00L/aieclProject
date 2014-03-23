<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row-fluid" ng-controller="videosController">
	<h2>
		<p class="text-center">
			<spring:message code='videos.header' />
			<a href="#searchVideosModal" id="videosHeaderButton" role="button"
				ng-class="{'': displaySearchButton == true, 'none': displaySearchButton == false}"
				title="<spring:message code="search"/>&nbsp;<spring:message code="video"/>"
				class="btn btn-inverse" data-toggle="modal"> <i
				class="icon-search"></i>
			</a>
		</p>
	</h2>
	<h4>
		<div ng-class="{'': state == 'list', 'none': state != 'list'}">
			<p class="text-center">
				<spring:message code="message.total.records.found" />
				:&nbsp;{{page.totalVideos}}
			</p>
		</div>
	</h4>

	<div>
		<div id="loadingModal" class="modal hide fade in centering"
			role="dialog" aria-labelledby="deleteVideosModalLabel"
			aria-hidden="true">
			<div id="divLoadingIcon" class="text-center">
				<div class="icon-align-center loading"></div>
			</div>
		</div>

		<div
			ng-class="{'alert badge-inverse': displaySearchMessage == true, 'none': displaySearchMessage == false}">
			<h4>
				<p class="messageToUser">
					<i class="icon-info-sign"></i>&nbsp;{{page.searchMessage}}
				</p>
			</h4>
			<a href="#" role="button" ng-click="resetSearch();"
				ng-class="{'': displaySearchMessage == true, 'none': displaySearchMessage == false}"
				title="<spring:message code='search.reset'/>"
				class="btn btn-inverse" data-toggle="modal"> <i
				class="icon-remove"></i> <spring:message code="search.reset" />
			</a>
		</div>

		<div
			ng-class="{'alert badge-inverse': displayMessageToUser == true, 'none': displayMessageToUser == false}">
			<h4 class="displayInLine">
				<p class="messageToUser displayInLine">
					<i class="icon-info-sign"></i>&nbsp;{{page.actionMessage}}
				</p>
			</h4>
		</div>

		<div
			ng-class="{'alert alert-block alert-error': state == 'error', 'none': state != 'error'}">
			<h4>
				<i class="icon-info-sign"></i>
				<spring:message code="error.generic.header" />
			</h4>
			<br />

			<p>
				<spring:message code="error.generic.text" />
			</p>
		</div>

		<div
			ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">
			<h4>
				<i class="icon-info-sign"></i>
				<spring:message code="videos.emptyData" />
			</h4>
			<br />

			<p>
				<spring:message code="videos.emptyData.text" />
			</p>
		</div>

		<div id="gridContainer"
			ng-class="{'': state == 'list', 'none': state != 'list'}">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th scope="col"><spring:message code="videos.name" /></th>
						<th scope="col"><spring:message code="videos.uploadDate" /></th>
						<th scope="col"><spring:message code="videos.viewCount" /></th>
						<th scope="col"><spring:message code="videos.duration" /></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="video in page.source">
						<td class="tdVideosCentered">{{video.name}}</td>
						<td class="tdVideosCentered">{{video.uploadDate}}</td>
						<td class="tdVideosCentered">{{video.viewCount}}</td>
						<td class="tdVideosCentered">{{video.duration}}</td>
						<td class="width15">
							<div class="text-center">
								<input type="hidden" value="{{video.id}}" /> <a
									href="#updateVideosModal" ng-click="selectedVideo(video);"
									role="button"
									title="<spring:message code="update"/>&nbsp;<spring:message code="video"/>"
									class="btn btn-inverse" data-toggle="modal"> <i
									class="icon-pencil"></i>
								</a> <a href="#deleteVideosModal" ng-click="selectedVideo(video);"
									role="button"
									title="<spring:message code="delete"/>&nbsp;<spring:message code="video"/>"
									class="btn btn-inverse" data-toggle="modal"> <i
									class="icon-minus"></i>
								</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="text-center">
				<button href="#" class="btn btn-inverse"
					ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
					ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
					title='<spring:message code="pagination.first"/>'>
					<spring:message code="pagination.first" />
				</button>
				<button href="#" class="btn btn-inverse"
					ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
					ng-disabled="page.currentPage == 0" class="btn btn-inverse"
					ng-click="changePage(page.currentPage - 1)"
					title='<spring:message code="pagination.back"/>'>&lt;</button>
				<span>{{page.currentPage + 1}} <spring:message
						code="pagination.of" /> {{page.pagesCount}}
				</span>
				<button href="#" class="btn btn-inverse"
					ng-class="{'btn-inverse': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
					ng-click="changePage(page.currentPage + 1)"
					ng-disabled="page.pagesCount - 1 == page.currentPage"
					title='<spring:message code="pagination.next"/>'>&gt;</button>
				<button href="#" class="btn btn-inverse"
					ng-class="{'btn-inverse': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
					ng-disabled="page.pagesCount - 1 == page.currentPage"
					ng-click="changePage(page.pagesCount - 1)"
					title='<spring:message code="pagination.last"/>'>
					<spring:message code="pagination.last" />
				</button>
			</div>
		</div>
		<div
			ng-class="{'text-center': displayCreateVideoButton == true, 'none': displayCreateVideoButton == false}">
			<br /> <a href="#addVideosModal" role="button"
				ng-click="resetVideo();"
				title="<spring:message code='create'/>&nbsp;<spring:message code='video'/>"
				class="btn btn-inverse" data-toggle="modal"> <i
				class="icon-plus"></i> &nbsp;&nbsp;<spring:message code="create" />&nbsp;<spring:message
					code="video" />
			</a>
		</div>

		<jsp:include page="dialogs/videosDialogs.jsp" />

	</div>
</div>

<script src="<c:url value="/resources/js/pages/videos.js" />"></script>