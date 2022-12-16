using {API_BUSINESS_PARTNER} from './API_BUSINESS_PARTNER';

extend service API_BUSINESS_PARTNER with {
    @topic : 'sap.s4.beh.businesspartner.v1.BusinessPartner.Created.v1'
    event BusinessPartner.Created {
        BusinessPartner : API_BUSINESS_PARTNER.A_BusinessPartner:BusinessPartner
    }

    @topic : 'sap.s4.beh.businesspartner.v1.BusinessPartner.Changed.v1'
    event BusinessPartner.Changed {
        BusinessPartner : API_BUSINESS_PARTNER.A_BusinessPartner:BusinessPartner
    }
}
