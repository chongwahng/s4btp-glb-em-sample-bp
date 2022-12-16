const cds = require('@sap/cds')

// mock events for s4
module.exports = cds.service.impl(async function() {
    this.after('INSERT', data => {
        const { BusinessPartner } = data;
        return this.emit('BusinessPartner.Created', { BusinessPartner });
    });

    this.after('UPDATE', data => {
        const { BusinessPartner } = data;
        return this.emit('BusinessPartner.Changed', { BusinessPartner });
    });
});