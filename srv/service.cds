using {db} from '../db/data-model';

service OPEventService @(requires : 'authenticated-user') {
    @readonly
    entity BusinessPartnerExternals as projection on db.BusinessPartnerExternals;

    @readonly
    entity BusinessPartnerLocals    as projection on db.BusinessPartnerLocals;

    action delete_all();
}
