BatchAssignment1 ba1 = new BatchAssignment1();
Database.executeBatch(ba1,10);

//Database.executeBatch(new BatchAssignment1(),10);


ScheduleAssignment2 sa2 = new ScheduleAssignment2();

System.schedule('AssignmentJob','0 0 15 1/1 * ? *',sa2);

ScheduleAssignment4 