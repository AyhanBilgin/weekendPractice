public class Customer1TriggerHandler {

    // a-- Whenever a new Customer is created, create following default Payment records - Amount = $0.1, Mode = Online - Amount = $1, Mode = Crypto

    public static void createPayment(list<customer__c> cTriggerNew,Map<Id,customer__c> cTriggerOldMap) {

        list <Payments__c> payList = new list <Payments__c>();
        for (customer__c  customer1 : cTriggerNew) {
            Payments__c Payment1 = new Payments__c();
            Payment1.amount__c = 0.1;
            Payment1.mode__c = 'Online';
            customer1.id = Payment1.Customer1__c;

            Payments__c Payment2 = new Payments__c(amount__c = 1,mode__c = 'Crypto',customer1__c = customer1.id);
            
            payList.add(payment1);
            payList.add(payment2);
        }
        insert payList;
    }

    // b-- Whenever Active Customers are deleted, all the corresponding payments should be deleted.

    // c--Whenever In Active Customers are deleted, all the corresponding online payment records should be deleted.
    public static void deletePayment(List<customer__c> cTriggerOld) {
        set<id > cIds = new set<id>();
        set<id > cIds2 = new set<id>();

        for (customer__c customer1 : cTriggerOld) {
            if (!customer1.active__C == true) {
                cIds.add(customer1.id);
            } else {
                cIds2.add(customer1.id);
            }
        }
        if (!cIds.isEmpty()) {
            List<Payments__c>  payList = [select id from Payments__c where Customer1__c = : cIds];
            if (!payList.isEmpty()) {
                delete payList;
            }     
        }
        if (!cIds2.isEmpty()) {
            List<Payments__c>  payList2 = [select id from Payments__c where mode__c = 'Online' AND Customer1__c = : cIds2];
            if (!payList2.isEmpty()) {
                delete payList2;
            }     
        }
    }




}