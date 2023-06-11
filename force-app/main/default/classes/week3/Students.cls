public class Students {
    string firstName;
    string lastName;
    integer classYear;
    integer marks;
    string major;

    public void setFirstName(string fName) {
        this.firstName = fName;
    }
    public string getFirstName() {
        return this.firstName;
    }
    public void setLastName(string lName) {
        this.lastName = lName;
    }
    public void setMarks(integer puan){
        if (puan >= 0 && puan <= 100) {
            this.marks = puan;
        } else {
            this.marks = -1;
            System.debug('please give proper marks. this no joke');
        } 
    }
    public void setClassYear(integer cYear) {
        integer tYear = date.today().year();
        integer dYear = tYear - 100;

        if (cYear <= tYear && dYear <= cYear ) {
            this.classYear = cYear;
        } else {
            this.classYear = 0;
            System.debug('no such class year exists for us');
        }
    }
    public void setMajor(string mjr) {
        integer majorLength = mjr.length();
        if (majorLength <= 2) {
            this.major = 'NA';
            System.debug('there is no such major or stream in our uni');
        } else {
            this.major = mjr;
        }
    }
    public String generateReport() {
        System.debug('Report Generated for ' + this.firstName + ' ' + this.lastName + ' of ' + this.classYear + ' - ' + this.major);
        String finalGrade ;
        if (this.marks >= 90) {
            finalGrade = 'A';
        } else if (this.marks >= 80){
            finalGrade = 'B';
        } else if(this.marks >= 70){
            finalGrade = 'C';
        } else if(this.marks >= 60){
            finalGrade = 'D';
        } else if(this.marks >= 0){
            finalGrade = 'F';
        } else {
            finalGrade = 'X';
        }
        return finalGrade;

    }
}

