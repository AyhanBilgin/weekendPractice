public class OpportunityTriggerHandler22 {

    // Please Note: Above updates should happen whenever any of the following event occurs: i. Amount field is Updated at Opportunity level. ii. Opportunity stageName is changed. iii. Opportunity is reparented i.e AccountId field value is changed. iv. A new Opportunity is created and tagged to an account. v. An Opportunity is deleted or undeleted

    public static void insertAndUndeleteOpp(list<opportunity> oppTriggerNew) {
        set<id> accIds = new set<id>();
        for (opportunity eachOpp : oppTriggerNew) {
            if (eachOpp.accountid != null && eachOpp.amount != null ) {
                accIds.add(eachOpp.accountId);
            }
        }
        if (!accIds.isEmpty()) {
            updateHighestAmountOpportunity(accIds);
            updateTargetAmountAchievedOppName(accIds);
            updateTotalAmountGenerated(accIds);
        }
    }
    public static void updateOpps(list<opportunity> oppTriggerNew,Map<Id,opportunity> oppTriggerOldMap) {
        set<id> accIds = new set<id>();
        for (opportunity eachOpp : oppTriggerNew) {
            if (eachOpp.amount != oppTriggerOldMap.get(eachOpp.id).amount || eachOpp.stagename != oppTriggerOldMap.get(eachOpp.id).stageName || eachOpp.accountId != oppTriggerOldMap.get(eachOpp.id).accountId) {
                accIds.add(eachOpp.accountId);
                accIds.add(oppTriggerOldMap.get(eachOpp.id).accountId);
            }
        }
        if (!accIds.isEmpty()) {
            updateHighestAmountOpportunity(accIds);
            updateTargetAmountAchievedOppName(accIds);
            updateTotalAmountGenerated(accIds);
        }
         
    }

    public static void deleteOpps(list<opportunity> oppTriggerOld) {
        set<id> accIds = new set<id>();
        for (opportunity eachOpp : oppTriggerOld) {
            if (eachOpp.accountid != null && eachOpp.amount != null) {
                accIds.add(eachOpp.accountid);
            }
        }
        if (!accIds.isEmpty()) {
            updateHighestAmountOpportunity(accIds);
            updateTargetAmountAchievedOppName(accIds);
            updateTotalAmountGenerated(accIds);
        }
    }
    // A. Update the "Highest Amount Opportunity Name" field at Account level with the opportunity Name which have the Highest amount among the opportunities related to the account.
    public static void updateHighestAmountOpportunity(set<id> accIds) {

        list<account> accList = [select id,Highest_Amount_Opportunity_Name__c,(select id,name,amount  from opportunities where amount != null order by amount desc limit 1) from account where id in : accIds];

        for (account eachAcc  : accList) {
            if (eachAcc.opportunities.size()>0) {
                eachAcc.Highest_Amount_Opportunity_Name__c = eachAcc.opportunities[0].name;
            } else {
                eachAcc.Highest_Amount_Opportunity_Name__c = null;
            }
            accList.add(eachAcc);
        }
        update accList;
    }

    // B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the Closed Won Opportunity Name. Populate the opportunity name which have highest value in Amount field, and it should be more than 'Target Amount' field value at account.

    public static void updateTargetAmountAchievedOppName(set<id> accIds) {
        list<account> accList = [select id,Target_Amount_Achieved_Opportunity_Name__c,Target_Amount__c,(select id,name,amount ,stagename from opportunities where amount != null and  stageName='Closed Won' order by amount desc limit 1) from account where id in : accIds];
        for (account eachAcc  : accList) {
            if (eachAcc.opportunities.size()>0 && eachAcc.opportunities[0].amount >= eachAcc.Target_Amount__c) {
                eachAcc.Target_Amount_Achieved_Opportunity_Name__c = eachAcc.opportunities[0].name;
            } else {
                eachAcc.Target_Amount_Achieved_Opportunity_Name__c = null;
            }
        }
        update accList;
    }

    // C. Update the 'Total Amount Generated' at Account with the total of Amount for all the closed Won Opportunities related to an Account.

    public static void updateTotalAmountGenerated(set<id> accIds) {
        list<account> accList = [select id,Total_Amount_Generated__c,(select id,name,amount,stageName from opportunities where amount != null and  stageName='Closed Won') from account where id in : accIds];
        for (account eachAcc : accList) {
            decimal totalAmnt = 0;
            if (eachAcc.opportunities.size()>0) {
               for (opportunity eachOpp : eachAcc.opportunities) {
                    totalAmnt += eachOpp.amount;
               }
               eachAcc.Total_Amount_Generated__c = totalAmnt;
            } else {
                eachAcc.Total_Amount_Generated__c = null;
            }
            
        }
        update accList;
        
    }

}