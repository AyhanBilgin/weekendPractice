Circle c1 = new Circle();
system.debug(c1);
c1.setRadius(4.1);
c1.setColor('Black');
system.debug(c1);

decimal a1 = c1.calculateArea();
system.debug(a1);

Decimal cur1 = c1.calculateCircumference();
system.debug(cur1);
system.debug('============');
Circle c2 = new Circle(5.2,'Green');
system.debug(c2);


decimal a2 = c2.calculateArea();
system.debug(a2);

Decimal cur2 = c2.calculateCircumference();
system.debug(cur2);
system.debug('============');

Circle c3 = new Circle(7);
c3.setColor('Gray');
system.debug(c3);

decimal a3 = c3.calculateArea();
system.debug(a3);

Decimal cur3 = c3.calculateCircumference();
system.debug(cur3);

