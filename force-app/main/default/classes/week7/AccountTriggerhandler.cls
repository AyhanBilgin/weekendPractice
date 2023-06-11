public class AccountTriggerhandler {
    public static void updateRating(list<account> accTriggerNew,list<account> accTriggerOld,map<id,account> accTriggerNewMap,map<id,account> accTriggerOldMap) {
        // 1. Allow user to update rating of account record to HOT only if the Account has 3 opportunity which is not closed. If user tries to update account record’s rating field to HOT which does not have 3 open opportunity then throw error: ‘This account CANNOT be HOT. Okay?’
        set<id>  accIds = new set<id>();
        for (account eachAcc : accTriggerNew) {
            if (eachAcc.rating == 'Hot') {
                accIds.add(eachAcc.id);
            }
        }
        if (!accIds.isEmpty()){
            list<account> accList = [select id,name ,(select id,name,stageName from opportunities where stagename not in ('Closed Won', 'Closed Lost')) from account where id = : accIds];
            for (account acc : accList) {
                if (acc.opportunities.size() < 3) {
                    accTriggerNewMap.get(acc.id).addError('This account CANNOT be HOT. Okay?');
                }
            }
        }
    }
    // 2. When the Annual revenue value of an Account is reduced from the previous value then Throw error with the following message: a. ‘Annual Revenue for an account cannot be reduced’. And do not allow the user to save the record.

    public static void accountAnnualRevenue(list<account> accTriggerNew,list<account> accTriggerOld,map<id,account> accTriggerNewMap,map<id,account> accTriggerOldMap) {
        for (account eachAcc : accTriggerNew) {
            if (eachAcc.annualRevenue < accTriggerOldMap.get(eachAcc.id).annualRevenue ) {
                eachAcc.annualRevenue.addError('Annual Revenue for an account cannot be reduced');
            }
        }
    }

    // 3. Whenever a New Account Record is created, an associated Contact Record must be created automatically. Contact record fields as below: - Account name as Contact last name - Account phone as contact phone

    public static void accountContact(list<account> accTriggerNew,list<account> accTriggerOld,map<id,account> accTriggerNewMap,map<id,account> accTriggerOldMap) {
        
        list<contact> conList = new list<contact>();
        for (account eachAcc : accTriggerNew) {
            contact con = new contact();
            con.Accountid = eachAcc.id;
            con.LastName = eachAcc.Name;
            con.phone = eachAcc.phone;
            conList.add(con);
        }
        if (!conList.isEmpty()) {
            insert conList;
        }
        
    }

    // 4. Write a trigger on the Account when the Account is updated, check all opportunities related to the account. Update all Opportunity Stage to close lost if stage name not already set to closed won.

    public static void updateAccount(list<account> accTriggerNew,list<account> accTriggerOld,map<id,account> accTriggerNewMap,map<id,account> accTriggerOldMap) {
        set<id> accountIds = new set<id>();
        for (account eachAcc : accTriggerNew) {
            accountIds.add(eachAcc.id);
        }
        
        list<opportunity> oppList = [select id,stagename from Opportunity where accountId in : accountIds and stagename not in ('Closed Won','Closed Lost')];
            
        for (opportunity eachOpp : oppList) {
                eachOpp.stagename ='Closed Lost';
        }
        if (!oppList.isEmpty()){
                update oppList;
        } 
    }
    // 5. Whenever an Account phone number is modified, update all the contacts of the Account as follows: - Contacts otherPhone as Old phone no of account - Contacts mobilePhone as New phone no of Account.
    public static void updateContactPhone(list<account> accTriggerNew,list<account> accTriggerOld,map<id,account> accTriggerNewMap,map<id,account> accTriggerOldMap) {
        set<id> accountIds = new set<id>();
        for (account eachAcc : accTriggerNew) {
            if (eachAcc.phone != accTriggerOldMap.get(eachAcc.id).phone) {
                accountIds.add(eachAcc.id);
            }           
        }
        if (!accountIds.isEmpty()) {
            list<contact> conList = [select id,accountid from contact where AccountId in :accountIds];
            if (!conList.isEmpty()) {
                for (contact eachCon : conList) {
                    eachCon.otherPhone = accTriggerOldMap.get(eachCon.accountid).phone;
                    eachCon.mobilePhone = accTriggerNewMap.get(eachCon.AccountId).phone;
                }
                update conList;                
            }
        }
    }

    // Aynı isimde birden fazla Account oluşmasına müsade etmeyen bir trigger (triggerHandlerClass) tasarlayınız.
    public static void accountDuplicate(list<account> accTriggerNew) {
        set<string> accNameSet = new set<string>();
        for (account eachAcc : accTriggerNew) {
            accNameSet.add(eachAcc.name);
        }
        list<account> accList = [select id,name from account where name =: accNameSet ];
    }
}