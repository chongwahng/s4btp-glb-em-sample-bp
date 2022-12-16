module.exports = async function (srv) {
    const cds = require('@sap/cds')

    const { BusinessPartnerLocals, BusinessPartnerExternals } = cds.entities;
    const bupaSrv = await cds.connect.to('API_BUSINESS_PARTNER')

    const messaging = await cds.connect.to('messaging')

    messaging.on('*', async msg => { console.log(msg) })

    this.on('READ', 'BusinessPartnerExternals', async (req) => {
        return bupaSrv.run(req.query)
    })

    bupaSrv.on('BusinessPartner.Changed', async msg => {
        console.log('Received S4HANA Business Event')
        console.log(msg)

        let query = ''
        let result = ''

        const bupaEntity = await bupaSrv.run(SELECT.one(BusinessPartnerExternals).where({ ID: msg.data.BusinessPartner }))

        if (!bupaEntity) {
            console.log(`${msg.data.BusinessPartner} does not exist in the target system`)
        } else {
            console.log(bupaEntity)

            query = SELECT
                .one(BusinessPartnerLocals)
                .where({ businessPartnerId: msg.data.BusinessPartner })
            result = await cds.run(query)

            console.log(`result selecting BusinessPartnerLocals ${result}`)

            if (!result) {
                query = INSERT
                    .into(BusinessPartnerLocals)
                    .entries({
                        businessPartnerId: bupaEntity.ID,
                        businessPartnerFullName: bupaEntity.fullName,
                        businessPartnerIsBlocked: bupaEntity.isBlocked,
                        searchTerm1: bupaEntity.searchTerm1,
                        searchTerm2: bupaEntity.searchTerm2
                    })
                result = await cds.run(query)
                console.log('INSERT block')
                console.log(result)
            } else {
                query = UPDATE(BusinessPartnerLocals)
                    .set({
                        businessPartnerFullName: bupaEntity.fullName,
                        businessPartnerIsBlocked: bupaEntity.isBlocked,
                        searchTerm1: bupaEntity.searchTerm1,
                        searchTerm2: bupaEntity.searchTerm2
                    })
                    .where({ businessPartnerId: bupaEntity.ID })
                result = await cds.run(query)
                console.log('UPDATE block')
                console.log(result)
            }
        }
    })

    bupaSrv.on('BusinessPartner.Created', async msg => {
        console.log('Received S4HANA Business Event')
        console.log(msg)

        let query = ''

        const bupaEntity = await bupaSrv.run(SELECT.one(BusinessPartnerExternals).where({ ID: msg.data.BusinessPartner }))

        if (!bupaEntity) {
            console.log(`${msg.data.BusinessPartner} does not exist in the target system`)
        } else {
            query = INSERT
                .into(BusinessPartnerLocals)
                .entries({
                    businessPartnerId: bupaEntity.ID,
                    businessPartnerFullName: bupaEntity.fullName,
                    businessPartnerIsBlocked: bupaEntity.isBlocked,
                    searchTerm1: bupaEntity.searchTerm1,
                    searchTerm2: bupaEntity.searchTerm2
                })
            await cds.run(query)
        }
    })

    srv.on('delete_all', async (req) => {
        await cds.run(DELETE.from(BusinessPartnerLocals))
    })
}