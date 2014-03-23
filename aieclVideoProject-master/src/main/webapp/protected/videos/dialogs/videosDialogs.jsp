<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="addVideosModal"
	class="modal hide fade in centering insertAndUpdateDialogs"
	role="dialog" aria-labelledby="addVideosModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3 id="addVideosModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="video" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newVideoForm" novalidate>
			<div class="pull-left">
				<div>
					<div class="input-append">
						<label>* <spring:message code="videos.name" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required autofocus ng-model="video.name"
							name="name"
							placeholder="<spring:message code='video'/>&nbsp;<spring:message code='videos.name'/>" />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newVideoForm.name.$error.required">
								<spring:message code="required" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="videos.email" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="video.email" name="email"
							placeholder="<spring:message code='sample.email'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newVideoForm.email.$error.required">
								<spring:message code="required" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="videos.phone" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="video.phoneNumber"
							name="phoneNumber"
							placeholder="<spring:message code='sample.phone'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newVideoForm.phoneNumber.$error.required">
								<spring:message code="required" />
						</span>
						</label>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createVideo(newVideoForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addVideosModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateVideosModal"
	class="modal hide fade in centering insertAndUpdateDialogs"
	role="dialog" aria-labelledby="updateVideosModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateVideosModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="video" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateVideoForm" novalidate>
			<input type="hidden" required ng-model="video.id" name="id"
				value="{{video.id}}" />

			<div class="pull-left">
				<div>
					<div class="input-append">
						<label>* <spring:message code="videos.name" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" autofocus required ng-model="video.name"
							name="name"
							placeholder="<spring:message code='video'/>&nbsp;<spring:message code='videos.name'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && updateVideoForm.name.$error.required">
								<spring:message code="required" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="videos.email" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="video.email" name="email"
							placeholder="<spring:message code='sample.email'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && updateVideoForm.email.$error.required">
								<spring:message code="required" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="videos.phone" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="video.phoneNumber"
							name="phoneNumber"
							placeholder="<spring:message code='sample.phone'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && updateVideoForm.phoneNumber.$error.required">
								<spring:message code="required" />
						</span>
						</label>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateVideo(updateVideoForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateVideosModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteVideosModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchVideosModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteVideosModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="video" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteVideoForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{video.name}}?
			</p>

			<input type="submit" class="btn btn-inverse"
				ng-click="deleteVideo();" value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteVideosModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span> <span class="alert alert-error dialogErrorMessage"
		ng-show="errorIllegalAccess"> <spring:message
			code="request.illegal.access" />
	</span>
</div>

<div id="searchVideosModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchVideosModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="searchVideosModalLabel" class="displayInLine">
			<spring:message code="search" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="searchVideoForm" novalidate>
			<label><spring:message code="search.for" /></label>

			<div>
				<div class="input-append">
					<input type="text" autofocus required ng-model="searchFor"
						name="searchFor"
						placeholder="<spring:message code='video'/>&nbsp;<spring:message code='videos.name'/> " />
				</div>
				<div class="input-append displayInLine">
					<label class="displayInLine"> <span
						class="alert alert-error"
						ng-show="displayValidationError && searchVideoForm.searchFor.$error.required">
							<spring:message code="required" />
					</span>
					</label>
				</div>
			</div>
			<input type="submit" class="btn btn-inverse"
				ng-click="searchVideo(searchVideoForm, false);"
				value='<spring:message code="search"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#searchVideosModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>
