public class Planets {
    public String name;
    private integer planetNumber;
    private integer numberMoons;

    public void details() {
        System.debug('Name = ' + name);
        System.debug('Planet Number = ' + planetNumber);
        System.debug('Number of moons = ' + numberMoons);
    }
    public Planets(){
        details();
    }
    public Planets(String name,Integer position,integer moon){
        this.name = name;
        this.planetNumber = position;
        this.numberMoons = moon;
        details();
    }
    public Planets(String name){
        this.name = name;

        details();
    }
}

