public class Calculator {
    public Decimal dynamicCalculationMethod(Decimal a, decimal b, string operation ){
        decimal result ;

        switch on operation {
            when  'ADDITION'{
                result= a+ b;
            } when 'SUBTRACTION'{
                result = a - b;
            } when 'DIVISION'{
                result= a / b;
            } when 'MULTIPLICATION'{
                result= a * b ;
            }
            // when else {
            //     System.debug('Hatali parametre girdiniz,tekrar deneyiniz..');
            // }       
        }
        return result;
    }
    public decimal calculateDiscount (decimal totalPrice) {
        Decimal discount;

        if (totalPrice >=1000) {
            discount=0.25;
        } else if (totalPrice>=800 && totalPrice <1000)  {
            discount= 0.15;
        } else if (totalPrice>=500 && totalPrice <800)  {
            discount= 0.10;
        } else if (totalPrice>=100 && totalPrice <500)  {
            discount= 0.05;
        } else if ( totalPrice <=100 && totalPrice >=0) {
            discount=0;
        }
        return discount;
    }
    public decimal calculateNetPrice(integer quantity, decimal rate) {
        decimal totalPrice= rate * quantity;
        Decimal discountPrice= totalPrice * calculateDiscount(totalPrice);
        Decimal netPrice= totalPrice - discountPrice;

        System.debug('Total price : ' +  totalPrice + ' Discount price : ' + discountPrice + ', net price ' + netPrice );
        return netPrice;
    }
}