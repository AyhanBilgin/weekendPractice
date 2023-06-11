List<String> coloursList = new list<string>{'blue','black','white','gray','brown'};
coloursList.add('yellow');
system.debug(coloursList);
// system.debug(coloursList.size());

integer size = coloursList.size();
system.debug(size);

Boolean cont = coloursList.contains('red');
system.debug(cont);

string last = coloursList.get(size -1).toUpperCase();
system.debug(last);

string fourth = coloursList[3].toUpperCase();
system.debug(fourth);

List<String> colourCodesList = new List<String>{'#0000FF','#000000','#FFFFFF','#808080','#D2691E','#FFFF00'};
system.debug(colourCodesList);
boolean eq = coloursList.equals(colourCodesList);
system.debug(eq);

List<String> codesList = new List<String>();
codesList.addAll(coloursList);
system.debug(codesList);
codesList.addAll(colourCodesList);
system.debug(codesList);

// coloursList.addAll(colourCodesList);
// system.debug(coloursList);  ........Altenatif......