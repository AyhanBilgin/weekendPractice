@isTest
public class CaseTriggerAndTriggerTest {
    @isTest
    private static void checkCaseTest() {
        list<case> caseList = new list<case>();
        for (Integer i = 0; i < 300; i++) {
            case cs = new case();
            
            cs.status = 'Working';
            cs.origin = 'Email';
            if (i<150) {
                cs.description = 'password';
            } 
            
            caseList.add(cs);
        }
        test.startTest();
        insert caseList;
        list<case> cList = [select id ,priority,subject ,parentid,description from case where priority = 'High' ];
        test.stopTest();

        assert.areEqual(150, cList.size());
        assert.areEqual('Parent Case may contain secret info, do something NOW', cList[0].subject);
        assert.isNotNull(cList[1].parentid);
    }


}