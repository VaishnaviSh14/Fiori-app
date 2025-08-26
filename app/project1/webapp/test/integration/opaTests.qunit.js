sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/ConfigProductsList',
		'project1/test/integration/pages/ConfigProductsObjectPage',
		'project1/test/integration/pages/ProductObjectPage'
    ],
    function(JourneyRunner, opaJourney, ConfigProductsList, ConfigProductsObjectPage, ProductObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheConfigProductsList: ConfigProductsList,
					onTheConfigProductsObjectPage: ConfigProductsObjectPage,
					onTheProductObjectPage: ProductObjectPage
                }
            },
            opaJourney.run
        );
    }
);