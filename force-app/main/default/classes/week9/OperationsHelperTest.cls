@isTest
public class OperationsHelperTest {
    @isTest
    private static void largestOutOfTwoNumbersTest() {
        OperationsHelper oh =new OperationsHelper();
        
        Decimal largeNum = oh.largestOutOfTwoNumbers(3, 5);
        assert.areEqual(5, largeNum);
        
        Decimal largeNum2 = oh.largestOutOfTwoNumbers(2, 8);
        assert.areEqual(8, largeNum2);
        
        Decimal largeNum3 = oh.largestOutOfTwoNumbers(8, 8);
        assert.areEqual(8, largeNum3);
    }

    @isTest
    private static void smallestOutOfThreeNumbersTest() {
        OperationsHelper oh =new OperationsHelper();

        decimal smallest = oh.smallestOutOfThreeNumbers(1, 2, 3);
        assert.areEqual(1, smallest);
    }

    @isTest
    private static void sumOfPositiveInteger() {
        OperationsHelper oh =new OperationsHelper();

        integer sum = oh.sumOfPositiveInteger(-1);
        assert.areEqual(null, sum);
        
        integer sum2 = oh.sumOfPositiveInteger(5);
        assert.areEqual(15, sum2);
    }
}