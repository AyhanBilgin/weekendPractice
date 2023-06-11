@isTest
public class ContactTriggerHandlerTest {
    @isTest
    private static void mainContactPersonTest() {
        account acc = new account();
        acc.name = 'Test acc fax';
        insert acc;

        contact con = new contact();
        con.lastname = 'Test contact';
        con.fax = '10026160';
        con.accountid = acc.id;
        insert con;

        con.Main_Contact_Person__c = true;
        update con;

    }
}