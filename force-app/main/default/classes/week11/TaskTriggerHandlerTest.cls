@isTest
public class TaskTriggerHandlerTest {
    @TestSetup
    static void makeData(){
        project__c pr = new project__c();
        pr.name = 'Project 1 ';
        insert pr;
    
        list<task__c> taskList = new list<task__c>();
        for (Integer i = 0; i < 30; i++) { 
            task__c t = new task__c();
            t.name = 'Task ' + i;
            t.status__c = 'Not Started';
            t.Project__c = pr.id;
            taskList.add(t);
        }
        insert taskList;
    
        list<TimeLog__c> timeLogList = new list<TimeLog__c>();
        for (task__c eachTask : taskList){
            for (Integer i = 1; i <= 3; i++) {
                TimeLog__c tl = new TimeLog__c();
                tl.name = 'Time Log ' + i;
                tl.Time_Logged__c = i*5;
                tl.task__c = eachTask.id;
                timeLogList.add(tl);
            }   
        }
        insert timeLogList;   
    }
    @isTest
    public static void updateStatusTest(){
        
        test.startTest();
        list<task__c> taskList = [select id,name,status__c from task__c ];
        for (task__c eachTask : taskList) {
            if (taskList.indexOf(eachTask) <15) {
                eachTask.status__c = 'Completed';
            } else {
                eachTask.status__c = 'In Progress';
            }
        }
        update taskList;
        test.stopTest();

        project__c pr = [select id,Total_Time_Logged__c from project__c ];
        assert.areEqual(450,pr.Total_Time_Logged__c);

    }
}