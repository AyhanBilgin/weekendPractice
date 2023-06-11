public class ScheduleAssignment4 implements Schedulable {

    public void execute(SchedulableContext SC) {
        BatchAssignment3 ba3 = new BatchAssignment3();
        Database.executeBatch(ba3,10);
    }

}