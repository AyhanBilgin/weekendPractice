set<string> fruitsSet = new set<string>{'apple','orange','cherry','banana'};
for (string fruit : fruitsSet) {
    System.debug(fruit);
}
integer fruitSize = fruitsSet.size();
System.debug(fruitSize);
fruitsSet.add('apricot');
System.debug(fruitsSet);
Boolean checkFruit = fruitsSet.contains('apricot');
System.debug(checkFruit);
Boolean isEmp = fruitsSet.isEmpty();
System.debug(isEmp);