public class StudentDemo {
    String admissionNo;
    String studentName;
    Map<String, Decimal> subjectAndMarks;

    public StudentDemo(String admNo,String name,map<string,decimal> subMarks){
        this.admissionNo = admNo;
        this.studentName = name;
        this.subjectAndMarks = subMarks;
    }
    public string getAdmissionNo() {
        return admissionNo;
    }
    public string getStudentName() {
        return studentName;
    }
    public set<string> getSubjects() {
        return subjectAndMarks.keySet();
    }
    public list<decimal> getMarks() {
        return subjectAndMarks.values();
    }
    public decimal getMarks(string sub){
        if (subjectAndMarks.containsKey(sub)) {
            return subjectAndMarks.get(sub);
        } else {
            System.debug(this.studentName + ' did not study ' + sub);
            return -1;
        }
    }
    public decimal getTotalMarks() {
        Decimal total = 0 ;
        for (decimal mark : subjectAndMarks.values()) {
            total += mark;
        }
        return total;
    }
    public decimal getAverageMarks() {
        decimal average =  getTotalMarks() / subjectAndMarks.size();
        return average;
    }
    public map< string , decimal> getSubjectAndMarksAboveAverage() {
        map< string,decimal> aboveAvgMap = new map < string, decimal >();
        for (String sub : subjectAndMarks.keySet()) {
            decimal mark = subjectAndMarks.get(sub);
            if (mark > getAverageMarks() ) {
                aboveAvgMap.put(sub, mark);
            }
        }
        return aboveAvgMap;
    }
}