// 1. Create one new field in the contact object ‘Main Contact Person’ (checkbox). When ‘Main Contact Person’ is changed to Checked in contact → Update its account’s FAX field as that contact’s FAX Field. - Example: Account → Name = AccQnC, Fax = 999888777 Contacts → Name = QnC1 , Main Contact Person = false, Fax = 111222333 Contacts → Name = QnC2 , Main Contact Person = false, Fax = 111222444 Contacts → Name = QnC3 , Main Contact Person = false, Fax = 111222555 Contacts → Name = QnC6 , Main Contact Person = false, Fax = 111222666 Update QnC6 contact → Main contact person = true → Auto update account’s FAX to 111222666 (QnC6’s fax value)
public class ContactTriggerHandler {
    public static void mainContactPerson(list<contact> cTriggerNew, Map<Id,contact> cTriggerOldMap) {
        set<id> accIds = new set<id>();
        for (contact eachCon : cTriggerNew) {
            if (eachCon.Main_Contact_Person__c != cTriggerOldMap.get(eachCon.id).Main_Contact_Person__c && eachCon.Main_Contact_Person__c == true && eachCon.accountid != null) {
                accIds.add(eachCon.Accountid);
            }
        }
        if (!accIds.isEmpty()) {
            list<account> acclist = [select id,fax,(select id, fax from contacts where fax != null and  Main_Contact_Person__c = true order by LastModifieddate desc limit 1) from account where id in: accIds];
            for (account eachAcc : acclist) {
                if (eachAcc.contacts.size()>0) {
                    eachAcc.fax = eachAcc.Contacts[0].fax;
                }        
            }
            update acclist;
        }
    }
}

