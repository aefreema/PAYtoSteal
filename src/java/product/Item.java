/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Ashley, Yonas, Phat
 */
public class Item implements Serializable {

    private int sku;
    private String imgSrc;
    private String itemName;
    private double price;
    private String description;
    private double discount;
    private double discountedPrice;
    private Date discountStartTime;
    private Date discountEndTime;
    private boolean isExpiredDiscount;

    public Item() {
        sku = 0;
        imgSrc = "images/noItem.png";
        itemName = "";
        price = 0;
        description = "";
        discount = 0;
        discountStartTime = new Date();
        discountEndTime = new Date();
    }



    public int getSku() {
        return sku;
    }

    public void setSku(int sku) {
        this.sku = sku;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getDiscountedPrice() {
        this.discountedPrice = (price - (price * (discount / 100)));
        return discountedPrice;
    }

    public void setDiscountedPrice(double discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

    public Date getDiscountStartTime() {
        return discountStartTime;
    }

    public void setDiscountStartTime(Date discountStartTime) {
        this.discountStartTime = discountStartTime;
    }

    public Date getDiscountEndTime() {
        return discountEndTime;
    }

    public void setDiscountEndTime(Date discountEndTime) {
        this.discountEndTime = discountEndTime;
    }

    public boolean isIsExpiredDiscount() {
        
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
        Date today = new Date();
        
        long diff = discountEndTime.getTime() - today.getTime();
        
        this.isExpiredDiscount = diff <=0 ? true : false;
        
        return isExpiredDiscount;
    }

    public void setIsExpiredDiscount(boolean isExpiredDiscount) {
        this.isExpiredDiscount = isExpiredDiscount;
    }

}