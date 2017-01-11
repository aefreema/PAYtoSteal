/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import apputil.AppUtil;
import customer.Customer;
import dbutil.Order;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.Cart;
import product.LineItem;

/**
 *
 * @author Ashley
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //prepare data to insert into the db.
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        Cart cart = (Cart) session.getAttribute("cart");

        cart.setCustomerEmail(customer.getEmail());

        String nameOnCard = request.getParameter("name");
        String cardNumber = request.getParameter("num");
        String securityCode = request.getParameter("code");

        String orderNumber = cart.getOrderNumber();
        String customerEmail = cart.getCustomerEmail();
        Date orderDate = cart.getOrderDate();
        double orderAmount = cart.getTotalAmount();

        Order order = new Order();

        //check if order number exists
        if (order.listOrderItems(orderNumber).isEmpty()) {

            //copy order info into the databse
            order.addOrder(orderNumber, customerEmail, orderDate, orderAmount, nameOnCard, cardNumber, securityCode);

            //now let's iterate through cart item and push them over to the order items table.
            for (LineItem l : cart.getItems()) {
                order.addOrderItems(orderNumber, l.getItemSku(), l.getItemName(), l.getDiscountedPrice(), l.getQuantity());
            }

            //send confirmation email
            /*AppUtil util = new AppUtil();
            String messageBody = customer.getFirstName() + ", thank you for your order!\n"
                    + "Your order is being processed and will ship soon!\n"
                    + "\nPay2Steal Team";
            //pay2steal@halohello.com

            String emailConfirmation = util.sendEmail("Pay2Steal! order: " + orderNumber + " Thank you!", messageBody, "pay2steal@halohello.com", customerEmail);
            if (emailConfirmation.isEmpty()) {
                request.setAttribute("emailConfirmation", "An email is sent to you to confirm your order.");
            } else {
                //request.setAttribute("emailConfirmation", emailConfirmation);
            }*/

            //kill all sessions
            session.invalidate();

            RequestDispatcher dispatcher
                    = getServletContext().getRequestDispatcher("/orderConfirm.jsp");
            dispatcher.forward(request, response);
        } else {

            request.setAttribute("msg", "Duplicate order number!");

            RequestDispatcher dispatcher
                    = getServletContext().getRequestDispatcher("/IndexServlet");
            dispatcher.forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}