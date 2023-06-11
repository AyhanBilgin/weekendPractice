public class CalculatorAgain {
    public static integer sumofPositiveIntegers(integer n) {
        integer sum ;
        if (n >= 0) {
            sum = 0;
            for (Integer i = 0; i <= n; i++) {
            sum +=i;
            }
        } else {
            System.debug('We are not calculating the sum for negative numbers');
        }
        return sum;        
    }
    public static void multiplicationTable(integer a) {
        
        for (Integer i = 1; i <= 10; i++) {
            System.debug(i + ' x ' + a + ' = ' + i*a);
        }
    }
    public static void sumOfSquares(integer x) {
        integer sumOfSquares = 0;
        for (Integer i = 1; i <= x; i++) {
            sumOfSquares = sumOfSquares + ( i * i );
            
        }
        System.debug('The sum of squares from 1 to ' + x + ' is ' + sumOfSquares);
    }
}