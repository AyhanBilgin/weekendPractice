list<case> caseList = new list<case>();
for (integer i=1 ; i <= 5;i++){
    case cs = new case();
    cs.status = 'New';
    cs.origin = 'Phone';
    caseList.add(cs);
}
insert caseList;

account acc = [select id,name from account limit 1];
list<contact> conList = new list<contact>();
for (integer i=1 ; i <= 5;i++){
    contact cont = new contact();
    cont.LastName = 'Contact ' + i;
    if(i > 3 ){
        cont.AccountId = acc.id; 
    }
    conList.add(cont);
}
insert conList;

list<opportunity> oppList = new list<opportunity>();
for (integer i=1 ; i <= 5;i++){
    opportunity opp = new opportunity();
    opp.CloseDate = date.newInstance(2023, 12, 01);
    opp.StageName = 'Prospecting';
    opp.name = 'Opportunity ' + i;
    oppList.add(opp);
}
insert oppList;
