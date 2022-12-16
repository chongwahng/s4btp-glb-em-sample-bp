sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cng/businesspartnersloc/test/integration/FirstJourney',
		'cng/businesspartnersloc/test/integration/pages/BusinessPartnerLocalsList',
		'cng/businesspartnersloc/test/integration/pages/BusinessPartnerLocalsObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinessPartnerLocalsList, BusinessPartnerLocalsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cng/businesspartnersloc') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBusinessPartnerLocalsList: BusinessPartnerLocalsList,
					onTheBusinessPartnerLocalsObjectPage: BusinessPartnerLocalsObjectPage
                }
            },
            opaJourney.run
        );
    }
);