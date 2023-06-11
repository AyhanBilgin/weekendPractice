// trigger AccountTrigger on Account (before insert,after insert,before update,after update) {
//     // 1. When the Annual revenue value of an Account is reduced from the previous value then print the following message: ‘Annual Revenue for an account cannot be reduced’.
//     if (trigger.isUpdate && trigger.isAfter) {
//         for (account acc : trigger.new) {
//             if (acc.annualRevenue < trigger.oldMap.get(acc.id).annualRevenue ) {
//                 //System.debug('Annual Revenue for an account cannot be reduced.');
//                 //acc.addError('Annual Revenue for an account cannot be reduced.');
//                 acc.annualRevenue.addError('Annual Revenue for an account cannot be reduced.');
//             }
//         }
//     }

//     if (trigger.isUpdate && trigger.isAfter) {
//         for (account  acc : trigger.new) {
//             if (acc.Rating == 'Hot') {
                
//             }
//         }
//     }
//     // 2. When Account’s rating field is updated to HOT, get count of opportunity in this account. If the count of opportunity is MORE than 3 and Rating of account is updated to HOT print following… Account is NOW HOT!And it has 4 opportunities.
// // }

trigger AccountTrigger on Account (before insert,after insert,before update,after update){

//     if (trigger.isBefore && trigger.isInsert) {
//         AccountTriggerhandler.accountDuplicate();
//     }

//     Bir Account update edildiğinde Annual Revenue değişmişse  Description fieldine aradaki farkı yazsın. şu kadar arttı veya şu kadar azaldı.

//     if (trigger.isUpdate && trigger.isBefore) {
//         for (account eachAcc : trigger.new) {
//             decimal fark = eachAcc.annualrevenue - trigger.oldMap.get(eachAcc.id).annualRevenue;
            
//             if ( eachAcc.annualrevenue != trigger.oldMap.get(eachAcc.id).annualRevenue ) {
//                 if (fark < 0) {
//                     eachAcc.description = 'Annual revenue ' + (fark * (-1) )+ ' kadar azaldi.';
//                 } else {
//                     eachAcc.description = 'Annual revenue ' + fark  + ' kadar artti.';
//                 }
                    
//                 }         
            
//         }
//     }



//     if (trigger.isUpdate && trigger.isBefore) {
//         AccountTriggerHandler.updateRating(trigger.new,trigger.old,trigger.newMap,trigger.oldMap); 
//         AccountTriggerHandler.accountAnnualRevenue(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);         
//     }
//     if (trigger.isAfter && trigger.isInsert) {
//         AccountTriggerHandler.accountContact(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
//     }
//     if (trigger.isAfter && trigger.isUpdate) {
//         //AccountTriggerHandler.updateAccount(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
//         AccountTriggerhandler.updateContactPhone(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
//     // }
}