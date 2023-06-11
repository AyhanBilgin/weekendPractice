// trigger ContactTrigger on Contact (before insert,after insert,before update,after update) {
//     if (trigger.isAfter && trigger.isUpdate) {
//         ContactTriggerHandler.mainContactPerson(trigger.new, trigger.oldMap);
//     }





//     // Contact lastName her değiştirildiğinde, Contact Trigger, Contact ın description fieldına aşağıdaki mesajı yazdırsın.
//     // Mesaj : lastName değiştirildi - [OldLastName], [NewLastName] olarak değiştirildi.
//     // Örneğin: Soyadı 'Yilmaz' olan bir kişi 'Erdi' olarak değiştirilirse, aşağıdaki mesaj yazdırılmalıdır:
//     // lastName değiştirildi - Yilmaz, Erdi olarak değiştirildi.
//     // Lütfen unutmayın, Yukarıdaki mesajın yalnızca recordun  LastName fieldi değiştirildiğinde yazdırılması gerekir.
//     // if (trigger.isUpdate && trigger.isBefore ) {
//     //     for (contact eachCon : trigger.new) {
//     //         if (eachCon.lastname != trigger.oldMap.get(eachcon.id).lastName) {
//     //             eachCon.description = 'LastName değiştirildi. ' + trigger.oldMap.get(eachcon.id).lastName + ' , ' + eachCon.lastname + ' olarak değiştirildi.';
//     //         }
//     //     }
//     // }





//     // if (trigger.isInsert && trigger.isBefore) {
//     //     for (contact con : trigger.new) {
//     //         if (con.accountId != null) {
//     //             System.debug(con.lastname + ' contact created WITH Account');
//     //         } else {
//     //             System.debug(con.lastName + ' contact created WITHOUT Account');
//     //         }
//     //     }
//     // }
// }
// // 4. Whenever Contact is created with ‘Account’ then print ‘[Contact Name] contact created
// // WITH Account’. If contact is created without ‘Account’ then print ‘[Contact Name]
// // contact create WITHOUT Account’ examples:
// // Sachin contact created with Account.
// // Jake contact created WITHOUT Account


Trigger ContactTrigger on Contact (after insert) {
    // Get all of the account IDs associated with the contacts being created
    Set<Id> accountIds = new Set<Id>();
    for (Contact c : Trigger.new) {
        accountIds.add(c.AccountId);
    }
    
    // Get the accounts and update their descriptions with the desired text
    List<Account> accountsToUpdate = [SELECT Id, Description FROM Account WHERE Id IN :accountIds];
    for (Account a : accountsToUpdate) {
        a.Description = a.Description + ',bir sen eksiktin';
    }
    
    // Update the accounts
    update accountsToUpdate;
}
