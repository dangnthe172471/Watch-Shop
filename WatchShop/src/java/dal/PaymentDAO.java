/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Payment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author admin
 */
public class PaymentDAO extends DBContext {

    public void addPayment(Payment p) {
        String sql = "INSERT INTO [payment]([vnp_TxnRef], [vnp_Amount], [vnp_OrderInfo], [vnp_ResponseCode], [vnp_TransactionNo], [vnp_BankCode], [vnp_PayDate], [vnp_TransactionStatus], [aid])"
                + "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getVnp_TxnRef());
            st.setString(2, p.getVnp_Amount());
            st.setString(3, p.getVnp_OrderInfo());
            st.setString(4, p.getVnp_ResponseCode());
            st.setString(5, p.getVnp_TransactionNo());
            st.setString(6, p.getVnp_BankCode());
            st.setString(7, p.getVnp_PayDate());
            st.setString(8, p.getVnp_TransactionStatus());
            st.setInt(9, p.getAid());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
