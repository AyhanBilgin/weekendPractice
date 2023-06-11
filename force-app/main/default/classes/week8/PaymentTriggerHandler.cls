public class PaymentTriggerHandler {
    // d-- Create a field in Customer object called ‘Total Amount’ - this field should be auto-updated when payments are created/updated/deleted (NO UNDELETE SCENARIO).

    public static void insertMethod(list<payments__c> payTriggerNew) {
        set<id> cIds = new set<id>();
        for (payments__C pay : payTriggerNew) {
            if (pay.amount__c != null && pay.Customer1__c != null) {
                cIds.add(pay.Customer1__c);
            }
        }
        if (!cIds.isEmpty()) {
            totalAmount(cIds);
        }
    }

    public static void updateMethod(list<payments__C> payTriggerNew,Map<Id,payments__C> payTriggerOldMap) {
        set<id> cIds = new set<id>();
        for (payments__C pay : payTriggerNew) {
            payments__C oldPay = payTriggerOldMap.get(pay.id);
            if (pay.amount__c != oldPay.amount__c || pay.Customer1__c != oldPay.Customer1__c) {
                cIds.add(pay.Customer1__c);
                cIds.add(oldPay.Customer1__c);
            }
        }
        if (!cIds.isEmpty()) {
            totalAmount(cIds);
        }
    }

    public static void deleteMethod(list<payments__C> payTriggerOld) {
        set<id> cIds = new set<id>();
        for (payments__C pay : payTriggerOld) {
            if (pay.Amount__c != null && pay.Customer1__c != null) {
                cIds.add(pay.Customer1__c);
                cIds.add(Pay.Customer1__c);
            }
        }
        if (!cIds.isEmpty()) {
            totalAmount(cIds);
        }
    }


    public static void totalAmount(set<id> cIds) {
        List<customer__c>  cList = [select id ,(select id,amount__c from Payments__r where amount__c != null) from customer__c where Customer1__c in : cIds];
        for (customer__c customer1 : cList) {
            decimal total = 0;
            for (payments__C payment1 : customer1.Payments__r) {
                total += payment1.amount__c;
            }
            customer1.total_amount__c = total;
        }
        update cList;
    }
}