public class OperationsHelper {
    public static Decimal sum(list< decimal > values) {
        decimal total;
        if (!values.isEmpty()) {
            total = 0; 
            for (Decimal eachValue : values) {
                total += eachValue;
            }
        } else {
            System.debug('Please provide values to do the operation');
        }
        return total;
    }
    public static decimal average(list < decimal > values2) {
        decimal average;
        if (!values2.isEmpty()) {
            average= sum(values2) / values2.size();
        } else {
            System.debug('Please provide values to do the operation');
        }
        return average;
    }
    public static decimal highest(list < decimal> values3) {
        decimal highest;
        if (!values3.isEmpty()) {
            highest = values3[0];
            for (decimal eachValue : values3) {
                if (eachValue > highest) {
                    highest = eachValue;
                }
            }

        } else {
            System.debug('Please provide values to do the operation');
        }
        return highest;
        
    }
    public static decimal lowest(list < decimal> values4) {
        decimal lowest;
        if (!values4.isEmpty()) {
            lowest = values4[0];
            for (decimal eachValue : values4) {
                if (eachValue < lowest) {
                    lowest = eachValue;
                }
            }
        } else {
            System.debug('Please provide values to do the operation');
        }
        return lowest;
        
    }
    
}