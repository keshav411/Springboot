'use strict';

App.factory('FileService', ['$http', '$q', function($http,$q){
		return {
			
			getAllDocuments : function(){
				return $http.get('http://localhost:8080/Api/document')
					.then(
							function(response){
								return response.data;
							},
							function(errResponse){
								return $q.reject(errResponse);
							}
					);
			},
			
			deleteDocument : function(id){
				return $http.delete('http://localhost:8080/Api/document/delete/id/' +id)
					.then(
							function(response){
								return response.data;
							},
							function(err) {
								return $q.reject(err);
							}							
					);					
			},
			
			insertDocument : function(file) {
				return $http.post('http://localhost:8080/Api/document/insert/',file)
					.then(
							function(response){
								return response.data;
							},
							function(errResponse){
								console.error('Error inserting file');
								return $q.reject(errResponse);
							}
					);
			}
		};
}]);