List<Account> accList = AccConAndOppOperations.fetchAcc();
system.debug('Account List: ' + accList);
AccConAndOppOperations.fetchOpp('Web', 'Closed Won');

AccConAndOppOperations.fetchAcc2();

AccConAndOppOperations.createAcc('', 100000, 'Customer - Direct');
AccConAndOppOperations.createAcc('     ', 100000, 'Customer - Direct');
AccConAndOppOperations.createAcc(NULL, 100000, 'Customer - Direct');
AccConAndOppOperations.createAcc('Muhammet', 100000, 'Customer - Direct');

system.debug('Total amount is : '  + AccConAndOppOperations.sumOfOppAmount());