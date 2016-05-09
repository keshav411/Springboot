<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>File Management</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></link>
		<link href="<c:url value='/static/css/application.css' />" rel="stylesheet"></link>
	</head>
	
	<body ng-app="myApp" class="ng-cloak">
		<div class= "logo">   		
    		<img id="logoImage" src = "<c:url value='/static/images/logo_docs.png' />"/>
    		<font id="logoText">Document Management Panel</font>    		 		    		
   		</div>
   		   		
   		<div class="headerIcons">
   			<a href="/Api/">
   				<img id="logoHome" src="<c:url value='/static/images/logo_home.png' />"/>
   			</a>
    		<a href="/Api/panel">
    			<img id="logoCustomers" src="<c:url value='/static/images/logo_user.png' />"/>
    		</a>    		    		   			
   		</div>
		
		<div class="shadow-below-header"></div>
		
		<div class="generic-container" ng-controller="FileController as ctrl">	
			<div class="panel panel-default">
            	<div class="panel-heading"><span class="lead">Document Insertion Form</span></div>
        			<div class="formcontainer">
						<!-- <form method="post" enctype="multipart/form-data" action="/Api/document/insert/" name="fileForm" class="form-horizontal"> -->
						<form ng-submit="ctrl.uploadFile()" class="form-horizontal" name="fileForm">			
								
							<input type="file" name="fileField" file-model="ctrl.docs" class="form-control input-sm" required/>
										
							<!-- <input type="file" name="file" ng-model="file" class="file form-control input-sm" required/> -->
							 
							<div class="row">	
								<div class="form-actions floatRight">
									<input type="submit" value="Upload"  class="btn btn-primary btn-sm custom-width btnUpload"/>
									<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm custom-width btnClear">Clear</button>
								</div>			
							</div>	
						</form>
					</div>
		 		</div>
		 	
		 	<div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Documents</span>
              	<div class = "searchBar">
            	  	<form class="form-inline">
        				<input type="text" ng-model="search" class="form-control" placeholder="Search">        			
    				</form>
    			</div>              
              </div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID</th>
                              <th>File Name</th>
                              <th>Upload Date</th>
                              <th ng-click="ctrl.sort('length')">Size
                              <span class = "sortingIcon" ng-show="predicate === 'length'" ng-class="{reverse:reverse}"></span>
                              </th>                              
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr dir-paginate ="u in ctrl.filesObj| orderBy:predicate:reverse|filter:search|itemsPerPage:5">
                              <td style="vertical-align: middle"><span ng-bind="u.id"></span></td>
                              <td style="vertical-align: middle"><span ng-bind="u.filename"></span></td>
                              <td style="vertical-align: middle"><span ng-bind="u.uploadDate"></span></td>
                              <td style="vertical-align: middle"><span ng-bind="u.length"></span> Bytes</td>
                              <td style="vertical-align: middle">                             
                              	<button type="button" ng-click="ctrl.remove(u.id)" class="btnRemove btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>                  
              </div>                      
          </div>
          <div class="paginaterDiv">
              <dir-pagination-controls 
       			max-size="5"
       			direction-links="true"
       			boundary-links="true" >
    		  </dir-pagination-controls>              
    	  </div>
    	</div>
    	
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.js"></script>
    	<script src="<c:url value='/static/js/app.js' />"></script>
      	<script src="<c:url value='/static/js/dirPagination.js'/>"></script>
      	<script src="<c:url value='/static/js/repository/file_repository.js' />"></script>
      	<script src="<c:url value='/static/js/controller/file_controller.js' />"></script>		
	</body>
</html>