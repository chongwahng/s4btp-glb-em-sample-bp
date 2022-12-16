sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'cng.businesspartnersloc',
            componentId: 'BusinessPartnerLocalsObjectPage',
            entitySet: 'BusinessPartnerLocals'
        },
        CustomPageDefinitions
    );
});