// // trigger CaseTrigger on Case (before insert,before update,after insert,after update) {
// //     system.debug('We are in the triggers');  
// //     if(trigger.isBefore){
// //         system.debug('We are in the before triggers');
// //         if(trigger.isInsert){
// //             system.debug('We are in the before-Insert triggers');
// //             }
// //         if(trigger.isUpdate){
// //                 system.debug('We are in the before-Update triggers');
// //             }
// //     }
// //      if(trigger.isAfter){   
// //         system.debug('We are in the after triggers');
// //         if(trigger.isInsert){
// //             system.debug('"We are in the after-Insert triggers');
// //             }
// //         if(trigger.isUpdate){
// //                 system.debug('We are in the after-Update triggers');
// //         }
// //     } 
// // }


// // trigger CaseTrigger on Case (before insert,before update,after insert,after update) {
// //     system.debug('We are in the triggers');  
   
// //     if(trigger.isBefore){
// //         system.debug('We are in the before triggers');
// //     }
// //     if(trigger.isBefore && trigger.isInsert){
// //         system.debug('We are in the before-Insert triggers');
// //     }
// //     if(trigger.isBefore && trigger.isUpdate){
// //         system.debug('We are in the before-Update triggers');
// //     }
// //     if(trigger.isAfter){
// //         system.debug('We are in the after triggers');
// //     }
// //     if(trigger.isAfter && trigger.isInsert){
// //         system.debug('"We are in the after-Insert triggers');
// //     }
// //     if(trigger.isAfter && trigger.isUpdate){
// //         system.debug('We are in the after-Update triggers');
// //     }
// // }

// trigger CaseTrigger on Case (before insert,before update,after insert,after update){
    
//     // if (trigger.isAfter && trigger.isInsert) {
//     //     for (case cs : trigger.new) {
//     //         System.debug('Case# ' + cs.caseNumber + ' was created with id ' + cs.id + ' on ' + cs.createdDate);           
//     //     }
//     // }
//     if (trigger.isUpdate && trigger.isBefore) {
//         for (case cs : trigger.new) {
//             if (cs.origin != trigger.oldMap.get(cs.id).origin) {
//                 System.debug('Case origin is changed for ' + cs.caseNumber );
//             }           
//         }        
//     }
//     if

// }
trigger CaseTrigger on Case (before insert,before update,after insert,after update){
    if (trigger.isAfter && trigger.isInsert) {
        CaseTriggerHandler.checkCase(trigger.new);
    }
    if (trigger.isInsert && trigger.isBefore) {
       // CaseTriggerHandler.createCase(trigger.new);
    }

}

