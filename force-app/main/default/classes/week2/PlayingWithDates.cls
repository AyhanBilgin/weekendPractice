public class PlayingWithDates {
    public void printDateOutput() {
        date dt1=date.today();
        System.debug('Bugunun tarihi: ' + dt1);
        date dt2=date.newInstance(2789, 11, 05);
        System.debug(dt2);
        date dt3=date.newInstance(1459, 3, 4);
        System.debug(dt3);

        integer dayInt= 15;
        integer monthInt= 3;
        integer yearInt= 2025;

        date dt4= date.newInstance(yearInt, monthInt, dayInt);
        System.debug('Yeni tarihi: ' + dt4);
    }
    public string getMonthName(date trh){
        
        integer ay=trh.month();
        string ayStr='';
        if (ay==1) {
            ayStr='Ocak';
        } else if (ay==2 ){
            ayStr='Subat';
        } else if (ay==3 ){
            ayStr='Mart';
        } else if (ay==4){
            ayStr='Nisan';
        } else if (ay==5){
            ayStr='Mayis';
        } else if (ay==6 ){
            ayStr='Haziran';
        } else if (ay==7 ){
            ayStr='Temmuz';
        } else if (ay==8){
            ayStr='Agustos';
        } else if (ay==9 ){
            ayStr='Eylul';
        } else if (ay==10){
            ayStr='Ekim';
        } else if (ay==11 ){
            ayStr='Kasim';
        } else if (ay==12 ){
            ayStr='';
        } 
        return ayStr;
    }

}