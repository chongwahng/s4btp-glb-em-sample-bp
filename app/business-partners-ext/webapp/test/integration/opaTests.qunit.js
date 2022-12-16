sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cng/businesspartnersext/test/integration/FirstJourney',
		'cng/businesspartnersext/test/integration/pages/BusinessPartnerExternalsList',
		'cng/businesspartnersext/test/integration/pages/BusinessPartnerExternalsObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinessPartnerExternalsList, BusinessPartnerExternalsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cng/businesspartnersext') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBusinessPartnerExternalsList: BusinessPartnerExternalsList,
					onTheBusinessPartnerExternalsObjectPage: BusinessPartnerExternalsObjectPage
                }
            },
            opaJourney.run
        );
    }
);