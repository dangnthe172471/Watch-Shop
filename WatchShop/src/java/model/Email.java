/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

/**
 *
 * @author dung2
 */
public class Email {

    private final String eFrom = "shoesshop193@gmail.com";
    private final String ePass = "lezr tpnq quwj vexs";

    public void sendEmail(String subject, String messgage, String to) {
        try {

        } catch (Exception e) {
        }
        // Properties
        Properties props = new Properties();

        //Su dung server nao de gui mail- smtp host
        props.put("mail.smtp.host", "smtp.gmail.com");

        // TLS 587 SSL 465
        props.put("mail.smtp.port", "smtp.gmail.com");

        // dang nhap
        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");

        //dang nhap tai khoan
        Authenticator au = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(eFrom, ePass);
            }

        };
        // phien lam viec
        Session session = Session.getInstance(props, au);

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML, charset=UTF-8");
            msg.setFrom(new InternetAddress(eFrom));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            // tieu de
            msg.setSubject(subject, "UTF-8");
            // Noi dung
            msg.setContent(messgage, "text/html; charset=UTF-8");
            // Gui email
            Transport.send(msg);
        } catch (MessagingException e) {
            System.out.println("Send email failed");
        }
    }

    // Tiêu đề
    public String subjectOrder(String fullName) {
        return "Hi, " + fullName + ", thanks for your order from Shoes Shop!";
    }

    public String forgotAccount(String fullName) {
        return "Hi, " + fullName + ", gửi bạn mật khẩu!";
    }

    // nội dung
    public String messageOrder(LocalDateTime date, double totalMoney, String phone, String name, String address) {
        return """
               <!DOCTYPE html>
               <html lang="en">
               <head>
                 <meta charset="utf-8">
                 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                 <meta name="viewport" content="width=device-width, initial-scale=1.0">
                 <style>
                   body {
                     font-family: Arial, sans-serif;
                     background-color: #f4f4f4;
                     margin: 0;
                     padding: 0;
                   }
               
                   .email-container {
                     max-width: 600px;
                     margin: 20px auto;
                     background-color: #fff;
                     border-radius: 8px;
                     overflow: hidden;
                     box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                   }
               
                   .header {
                     background-color: #3498db;
                     color: #fff;
                     padding: 20px;
                     text-align: center;
                   }
               
                   .content {
                     padding: 20px;
                     border: 5px solid #3498db;
                   }
               
                    .content p{
                               color: black;
                    }
               
                   .discount-code {
                     background-color: #e74c3c;
                     color: #fff;
                     padding: 10px;
                     text-align: center;
                     margin-bottom: 20px;
                     font-size: 20px;
                     border-radius: 4px;
                   }
               
                   .footer {
                     background-color: #3498db;
                     color: #fff;
                     padding: 10px;
                     text-align: center;
                   }
                 </style>
               </head>
               <body>
                 <div class="email-container">
                   <div class="header">
                    <h1>Shoes Shop</h1>
                    <h4>Xác nhận đặt hàng thành công!</h4>
                    </div>
                   <div class="content">
                     <h3>Chi tiết đơn hàng:</h3>
                     <p>Thời gian đặt hàng: """ + date + "</p>\n"
                + "<p>Tổng tiền đơn hàng: " + totalMoney + "$</p>\n"
                + "<p>Người đặt hàng: " + name + "</p>\n"
                + "<p>Số điện thoại: " + phone + "</p>\n"
                + "<p>Địa chỉ: " + address + "</p>\n"
                + "<p>Cảm ơn bạn đã tin tưởng và đặt hàng tại Shoes Shop!</p>\n"
                + "<p>Mọi thắc mắc xin liên hệ với chúng tôi qua:</p><P>Hotline: 0962900476 hoặc Email: shoesshop193@gmail.com.</p>\n"
                + "<p>Chúng tôi sẽ cố gắng phản hồi bạn sớm nhất có thể!</p>\n"
                + "</div>\n"
                + "<div class=\"footer\">\n"
                + "</div>\n"
                + "</div>\n"
                + "</body>\n"
                + "</html>";
    }

    public String messagePass(LocalDateTime date, String name, String pass) {
        return """
               <!DOCTYPE html>
               <html lang="en">
               <head>
                 <meta charset="utf-8">
                 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                 <meta name="viewport" content="width=device-width, initial-scale=1.0">
                 <style>
                   body {
                     font-family: Arial, sans-serif;
                     background-color: #f4f4f4;
                     margin: 0;
                     padding: 0;
                   }
               
                   .email-container {
                     max-width: 600px;
                     margin: 20px auto;
                     background-color: #fff;
                     border-radius: 8px;
                     overflow: hidden;
                     box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                   }
               
                   .header {
                     background-color: #3498db;
                     color: #fff;
                     padding: 20px;
                     text-align: center;
                   }
               
                   .content {
                     padding: 20px;
                     border: 5px solid #3498db;
                   }
               
                    .content p{
                               color: black;
                    }
               
                   .discount-code {
                     background-color: #e74c3c;
                     color: #fff;
                     padding: 10px;
                     text-align: center;
                     margin-bottom: 20px;
                     font-size: 20px;
                     border-radius: 4px;
                   }
               
                   .footer {
                     background-color: #3498db;
                     color: #fff;
                     padding: 10px;
                     text-align: center;
                   }
                 </style>
               </head>
               <body>
                 <div class="email-container">
                   <div class="header">
                    <h1>Watch Shop</h1>
                    <h4>Cấp lại mật khẩu!</h4>
                    </div>
                   <div class="content">
                     <p>Thời gian cấp lại mật khẩu: """ + date + "</p>\n"
                + "<p>Tên tài khoản: " + name + "</p>\n"
                + "<p>Mật khẩu: " + pass + "</p>\n"
                + "<p>Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của Shoes Shop!</p>\n"
                + "<p>Mọi thắc mắc xin liên hệ với chúng tôi qua:</p><P>Hotline: 0962900476 hoặc Email: shoesshop193@gmail.com.</p>\n"
                + "<p>Chúng tôi sẽ cố gắng phản hồi bạn sớm nhất có thể!</p>\n"
                + "</div>\n"
                + "<div class=\"footer\">\n"
                + "</div>\n"
                + "</div>\n"
                + "</body>\n"
                + "</html>";
    }
}
