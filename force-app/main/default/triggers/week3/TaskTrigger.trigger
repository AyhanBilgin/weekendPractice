trigger TaskTrigger on Task__c (before insert, after update) {
    if (trigger.isAfter && trigger.isUpdate) {
        TaskTriggerHandler.updateStatus(trigger.new, trigger.oldMap);
    }
}