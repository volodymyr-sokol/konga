
(function() {
    'use strict';

    angular.module('frontend.services', []);

    // Module configuration
    angular.module('frontend.services')
        .config([
            '$stateProvider',
            function config($stateProvider) {
                $stateProvider
                    .state('services', {
                        parent : 'frontend',
                        url: '/services',
                        data : {
                            activeNode : true,
                            pageName : "Services",
                            pageDescription : "Service entities, as the name implies, are abstractions of each of your own upstream services. Examples of Services would be a data transformation microservice, a billing API, etc.",
                            //displayName : "certificates",
                            prefix : '<i class="material-icons text-primary">perm_identity</i>'
                        },
                        views: {
                            'content@': {
                                templateUrl: 'js/app/services/services.html',
                                controller: 'ServicesController'
                            }
                        }
                    })
            }
        ])
    ;
}());
