public  class TaskTriggerHandler {
    public static void updateStatus(List<Task__c> listNew,map<id,task__c> oldMap ) {
        set<id> projectIds = new set<id>();
        for (task__c eachTask : listNew) {
            if (eachTask.Status__c != oldMap.get(eachTask.Id).Status__c && eachTask.Status__c == 'Completed' && eachTask.Project__c != null) {
                projectIds.add(eachTask.Project__c);
            }
        }
        if (!projectIds.isEmpty()) {
            futureUpdateStatus(projectIds);
        }
    }
    @future
    public static void futureUpdateStatus(set<id> projectIds ) {
        List<Task__c> ListTask = [select id ,( select id, name, Time_Logged__c from TimeLogs__r )from Task__c where Project__c In : projectIds and status__c = 'Completed'];
        map<id,Decimal> taskTimeLog = new map<id,Decimal>();
        for (Task__c eachTask: ListTask) {
            Decimal totatTimelog = 0;
            for (TimeLog__c eachTimeLog : eachTask.TimeLogs__r) {
                totatTimelog += eachTimeLog.Time_Logged__c;
            }
           taskTimeLog.put(eachTask.Id, totatTimelog);
        }
        list<project__c> listProject= [ select id, (select id, status__c from tasks__r) from Project__c where id in : projectIds];
        for (Project__c eachProject : listProject) {
            Decimal projectTotalLog = 0;
            for (Task__c eachTask : eachProject.Tasks__r) {
                if (eachTask.Status__c == 'Completed') {
                 projectTotalLog += taskTimeLog.get(eachTask.Id);
                }
            }
            eachProject.Total_Time_Logged__c = projectTotalLog;
        }
        update listProject;
    }
} 