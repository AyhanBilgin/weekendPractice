trigger OpportunityTrigger on opportunity (before insert,after insert,before update,after update) {
    if (trigger.isInsert && trigger.isAfter) {
        for (opportunity opp : trigger.new) {
            System.debug(opp.name + ' - ' + opp.closeDate + ' - ' + opp.amount);
        }
        System.debug('the total number of opportunities : ' + trigger.new.size());
    }

    if (trigger.isInsert && trigger.isAfter) {
        for (opportunity opp2 : trigger.new) {
            System.debug('Opportunity name : ' + opp2.name + ' ,StageName : ' + opp2.StageName + ' ,value of description  : ' + opp2.description);
        }
    }

    if (trigger.isUpdate && trigger.isAfter) {
        for (opportunity eachOpp : trigger.new) {
            System.debug('old Opportunity name : ' + trigger.oldMap.get(eachOpp.id).name + ' ,old Amount ' + trigger.oldMap.get(eachOpp.id).amount );
            System.debug('new Opportunity name : ' + eachOpp.name + ' ,new Amount ' + eachOpp.amount );
        }
    }
    if (trigger.isUpdate && trigger.isAfter) {
        for (opportunity opp : trigger.new) {
            if (opp.stageName != trigger.oldMap.get(opp.id).stageName ) {
                System.debug('Opportunity name : ' + opp.name + ' , description : ' + opp.description);
            }
        }
    }


}
// 5. When an opportunity is created show a debug message ([OpportunityName] –
// [CloseDate] – [Amount]) for each opportunity and print the total number of
// opportunities created in the transaction. For example: Demo Opportunity – 20/10/2022
// – 40000.
// 6. When opportunity is created print the StageName, value of description field and
// opportunity name.
// 7. Print the new and old field values for (Opportunity Name and Amount) fields whenever
// an opportunity is updated.
// 8. When the StageName of an opportunity is updated, then print the value of description
// field and opportunity name.