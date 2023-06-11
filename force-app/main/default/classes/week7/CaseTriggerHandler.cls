public class CaseTriggerHandler {
    // 2. When a case is created, check the description field of the newly created case - if the description field contains the word ‘password’, then create a child case with the following field values - subject = ‘Parent Case may contain secret info, do something NOW’ - parentId = _______ (newly create case id) - priority = ‘High’ - Description = ‘Secret info not allowed in case’
    public static void checkCase(list<case> newList) {
        list<case> caseList = new list<case>();
        for (case eachCase : newList) {
                
                if (eachCase.description != null && eachCase.description.containsIgnoreCase('password'  )) {
                    case newCase = new case();
                    newCase.subject = 'Parent Case may contain secret info, do something NOW';
                    newCase.parentId = eachCase.id;
                    newCase.priority = 'High';
                    newCase.description = 'Secret info not allowed in case';
                    caseList.add(newCase);
                }  
            }
        if (!caseList.isEmpty()) {
            insert caseList;
        }
    }
    // // Whenever a case is created with origin as email then set status as new and Priority as Medium
    // public static void createCase(list<case> newList) {
        
    //     for (case eachCase : newList) {
    //         if (eachCase.origin == 'Email') {
    //             eachCase.status = 'New';
    //             eachCase.priority = 'Medium';
    //         }
    //     }
    // }
}