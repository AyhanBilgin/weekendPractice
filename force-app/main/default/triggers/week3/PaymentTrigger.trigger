trigger PaymentTrigger on Payments__c (before insert,before update,after insert,after update,before delete,after delete) {
    if (trigger.isAfter && trigger.isInsert) {
        PaymentTriggerHandler.insertMethod(trigger.new);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        PaymentTriggerHandler.updateMethod(trigger.new,trigger.oldMap);
    }
    if (trigger.isAfter && trigger.isDelete) {
        PaymentTriggerHandler.deleteMethod(trigger.old);
    }

}