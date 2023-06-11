public class AccConAndOppOperations {
// Write the logic to fetch and return all the accounts. Include account name, annual revenue, type, and source of account.
    public static List<Account> fetchAcc() {
        List<Account> accList = [SELECT name, AnnualRevenue, Type, AccountSource from Account];
        return accList;
    }
// 2. Find all the opportunities which have Lead Source as 'Web' and Stage as 'Closed Lost'. Make it dynamic so that it works for other stages and Lead sources as well.
public static void fetchOpp(String leadS, String stageN) {
    //List<Opportunity> oppList = [SELECT id, name, LeadSource, StageName from Opportunity WHERE (LeadSource = 'Web' and StageName = 'Closed Lost')];
    List<Opportunity> oppList = [SELECT id, name, LeadSource, StageName from Opportunity WHERE (LeadSource = :leadS and StageName = :stageN)];
    System.debug('Fetch Opp' + oppList);
}
// 3. Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the Opportunity Name and Amount for the related 'Closed Won' opportunities. Each opportunity record should be printed in a different line.

public static void fetchAcc2() {
    List<Account> accList2 = [SELECT id, name, AnnualRevenue, Type, (SELECT name, Amount, StageName FROM Opportunities WHERE StageName= 'Closed Won') FROM Account WHERE Type = 'Customer - Direct'];

    for (Account eachAcc : accList2) {
        System.debug('Account Name : ' + eachAcc.name +  ' Annual Revenue ' + eachAcc.AnnualRevenue);
        for (Opportunity eachOpp : eachAcc.Opportunities) {
            System.debug('Opportunity of Account ' + eachAcc.Name + ' is' + eachOpp);
        }
    }
}
// 4. Write a method which should return the account record after creating it. Take Name, Annual Revenue, Type as input parameters and populate the values in the account record. If Name is not provided, then do not create the account and show a message like Account without name cannot be created.

public static Account createAcc(String Name, Decimal AnnualRevenue, String Type) {
    Account newAcc = new Account();
    if (String.isBlank(name)) {
        System.debug('Account can not be created without a name...');
    } else {
        newAcc.Name = Name;
        newAcc.AnnualRevenue = AnnualRevenue;
        newAcc.Type = Type; 
        
        insert newAcc;
  
    }
    return newAcc;
}
public static Decimal sumOfOppAmount(){
    list<opportunity> oppList = [select id,name ,stageName,amount from opportunity  where amount != null and stageName = 'closed won'];
    decimal totalAmount = 0;
    for (opportunity eachOpp : oppList){
        totalAmount += eachOpp.amount;

    }
    return totalAmount;
}
}