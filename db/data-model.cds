namespace db;

using {
    managed,
    cuid
} from '@sap/cds/common';

using {API_BUSINESS_PARTNER as bupa} from '../srv/external/API_BUSINESS_PARTNER.csn';

entity BusinessPartnerExternals as projection on bupa.A_BusinessPartner {
    key BusinessPartner          as ID,
        BusinessPartnerFullName  as fullName,
        BusinessPartnerIsBlocked as isBlocked,
        SearchTerm1              as searchTerm1,
        SearchTerm2              as searchTerm2
}

entity BusinessPartnerLocals : managed, cuid {
    businessPartnerId        : String;
    businessPartnerFullName  : String;
    businessPartnerIsBlocked : Boolean;
    searchTerm1              : String;
    searchTerm2              : String;
}
