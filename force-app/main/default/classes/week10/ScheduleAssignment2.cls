public class ScheduleAssignment2 implements Schedulable {
    public void execute(SchedulableContext SC) {
        BatchAssignment1 ba1 = new BatchAssignment1();
        Database.executeBatch(ba1,10);
    }
}