@isTest
public class BatchAssignment1Test {
    @testSetup
    private static void makedata() {
        list<opportunity> oppList = new list<opportunity>();
        for (Integer i = 1; i <= 500; i++) {
            opportunity opp = new opportunity();
            opp.name = 'Opportunity ' + i;
            if (i<=200) {
                opp.stageName = 'Closed Lost';
                opp.closeDate = date.today().addDays(10);
            } else if(i<400){
                opp.stageName = 'Closed Won';
                opp.closeDate = date.today().addDays(20);             
            } else {
                opp.stageName = 'Prospecting';
                opp.closeDate = date.today().addDays(30);
            }
            oppList.add(opp);
        }
        insert oppList;
    }

    @isTest
    private static void batch1Test() {
        test.startTest();
        BatchAssignment1 ba1 = new BatchAssignment1();
        Database.executeBatch(ba1,500);
        test.stopTest();

        list<opportunity> oppList = [select id,stageName ,name from opportunity where stageName = 'Closed Lost' ];
        assert.areEqual(0,oppList.size());

        list<opportunity> oppList2 = [select id,stageName ,name from opportunity ];
        assert.areEqual(300,oppList2.size());


    }
}