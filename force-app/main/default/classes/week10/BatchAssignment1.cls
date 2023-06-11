public class BatchAssignment1 implements Database.Batchable<sObject>,Database.stateful {
    //1. Write a Batch class to delete all the opportunities with a stage name as Closed Lost. Print the total number of records deleted by batch apex.
    public integer NumberOfRecords = 0;

    public Database.QueryLocator start(Database.BatchableContext BC) {
        Database.QueryLocator query1 = Database.getQueryLocator ([select id,name,stageName from opportunity where StageName ='Closed Lost']);
        return query1;
    }

    public void execute(Database.BatchableContext BC, List<opportunity> oppScope) {
        if (oppScope.size()>0) {
            NumberOfRecords += oppScope.size();
            delete oppScope;
        }
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('The total number of records deleted by batch apex ' + NumberOfRecords);
    }

}
