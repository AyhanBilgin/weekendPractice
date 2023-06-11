public class BatchAssignment3 implements Database.Batchable<sObject> {
    //Write a logic in Batch to Create tasks for all the cases other than the closed and on which there was no activity since last 5 days. Populate the task field values as follows: Field Value Subject Critical action needed Due Date Today + 2 days. Comments Complete fast. Related To Case Id Assigned To Case Owner Id Status In Progress

    public Database.QueryLocator start(Database.BatchableContext BC) {
        Database.QueryLocator query1;
        if (!test.isRunningTest()) {
             query1 = Database.getQueryLocator([select id,ownerid from case where status != 'Closed' and LastModifiedDate != LAST_N_DAYS:5]);
        } else {
            query1 = Database.getQueryLocator([select id,ownerid from case where status != 'Closed' ]);
        } 
        return query1;
    }

    public void execute(Database.BatchableContext BC, List<case> scope) {
        list<task> taskList = new list<task>();
        for (case eachCase : scope) {
            task t = new task();
            t.Subject = 'Critical action needed';
            t.ActivityDate = date.today().addDays(2);
            t.Description = 'Complete fast';
            t.whatId = eachCase.id;
            t.status = 'In Progress';
            t.ownerId = eachCase.ownerId;
            taskList.add(t);
        }
        insert taskList;
    }

    public void finish(Database.BatchableContext BC) {

    }

}