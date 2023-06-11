@isTest
public class BatchAssignment3Test {
    @isTest
    private static void batchAssignment3Test () {
        list<case> caseList = new list<case>();
        for (Integer i = 0; i < 50; i++) {
            case c = new case();
            c.subject = 'test subject ' + i;
            c.origin = 'Web';
            if (i<=25) {
                c.status = 'New';    
            } else {
                c.status = 'Closed';
            }
            caseList.add(c);
        }
        insert caseList;

        test.startTest();
        BatchAssignment3 ba3 = new BatchAssignment3();
        Database.executeBatch(ba3,50);
        test.stopTest();

        list<task> taskList = [select id,subject,status,description from task];
        assert.areEqual(26,taskList.size());
        for (task t : taskList) {
            assert.areEqual('Critical action needed',t.subject);
            assert.areEqual('Complete fast',t.description);
            assert.areEqual('In Progress',t.status);

        }
    }
}