trigger Customer1Trigger on Customer__c (before insert,before update,after insert,after update,before delete,after delete) {
    if (trigger.isBefore && trigger.isInsert) {
        Customer1TriggerHandler.createPayment(trigger.new,trigger.oldMap);
    }

    if (trigger.isDelete & trigger.isBefore) {
        Customer1TriggerHandler.deletePayment(trigger.old);
    }
}