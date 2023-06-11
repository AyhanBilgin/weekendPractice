public class ValidateAddress {
    public void validateHomeAddress() {
        string houseName= 'AyhansHouse';

        String streetName = 'Ataturk';
        System.debug(streetName.length());

        Boolean result= streetName.contains(houseName);
        System.debug('sokak ismi ev ismini barindiriyor mu? ==> ' + result);



        String cityName = 'Merzifon';

        String stateName = 'Amasya';

        String stateISOCode = 'MER';

        String stateISOCode2= stateISOCode.toUpperCase();
        System.debug(stateISOCode2);

        String countryName = 'Turkey';

        String countryName2= countryName.toUpperCase();
        System.debug(countryName2);


        String countryISOCode = 'TUR';

        Boolean result2= streetName.contains(stateISOCode);
        System.debug('sokak ismi stateISOCode iceriyor mu? ==> ' + result2);

        String countryISOCode2= countryISOCode.toUpperCase();
        System.debug(countryISOCode2);

        String concatanete = 'House name : ' + houseName + ', street name: ' + streetName + ',city name: ' + cityName + ',state name: ' + stateName + ',country name: ' + countryName ;
        System.debug(concatanete);
    }

}