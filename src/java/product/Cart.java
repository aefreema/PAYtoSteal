package product;

import java.io.Serializable;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author Ashley, Phat, Yonas
 */
public class Cart {

    private String orderNumber;
    private String customerEmail;
    private Date orderDate;
    private double totalAmount;
    private String nameOnCard;
    private String cardNumber;
    private String securityCode;
    private ArrayList<LineItem> items;

    public Cart() {
        this.orderNumber = "";
        this.customerEmail = "";
        this.orderDate = new java.sql.Date(new java.util.Date().getTime());;
        this.totalAmount = 0;
        this.nameOnCard = "";
        this.cardNumber = "";
        this.securityCode = "";
        items = new ArrayList<>();
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public Date getOrderDate() {
        return this.orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        totalAmount = 0;
        for (LineItem l : items) {
            totalAmount += l.getDiscountedPrice() * l.getQuantity(); //calculate discounted price (not base price)
        }
        return totalAmount;
    }
    
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public ArrayList<LineItem> getItems(){
        return items;
    }
    
    public void setItems(ArrayList<LineItem> a){
        items.clear();
        for (int i = 0; i < a.size(); i++) {
            items.add(a.get(i));
        }
    }
    
    public int getSize() {
        return items.size();
    }
    
    public void addItem(String orderNumber, int sku, String itemName, String itemImgSrc, double price, double discount, double discountedPrice) {

        boolean found = false;

        //check if the item is already in the list
        for (LineItem i : items) {
            if (i.getItemSku() == sku) {//item is in the cart
                i.incQuantity();
                found = true;
            }

            if (found) {
                break; //no need to loop further, exit.
            }
        }

        //item is not in cart, add as a new item.
        if (!found) {
            LineItem l = new LineItem();
            l.setItemSku(sku);
            l.setOrderNumber(orderNumber);
            l.setItemName(itemName);
            l.setItemImgUrl(itemImgSrc);
            l.setPrice(price);
            l.setDiscount(discount);
            l.setDiscountedPrice(discountedPrice);
            l.setQuantity(1);

            items.add(l);
        }
    }
    
    public void updateItem(int sku, int quantity) {
        boolean found = false;

        //check if the item is already in the list
        for (LineItem i : items) {
            if (i.getItemSku() == sku) {//item is in the cart
                if (quantity == 0) {//zero quantity will remove the item from the cart
                    removeItem(i);
                } else {
                    i.setQuantity(quantity);
                }
                found = true;
            }
            if (found) {
                break;
            }
        }
    }
    
    public void removeItem(LineItem item) {
        items.remove(item);
    }

    public void emptyCart() {
        items.clear();
    }
}