/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author Ashley, Yonas, Phat
 */
public class Item {
    String imgSrc;
    String itemName;
    String price;
    
    public Item(String src, String nme, String amt) {
        imgSrc = src;
        itemName = nme;
        price = amt;
    }
    
    public String getImgSrc() {
        return imgSrc;   
    }
    
    public String getItemName() {
        return itemName;
    }
    
    public String getPrice() {
        return price;
    }
}
