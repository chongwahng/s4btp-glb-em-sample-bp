using OPEventService as service from '../../srv/service';

annotate service.BusinessPartnerExternals with {
    ID          @title : 'Partner ID';
    fullName    @title : 'Full Name';
    isBlocked   @title : 'Is Blocked?';
    searchTerm1 @title : 'Search Term 1';
    searchTerm2 @title : 'Search Term 2';
};

annotate service.BusinessPartnerExternals with @(UI.LineItem : [
    {
        $Type             : 'UI.DataField',
        Value             : ID,
        ![@UI.Importance] : #High
    },
    {
        $Type : 'UI.DataField',
        Value : fullName,
    },
    {
        $Type : 'UI.DataField',
        Value : isBlocked,
    },
    {
        $Type : 'UI.DataField',
        Value : searchTerm1,
    },
    {
        $Type : 'UI.DataField',
        Value : searchTerm2,
    },
]);

annotate service.BusinessPartnerExternals with @(
    UI.HeaderInfo                  : {
        TypeName       : 'Business Partner',
        TypeNamePlural : 'Business Partners',
        Title          : {Value : fullName},
    },
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : fullName,
            },
            {
                $Type : 'UI.DataField',
                Value : isBlocked,
            },
            {
                $Type : 'UI.DataField',
                Value : searchTerm1,
            },
            {
                $Type : 'UI.DataField',
                Value : searchTerm2,
            },
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'General Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
