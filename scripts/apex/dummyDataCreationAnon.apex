DummyDataCreation.topOpp10();
DummyDataCreation.oppAcc(3, '0018d00000bzmYBAAY');
DummyDataCreation.addContact();
DummyDataCreation.deleteOpp();
DummyDataCreation.createNAccount(5);
DummyDataCreation.createNContact(3, DummyDataCreation.createNAccount(3));

DummyDataCreation.createCase(DummyDataCreation.createNContact(3, DummyDataCreation.createNAccount(3)));
