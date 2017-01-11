/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apputil;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Yonas
 */
public class AppUtil {

    public String sendEmail(String subject, String body, String from, String to) {
        try {
            // 1 - get a mail session
            final String username = "pay2steal@halohello.com";
            final String password = "Cb7tVUCX9z!";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "173.248.149.66");
            props.put("mail.smtp.port", "25");
            //props.put("mail.smtp.connectiontimeout", 600000);

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            // 2 - create a message
            Message message = new MimeMessage(session);
            message.setSubject(subject);
            message.setText(body);

            // 3 - address the message
            Address fromAddress = new InternetAddress(from);
            Address toAddress = new InternetAddress(to);
            message.setFrom(fromAddress);
            message.setRecipient(Message.RecipientType.TO,
                    toAddress);
            // 4 - send the message
            Transport.send(message);
            
            return "";
            
        } catch (MessagingException e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

}