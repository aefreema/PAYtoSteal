/* * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbutil;

import customer.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import product.Item;

/**
 *
 * @author Ashley
 */
public class DBUtil {
    /* Customer util */

    public int addCustomer(String firstName, String lastName, String email, String password, String country) {

        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "insert into customer (firstName, lastName, email, password, country) values(?,?,?,?,?)";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, password);
            stmt.setString(5, country);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;
    }

    public int updateCustomer(String firstName, String lastName, String email, String password, String country) {

        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "update customer set firstName = ?, lastName = ?, email = ?, password = ?, country = ?  where email = ? ";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, password);
            stmt.setString(5, country);
            stmt.setString(6, email);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;
    }

    public int deleteCustomer(String email) {

        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "delete from customer where email = ? ";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, email);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;

    }

    public Customer isCustomer(String email, String password) {

        ResultSet rs = null;
        Customer customer = null;

        //use prepared statements to avoid sql injection.
        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "Select * from customer c where c.email = ? and password = ? ";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {

                customer = new Customer(rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("country"));

            }

            rs.close();
            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return customer;
    }

    public List<Customer> listCustomer() {

        ResultSet rs = null;
        List<Customer> customers = new ArrayList<Customer>();

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "Select * from customer";
            PreparedStatement stmt = cp.connection.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {

                customers.add(new Customer(rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("country")));

            }

            rs.close();
            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return customers;
    }

    /* Product util */
    public int addItem(int sku, String imgSrc, String itemName, double price, String description, double discount, String discountStartTime, String discountEndTime) {
        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "insert into item (sku, imgSrc, itemName, price, description, discount, discountStartTime, discountEndTime ) "
                    + " values(?,?,?,?,?,?,?,?)";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setInt(1, sku);
            stmt.setString(2, imgSrc);
            stmt.setString(3, itemName);
            stmt.setDouble(4, price);
            stmt.setString(5, description);
            stmt.setDouble(6, discount);
            stmt.setString(7, discountStartTime);
            stmt.setString(8, discountEndTime);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;
    }

    public int updateItem(int sku, String imgSrc, String itemName, double price, String description, double discount, Date discountStartTime, Date discountEndTime) {
        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "update item set imgSrc = ?, itemName = ?, price = ?, description = ?, "
                    + "discount = ?, discountStartTime = ?, discountEndTime = ?"
                    + "where sku = ? ";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setString(1, imgSrc);
            stmt.setString(2, itemName);
            stmt.setDouble(3, price);
            stmt.setString(4, description);
            stmt.setDouble(5, discount);
            stmt.setDate(6, (java.sql.Date) discountStartTime);
            stmt.setDate(7, (java.sql.Date) discountEndTime);
            stmt.setInt(8, sku);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;
    }

    public int deleteItem(int sku) {

        int rowsAffected = 0;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "delete from item where sku = ? ";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setInt(1, sku);

            rowsAffected = stmt.executeUpdate();

            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return rowsAffected;

    }

    public List<Item> listItems(int max) {

        ResultSet rs = null;
        List<Item> items = new ArrayList<>();
        Item it = null;

        try {
            ConnectionPool cp = new ConnectionPool();

            String query = " SELECT * FROM item i "
                    + " where i.discountStartTime <= now() and i.discountEndTime >= now() "
                    + " order by i.discount ";

            //if max is 0 list all items
            query = max == 0 ? query : query + "limit ?";

            PreparedStatement stmt = cp.connection.prepareStatement(query);

            if (max > 0) {
                stmt.setInt(1, max);
            }

            rs = stmt.executeQuery();

            while (rs.next()) {

                it = new Item();
                it.setSku(rs.getInt("sku"));
                it.setItemName(rs.getString("itemName"));
                it.setImgSrc(rs.getString("imgSrc"));
                it.setPrice(rs.getDouble("price"));
                it.setDescription(rs.getString("description"));
                it.setDiscount(rs.getDouble("discount"));
                it.setDiscountStartTime(rs.getTimestamp("discountStartTime"));
                it.setDiscountEndTime(rs.getTimestamp("discountEndTime"));

                items.add(it);

            }

            rs.close();
            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        return items;
    }

    public Item getItem(int sku) {
        ResultSet rs = null;
        Item it = null;

        //use prepared statements to avoid sql injection.
        try {
            ConnectionPool cp = new ConnectionPool();

            String query = "Select * from item where sku = ? ";

            PreparedStatement stmt = cp.connection.prepareStatement(query);
            stmt.setInt(1, sku);
            rs = stmt.executeQuery();

            if (rs.next()) {

                it = new Item();
                it.setSku(rs.getInt("sku"));
                it.setImgSrc(rs.getString("imgSrc"));
                it.setItemName(rs.getString("itemName"));
                it.setPrice(rs.getDouble("price"));
                it.setDescription(rs.getString("description"));
                it.setDiscount(rs.getDouble("discount"));
                it.setDiscountStartTime(rs.getDate("discountStartTime"));
                it.setDiscountEndTime(rs.getDate("discountEndTime"));

            }

            rs.close();
            stmt.close();
            cp.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return it;
    }
}