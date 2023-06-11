@isTest
public class QueueableAssignmentTest {
    @isTest
    public static void QueueableAssignmentTest() {

        test.startTest();
        system.enqueueJob(new QueueableAssignment());
        test.stopTest();

        list<case> csList = [select id,status,origin from case];
        for (case cs : csList) {
            assert.areEqual('New',cs.status);
            assert.areEqual('Email',cs.origin);
        }
        assert.areEqual(1,csList.size());
    
    }
}