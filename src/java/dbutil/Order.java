/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbutil;

import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import product.Cart;
import product.LineItem;

/**
 *
 * @author Yonas
 */
public class Order {

    public int addOrder(String orderNumber, String customerEmail, Date orderDate, double orderAmount, String nameOnCard, String cardNumber, String securityCode) {
        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "INSERT INTO `order` (`number`, `customerEmail`, `date`, `amount`, `nameOnCard`, `cardNumber`, `securityCode`) "
                    + " values(?,?,?,?,?,?,?)";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, orderNumber);
            stmt.setString(2, customerEmail);
            stmt.setDate(3, orderDate);
            stmt.setDouble(4, orderAmount);
            stmt.setString(5, nameOnCard);
            stmt.setString(6, cardNumber);
            stmt.setString(7, securityCode);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;
    }

    public int addOrderItems(String orderNumber, int itemSku, String itemName, double discountedPrice, int quantity) {
        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "insert into `orderitem` (`orderNumber`, `itemSku`, `itemName`, `price`, `quantity`) "
                    + " values(?,?,?,?,?)";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, orderNumber);
            stmt.setInt(2, itemSku);
            stmt.setString(3, itemName);
            stmt.setDouble(4, discountedPrice);
            stmt.setInt(5, quantity);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;
    }

    public List<Cart> listOrder(String customerEmail) {

        ResultSet rs = null;
        List<Cart> order = new ArrayList<Cart>();

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "Select * from `order` o where o.customerEmail = ?";
            PreparedStatement stmt = cp.connection.prepareStatement(query);

            stmt.setString(1, customerEmail);

            rs = stmt.executeQuery();

            while (rs.next()) {

                Cart od = new Cart();
                od.setOrderNumber(rs.getString("number"));
                od.setCustomerEmail(rs.getString("customerEmail"));
                od.setOrderDate(rs.getDate("date"));
                od.setTotalAmount(rs.getDouble("amount"));
                od.setNameOnCard(rs.getString("nameOnCard"));
                od.setCardNumber(rs.getString("cardNumber"));
                od.setSecurityCode(rs.getString("securityCode"));

                order.add(od);

            }

            rs.close();
            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return order;
    }

    public List<LineItem> listOrderItems(String orderNumber) {

        ResultSet rs = null;
        List<LineItem> item = new ArrayList<LineItem>();

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "Select * from `orderitem` i where i.orderNumber = ?";
            PreparedStatement stmt = cp.connection.prepareStatement(query);

            stmt.setString(1, orderNumber);

            rs = stmt.executeQuery();

            while (rs.next()) {

                LineItem it = new LineItem();
                it.setOrderNumber(rs.getString("orderNumber"));
                it.setItemSku(rs.getInt("itemSku"));
                it.setItemName(rs.getString("itemName"));
                it.setPrice(rs.getDouble("price"));
                it.setQuantity(rs.getInt("quantity"));

                item.add(it);

            }

            rs.close();
            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return item;
    }

}
