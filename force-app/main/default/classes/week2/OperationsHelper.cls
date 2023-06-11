public class OperationsHelper {
    public decimal  largestOutOfTwoNumbers(decimal a, Decimal b ){
        //return math.max(x, y);   bu metod da olabilir....
        
        if (a > b){
            return a;
        } else {
            return b;
        }
    }
    public decimal  smallestOutOfThreeNumbers(decimal x, Decimal y,Decimal z ){
        decimal smallest;
        if (x<y && x<z) {
            smallest= x;
       } else if (y<x && y<z){
            smallest= y ;
       } else {
            smallest= z;
       }
       return smallest;
    }

    public decimal  smallestOutOfThreeNumbers2(decimal x, Decimal y,Decimal z ){
        decimal smaller =math.min(x, math.min(y,z));
        return smaller;
    }

}