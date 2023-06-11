public class Circle {
    decimal radius;
    string color;

    public Circle(){
        
    }
    public Circle(decimal rd){
        radius = rd;
    }
    public Circle(decimal rd,string color){
        radius = rd;
        this.color = color;
    }
    public  void setRadius(decimal rd) {
        radius = rd;
    }
    public  decimal getRadius() {
        return radius;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public String getColor() {
        return this.color;
    }
    public  decimal calculateArea() {
        decimal area = (radius * radius) * math.pi;
        return area.setScale(2);
    }
    public  decimal calculateCircumference() {
        decimal circumference = 2 * (math.pi) * radius;
        return circumference.setScale(2);
    }
}