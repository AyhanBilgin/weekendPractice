//QueueableAssignment qa = new QueueableAssignment();
Id jobId = system.enqueueJob(new QueueableAssignment());
System.debug('JOB ID => ' + jobId);

//monitor the apex job right here.
AsyncApexJob ap = [SELECT Status, JobType, JobItemsProcessed, Id, MethodName, NumberOfErrors FROM AsyncApexJob where id = :jobId];
system.debug(ap);

AsyncApexJob ap = [SELECT Status, JobType, JobItemsProcessed, Id, MethodName, NumberOfErrors FROM AsyncApexJob where id = '7078d00003Wn9vc'];
system.debug(ap);
