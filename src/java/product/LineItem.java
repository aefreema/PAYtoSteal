/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.io.Serializable;

/**
 *
 * @author Ashley, Phat, Yonas
 */
public class LineItem implements Serializable {

    private String orderNumber;
    private int itemSku;
    private String itemName;
    private String itemImgUrl;
    private double discount;
    private double price;
    private double discountedPrice;
    private int quantity;

    public LineItem() {
        orderNumber = "";
        itemSku = 0;
        itemName = "";
        itemImgUrl = "";
        discount = 0;
        price = 0;
        discountedPrice = 0;
        quantity = 0;
    }

    public int getItemSku() {
        return itemSku;
    }

    public void setItemSku(int itemSku) {
        this.itemSku = itemSku;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemImgUrl() {
        return itemImgUrl;
    }

    public void setItemImgUrl(String itemImgUrl) {
        this.itemImgUrl = itemImgUrl;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountedPrice() {
        return this.discountedPrice;
    }

    public void setDiscountedPrice(double discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void incQuantity() {
        quantity += 1;
    }
}