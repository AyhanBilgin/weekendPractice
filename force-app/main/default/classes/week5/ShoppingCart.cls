public class ShoppingCart {
    String name; 
    Map<String,Decimal> shopItems;
    Public Static Decimal discount;
    
    public ShoppingCart() {
       this.name = '';
       this.shopItems = new Map<String,Decimal>();
       System.debug('Hello ' + this.name + ', we are glad you are here, what would you like to shop today?');
    }
    
    public ShoppingCart(String name) {
        this.name = name;
        this.shopItems = new Map<String,Decimal>();
        System.debug('Hello ' + this.name + ', we are glad you are here, what would you like to shop today?');
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void addItem(String itemName) {
        this.shopItems.put(itemName, 0.0);
    }

    public void addItems(String itemName, Decimal price) {
        this.shopItems.put(itemName, price);
    }

    public void addItems(Map<String,Decimal> itemsPrice) {
        this.shopItems.putAll(itemsPrice);
    }

    public String removeItem(String itemName) {
        if (this.shopItems.containsKey(itemName)) {
            this.shopItems.remove(itemName);
            return itemName + ' removed successfully';
        } else {
            return 'no such item is added in cart, how can I remove it buddy?';
        }
    }

    public Map<String,Decimal> getShopItems() {
        return this.shopItems;
    }

    public Decimal getTotalAmount() {
        Decimal totalAmount = 0;
        for (Decimal eachValue : shopItems.values()) {
            totalAmount += eachValue;
        }
        return totalAmount;
    }

    public void printSummary() {
        System.debug('You have added ' +  shopItems.size() + ' items in your cart. Each items and its prices are below:');

        for (String eachItem : shopItems.keySet()) {
            System.debug('Item name ' + eachItem + ', its price is ' + shopItems.get(eachItem));
        }
            System.debug('Total value of your cart is ' + getTotalAmount());
        if (getTotalAmount()< 300 ) {
            System.debug('Add items worth ' + (300 - getTotalAmount()) + ' to get bind blowing discount.');
        } else {
            System.debug('Final price to pay is ' + (getTotalAmount() - getTotalAmount()*discount)); //getTotalAmount() * (1-dicount)
            System.debug('Congratulations, You JUST saved ' + getTotalAmount()*discount);
        }
    }

    public void clearCart() {
        this.shopItems.clear();
    }

}