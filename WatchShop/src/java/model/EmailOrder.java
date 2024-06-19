/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Properties;

/**
 *
 * @author admin
 */
public class EmailOrder {

    private final String eFrom = "watchshop1804@gmail.com";
    private final String ePass = "krhq vohz saxg chlc";

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
        return "Hi, " + fullName + ", thanks for your order from Watch Shop!";
    }

    // nội dung
    public static String messageOrder(LocalDateTime date, String totalMoney, String phone, String name, String address, String note, Cart cart) {
        String content = """
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
                     <p style="font-weight: bold">Thời gian đặt hàng: """ + date + "</p>\n"
                + "<p style=\"font-weight: bold\">Người đặt hàng: " + name + "</p>\n"
                + " <p style=\"font-weight: bold\">Sản phẩm: </p>\n";
        for (Item i : cart.getItems()) {
            content += "<p>" + i.getProduct().getName() + " &nbsp;&nbsp;X&nbsp;&nbsp; " + i.getQuantity() + " Sản phẩm </p>\n";
        }
        content += "<p style=\"font-weight: bold\">Tổng tiền đơn hàng: " + totalMoney + " vnđ</p>\n"
                + "<p style=\"font-weight: bold\">Số điện thoại: " + phone + "</p>\n"
                + "<p style=\"font-weight: bold\">Địa chỉ: " + address + "</p>\n"
                + "<p style=\"font-weight: bold\">Ghi chú: " + note + "</p>\n"
                + "<p>Cảm ơn bạn đã tin tưởng và đặt hàng tại Watch Shop!</p>\n"
                + "<p>Mọi thắc mắc xin liên hệ với chúng tôi qua:</p><P>Hotline: 0962900476 hoặc Email: watchshop1804@gmail.com.</p>\n"
                + "<p>Chúng tôi sẽ cố gắng phản hồi bạn sớm nhất có thể!</p>\n"
                + "</div>\n"
                + "<div class=\"footer\">\n"
                + "</div>\n"
                + "</div>\n"
                + "</body>\n"
                + "</html>";
        return content;
    }
}
