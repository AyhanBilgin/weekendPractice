public class SecretBankAccount {
    Integer accountNumber; 
    String accountName;
    Decimal balanceAmount;

    public void createAccount(Integer accountNumber, String accountName, Decimal balanceAmount) {
        System.debug('Account has been created succesfully');
        this.accountNumber = accountNumber;
        this.accountName = accountName;
        this.balanceAmount = balanceAmount;
        seeAccountDetails();
    }

    public void depostitAmount(Decimal amount) {
        balanceAmount += amount;
        System.debug('Amount Deposited Successfully!');
        System.debug('Amount Deposited: ' + amount.setScale(2));
        System.debug('Current Balance:' + balanceAmount.setScale(2));
        seeAccountDetails();
    }

    public void withdrawAmount(Decimal amount) {
        if (balanceAmount > amount) {
            balanceAmount -= amount;
            System.debug('Amount Withdrawn Successfully!');
            System.debug('Amount Withdrawn:' + amount.setScale(2));
            System.debug('Current Balance:' + balanceAmount.setScale(2));
            seeAccountDetails();
            
        } else {
            System.debug('Sorry, Sufficient Balance not Available!');   
            System.debug('Current Balance:' + balanceAmount.setScale(2));   
            seeAccountDetails();      
        }

    }
    
    public void seeAccountDetails() {
        System.debug('Account Number : ' + accountNumber);
        System.debug('Account Name :' + accountName);
        System.debug('Available Balance :' + balanceAmount.setScale(2));
        
    }

}