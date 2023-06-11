integer toplam = CalculatorAgain.sumofPositiveIntegers(5);
system.debug('Toplam ' + toplam);
integer toplam2 = CalculatorAgain.sumofPositiveIntegers(-6);
system.debug('Toplam ' + toplam2);


CalculatorAgain.multiplicationTable(5);
CalculatorAgain.multiplicationTable(9);

CalculatorAgain.sumOfSquares(5);
CalculatorAgain.sumOfSquares(4);

Planets pl = new Planets();
Planets pl2 = new Planets('venus');
Planets pl3 = new Planets('mercury',1,5);

/*  bu comment i yapmak için shift + alt + a kullanabiliriz...*/

Students stu1 = new Students();
stu1.setFirstName('Ayhan');
stu1.setLastName('Bilgin');
stu1.setClassYear(1950);
stu1.setMarks(50);
stu1.setMarks(105);
stu1.setMajor('math');
//stu1.generateReport();
// system.debug(stu1);

String fn = stu1.getFirstName();
system.debug(fn);

//Final Grade of [firstName] is [final grade]
system.debug ('Final Grade of ' + stu1.getFirstName() + ' is ' + stu1.generateReport() );
stu1.getFirstName();

Students stu2 = new Students();
stu2.setFirstName('Ayhan');
stu2.setLastName('Bilgin');
stu2.setClassYear(1988);
stu2.setMarks(85);
stu2.setMajor('fizik');
//stu2.generateReport();

system.debug ('Final Grade of ' + stu2.getFirstName() + ' is ' + stu2.generateReport() );
stu2.getFirstName();