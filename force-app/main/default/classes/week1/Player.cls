public with sharing class Player {
    public void playing(){
        String playerName1='Alex';
        System.debug('playerName1: ' + playerName1.toUpperCase() + ',isminin uzunlugu: ' + playerName1.length());
        Integer lenghtPlayerName1=playerName1.length();
        System.debug(lenghtPlayerName1);

       
        String playerName2='Aykut';
        System.debug(playerName2);
        Integer lenghtPlayerName2=playerName2.length();
        System.debug(lenghtPlayerName2);

        String playerName3='Volkan';
        System.debug(playerName3.toUpperCase());
        Integer lenghtPlayerName3=playerName3.length();
        System.debug(lenghtPlayerName3);

        String playerName4='Oguz';
        System.debug(playerName4);
        Integer lenghtPlayerName4=playerName4.length();
        System.debug(lenghtPlayerName4);

        String playerName5='Ayhan';
        System.debug(playerName5);
        Integer lenghtPlayerName5=playerName5.length();
        System.debug(lenghtPlayerName5);
    }
}