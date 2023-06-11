trigger OpportunityTrigger on Opportunity (before insert,before update,after insert,after update,before delete,after undelete) {
    if (trigger.isAfter) {
        if (trigger.isInsert || trigger.isUndelete) {
            OpportunityTriggerHandler22.insertAndUndeleteOpp(trigger.new);
        }
        if (trigger.isUpdate) {
            OpportunityTriggerHandler22.updateOpps(trigger.new, trigger.oldMap);
        }
        if (trigger.isDelete) {
            OpportunityTriggerHandler22.deleteOpps(trigger.old);
        }
    }
}