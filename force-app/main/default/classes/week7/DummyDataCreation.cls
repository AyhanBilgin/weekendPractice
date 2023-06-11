public class DummyDataCreation {
    public static void topOpp10() {
        list<opportunity> oppList = [select id,name ,amount ,description from opportunity order by amount desc  nulls last limit 10];
        
        for (opportunity eachOpp : oppList) {    
            eachOpp.description = 'This is one of the top 10 opportunities. Please work on this properly'; 

        }
        update oppList;
    }
    public static list<opportunity> oppAcc(integer n,id accId) {
        
        account acc = [select id,name ,annualRevenue from account where id = : accId];
        list<opportunity> oppList = new list<opportunity>();
        if (n <= 0 ) {
            System.debug('Please tell us how many opportunities needs to be created');
        } else {

            for (Integer i = 0; i < n; i++){
                opportunity opp = new opportunity();
                opp.closedate= date.today().addYears(3);
                opp.stageName = ' Prospecting';
                if (acc.annualRevenue != null) {
                    opp.amount = acc.annualrevenue / n;                 
                }
                opp.name = acc.name;
                opp.accountid = acc.id;
                oppList.add(opp);
            }
            insert oppList;
        }
        return oppList;
    }
    public static void addContact() {
        list <account> accList = [select id,name, (select id from contacts)from account where id not in (select accountid from contact)];
        list<contact> conList = new list<contact>();
        for (account eachAcc : accList) {
            contact con = new contact();
            con.lastname = eachAcc.Name;
            con.accountid = eachAcc.id;
            conList.add(con);
        }
        insert conList;
    }
    public static void deleteOpp() {
        List<Opportunity> oppList = [select id,name ,amount ,closedate, stageName from opportunity where amount < 20000 and stagename = 'closed lost'];
        delete oppList;
    }

    public static list<account> createNAccount(integer n) {
        list<account> accList = new  list<account>();
        for (Integer i = 0; i < n; i++) {
            account acc = new account();
            acc.Name = 'Account '  + i;
            acc.Rating = 'Hot';
            acc.phone = '131116';
            acc.shippingCountry = ' Turkey ';
            acc.billingCountry = ' Turkey ';
            accList.add(acc);
        }
        insert accList;
        return accList;
    }
    public static list<contact> createNContact(integer n, list<account> listAcc) {
        list<contact> conList = new list<contact>();
        for (account acc : listAcc) {
            for (Integer i = 0; i < n; i++) {
                contact newCont = new contact();
                newCont.firstName = 'Nurullah';
                newCont.lastName = 'ParaBabasi';
                newCont.accountid = acc.id;
                newCont.phone = '4646616';
                newCont.mailingCity = 'Ankara';
                newCont.otherCity = 'Istanbul';
                conList.add(newCont);
            }
        }
        insert conList;
        return conList;
    }
    public static list<case> createCase(list<contact> listCont) {
        list<Case> caseList = new  list<Case>();

        for (contact eachCon : listCont) {
            case newCase = new case();
            newCase.contactId = eachCon.id;
            newCase.accountId = eachCon.AccountId;
            newCase.subject = 'Assignment';
            newCase.status = 'New';
            newCase.origin = 'Web';
            caseList.add(newCase);
        }
        insert caseList;
        return caseList;
    }

}