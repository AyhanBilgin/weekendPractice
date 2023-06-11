trigger LeadTrigger on Lead (before insert,after insert) {
    if (trigger.isInsert && trigger.isAfter) {
        for (lead eachLead : trigger.new) {
            if (eachLead.leadSource == 'Web') {
                System.debug('Rating should be Cold');
            } else {
                System.debug('Rating should be hot');
            }
        }
    }
}
