Map<String, Decimal> currencyRate = new Map<String, Decimal>{
  'AUD' => 0.73,
  'CAD' => 0.78,
  'EUR' => 1.13,
  'NZD' => 0.68
};
currencyRate.put('INR', 0.13);

decimal euroRate = currencyRate.get('EUR');
System.debug('Conversion rate of EUR ' + euroRate);

Boolean isSAD = currencyRate.containsKey('SAD');
System.debug('SAD ISO Code exists ' + isSAD);

set<string> isoCodesGreaterThan1 = new Set<String>();
set<string> isoCodesLessThan1 = new Set<String>();

for (string isoCode: currencyRate.keySet()){
    if (currencyRate.get(isoCode)>=1) {
        isoCodesGreaterThan1.add(isoCode);
    } else {
        isoCodesLessThan1.add(isoCode);
    }
}

System.debug('ISO Codes greater than one :' + isoCodesGreaterThan1);
System.debug('ISO Codes less than one :' + isoCodesLessThan1);