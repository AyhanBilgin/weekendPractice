PlayingWithDates tarih=new PlayingWithDates();
tarih.printDateOutput();


Calculator opr= new Calculator();
system.debug(opr.dynamicCalculationMethod(10, 67.5, 'ADDITION'));
system.debug(opr.dynamicCalculationMethod(90, 60, 'SUBTRACTION'));
system.debug(opr.dynamicCalculationMethod(8, 2, 'DIVISION'));
system.debug(opr.dynamicCalculationMethod(6, 4, 'MULTIPLICATION'));
system.debug(opr.dynamicCalculationMethod(6, 4, 'Multiplication'));

Calculator cd=new Calculator();
system.debug('Discount : ' + cd.calculateDiscount(899));
system.debug('Discount : ' + cd.calculateDiscount(1050));
system.debug('Discount : ' + cd.calculateDiscount(50));
system.debug('Discount : ' + cd.calculateDiscount(666));
system.debug('Discount : ' + cd.calculateDiscount(400));


Calculator np= new Calculator();
system.debug(np.calculateNetPrice(1000 , 3.5));

OperationsHelper large=new OperationsHelper();
system.debug('The largest number: ' + large.largestOutOfTwoNumbers(10, 5));
system.debug('The largest number: ' + large.largestOutOfTwoNumbers(10, 15));


OperationsHelper small=new OperationsHelper();
system.debug('The smaller number: ' + small.smallestOutOfThreeNumbers(24, 56, 12));
system.debug('The smaller number: ' + small.smallestOutOfThreeNumbers2(24, 56, 85));