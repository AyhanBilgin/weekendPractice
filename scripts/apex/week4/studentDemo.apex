map<string,decimal > subjectAndMarks = new map<string,decimal >{
    'math' => 75.5,
    'physics' => 56.0,
    'english' => 80.5,
    'chemistry'=> 70.0,
    'computer'=> 58.5
};

StudentDemo student1 = new StudentDemo('1001','Peter Parker',subjectAndMarks);
system.debug('Admission Code 1 : ' + student1.getAdmissionNo());
system.debug('Student Name 1 : ' + student1.getStudentName());
system.debug('Subject1 : ' + student1.getSubjects());
system.debug('Marks1 : ' + student1.getMarks());
system.debug('Marks of English : ' + student1.getMarks('english'));
system.debug('Marks of physics : ' + student1.getMarks('physics'));
system.debug('Marks of Hindi : ' + student1.getMarks('Hindi'));
system.debug('Total of Marks 1: ' + student1.getTotalMarks());
system.debug('Average Mark : ' + student1.getAverageMarks());
system.debug('Above average subject and marks: ' + student1.getSubjectAndMarksAboveAverage());

map<string,decimal > subjectAndMarks2 = new map<string,decimal >{
    'greek' => 70.5,
    'egyptian' => 51.0,
    'arabic' => 60.5,
    'hebrew'=> 60.0,
    'philosophy'=> 68.5
};


StudentDemo student2 = new StudentDemo('1005','Cleopatra',subjectAndMarks2);
system.debug('Admission Code 2 : ' + student2.getAdmissionNo());
system.debug('Student Name 2 : ' + student2.getStudentName());
system.debug('Subject2 : ' + student2.getSubjects());
system.debug('Marks2 : ' + student2.getMarks());
system.debug('Marks of computer : ' + student2.getMarks('computer'));
system.debug('Total of Marks 2: ' + student2.getTotalMarks());
system.debug('Average Mark : ' + student2.getAverageMarks());
system.debug('Above average subject and marks: ' + student2.getSubjectAndMarksAboveAverage());
