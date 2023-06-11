ShoppingCart.discount = 0.1;

ShoppingCart cart1 = new ShoppingCart();

cart1.setName('Donald Duck');
cart1.addItem('chips');
cart1.addItems('cookies', 9.99);
cart1.addItems('pancake', 10.20);

Map<String,Decimal> multItems = new Map<String,Decimal>{'ketchup' => 5.55, 'tea' => 6.00};
cart1.addItems(multItems);

System.debug(cart1.getShopItems());

System.debug('total value of cart is ' + cart1.getTotalAmount());

cart1.printSummary();

cart1.clearCart();

System.debug(cart1.getShopItems());

System.debug('==================');

ShoppingCart cart2 = new ShoppingCart('Uncle Scrooge');

//cart2.setName('Uncle Scrooge');

cart2.addItems(new Map<String,Decimal>{'towel' => 49.99, 'Suit' => 250.00, 'watch' => 199.00});

System.debug(cart2.getShopItems());

System.debug('total value of cart is ' + cart2.getTotalAmount());
cart2.printSummary();