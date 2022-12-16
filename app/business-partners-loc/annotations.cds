using OPEventService as service from '../../srv/service';

annotate service.BusinessPartnerLocals with {
    ID                       @UI.Hidden;
    businessPartnerId        @title : 'Partner ID';
    businessPartnerFullName  @title : 'Full Name';
    businessPartnerIsBlocked @title : 'Is Blocked?';
    searchTerm1              @title : 'Search Term 1';
    searchTerm2              @title : 'Search Term 2';
};

annotate service.BusinessPartnerLocals with @(UI.LineItem : [
    {
        $Type  : 'UI.DataFieldForAction',
        Label  : 'Delete ALL',
        Action : 'OPEventService.EntityContainer/delete_all',
    },
    {
        $Type : 'UI.DataField',
        Value : businessPartnerId,
    },
    {
        $Type : 'UI.DataField',
        Value : businessPartnerFullName,
    },
    {
        $Type : 'UI.DataField',
        Value : businessPartnerIsBlocked,
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

annotate service.BusinessPartnerLocals with @(
    UI.HeaderInfo                  : {
        TypeName       : 'Business Partner',
        TypeNamePlural : 'Business Partners',
        Title          : {Value : businessPartnerFullName},
    },
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : businessPartnerId,
            },
            {
                $Type : 'UI.DataField',
                Value : businessPartnerFullName,
            },
            {
                $Type : 'UI.DataField',
                Value : businessPartnerIsBlocked,
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
    UI.FieldGroup #Admin           : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {Value : createdBy},
            {Value : createdAt},
            {Value : modifiedBy},
            {Value : modifiedAt}
        ]
    },
    UI.Facets                      : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneratedFacet1',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Admin Information',
            Target : '@UI.FieldGroup#Admin'
        }
    ]
);
