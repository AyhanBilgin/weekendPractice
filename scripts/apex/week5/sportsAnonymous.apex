List<String> sportsList = new List<String>();
if (!sportsList.isEmpty()){
    system.debug('LIST IS NOT EMPTY');
}else {
    system.debug('LIST IS EMPTYYYY');
}
sportsList.add('Football');
sportsList.add('Hockey');
sportsList.add('Cricket');
sportsList.add('Volleyball');
sportsList.add('Golf');

List<String> withBallSports = new  List<String>();
List<String> withoutBallSports = new  List<String>();


for ( string ballSports : sportsList){
    if ( ballSports.contains('ball')){
        system.debug( ballSports + ' is played with Ball');
        withBallSports.add(ballSports);
    }else {
        system.debug(ballSports + '  is NOT played with ball');
        withoutBallSports.add(ballSports);
    }
}
system.debug('Sports with ball ' + withBallSports + 'and size : ' + withBallSports.size());
system.debug('Sports without ball ' + withoutBallSports + 'and size : ' + withoutBallSports.size());

integer indexNumber = sportsList.indexOf('Golf');
system.debug('index number of my favorite is ' + indexNumber);
//system.debug(sportsList.indexOf('Golf'));

integer indexNumber2 = sportsList.indexOf('Hockey');
sportsList.remove(indexNumber2);
system.debug('After remove ' + sportsList);
system.debug('After remove size : ' + sportsList.size());
system.debug('============================');

Set<String> operatingSystemSet = new Set<String>{
    'Windows',
    'macOS'
};
List<String> addNewOperatingSys = new List<String>{'Windows', 'macOS', 'Linux', 'Android', 'iOS', 'Chrome OS', 'FreeBSD', 'Ubuntu', 'Debian', 'Fedora'};
operatingSystemSet.addAll(addNewOperatingSys);
system.debug(operatingSystemSet.size());

string finalString = 'Operating systems added in set are ';
for (string eachOperratingSys : operatingSystemSet){
    finalString += eachOperratingSys + ' & ';
    
}

finalString= finalString.removeEnd(' & ');

system.debug(finalString + ' and Size of Final String  ' + finalString.length());
