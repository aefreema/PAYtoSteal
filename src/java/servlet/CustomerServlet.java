package servlet;

import customer.Customer;
import dbutil.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.Cart;

/**
 *
 * @author Yonas
 */
public class CustomerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("in CustomerServlet");
        
        DBUtil db = new DBUtil();
        HttpSession session = request.getSession();

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password1");
        String country = request.getParameter("country");
        
        //request is to add a new customer
        if (request.getParameter("hidAction").equals("Create")) {
            db.addCustomer(firstName, lastName, email, password, country);
            request.setAttribute("msg", "Account created successfuly!");

            String url = "/IndexServlet";
            
            //if this login was initiated by the checkout page, 
            //take the user back to the checkout page.
            String checkOutPending = (String) session.getAttribute("bringToCheckoutPage");
            if (checkOutPending != null && checkOutPending.equals("true")) {
                session.setAttribute("bringToCheckoutPage", "false");
                url = "/CheckoutServlet";
            }

            RequestDispatcher dispatcher
                    = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        
        //request is to update customer record
        if (request.getParameter("hidAction").equals("Update")) {
            db.updateCustomer(firstName, lastName, email, password, country);
            
            Customer cust = new Customer();
            //update session
            cust = (Customer) session.getAttribute("customer");

            cust.setFirstName(firstName);
            cust.setLastName(lastName);
            cust.setEmail(email);
            cust.setPassword(password);
            cust.setCountry(country);

            session.setAttribute("customer", cust);

            request.setAttribute("msg", "Account updated successfuly!");

            String url = "/customer.jsp";

            RequestDispatcher dispatcher
                    = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        
        //request is to delete a customer
        if (request.getParameter("hidAction").equals("Delete")) {
            
            db.deleteCustomer(((Customer) session.getAttribute("customer")).getEmail());
            request.setAttribute("msg", "Account deleted successfuly!");

            //auto logout customer.
            session.invalidate(); 
            
            //take to home page
            String url = "/IndexServlet";

            RequestDispatcher dispatcher
                    = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        
        if (request.getParameter("hidAction").equals("Login")) {

            Customer validCust = db.isCustomer(request.getParameter("acctName"), request.getParameter("password"));

            if (validCust != null) {

                if (session.getAttribute("customer") == null) {//session is not yet created so create a new one
                    session.setAttribute("customer", validCust);
                }

                String url = "/customer.jsp?action=Update&email=" + validCust.getEmail();
                
                Customer customer = (Customer) session.getAttribute("customer");
                //pass session variable to the request object
                request.setAttribute("customer", customer);
                
                Order order = new Order();
                List<Cart> cart = new ArrayList<Cart>();
                cart = order.listOrder(customer.getEmail());
                
                request.setAttribute("order", cart);
                

                //if this login was initiated by the checkout page, 
                //take the user back to the checkout page.
                String checkOutPending = (String) session.getAttribute("bringToCheckoutPage");
                if (checkOutPending != null && checkOutPending.equals("true")) {
                    session.setAttribute("bringToCheckoutPage", "false");
                    url = "/CheckoutServlet";
                }

                RequestDispatcher dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);

            } else {
                request.setAttribute("msg", "Invalid login!");

                String url = "/IndexServlet";

                RequestDispatcher dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
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