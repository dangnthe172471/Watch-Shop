/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Account;
import model.Cart;
import model.Item;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public void addOrder(Account u, Cart cart, String address) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            // add vào bảng Order
            String sql = "INSERT [dbo].[Order] ([aid], [date], [totalMoney], [address], [sid]) Values (?,?,?,?,1)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.setString(4, address);
            st.executeUpdate();

            // lấy ra id order vừa add
            String sql1 = " select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            // add vào bảng orderline
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = """
                                  INSERT [dbo].[OrderDetail]([oid],[pid],[quantity],[price]) Values (?,?,?,?)
                                  Update [dbo].[product] set [quantity]=?,[sold]=?
                                  where [id]=?""";

                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.setInt(5, i.getProduct().getQuantity() - i.getQuantity());
                    st2.setInt(6, i.getProduct().getSold() + i.getQuantity());
                    st2.setInt(7, i.getProduct().getId());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
        }
    }

    public void updateAmount(Account u, Cart cart) {
        for (Item i : cart.getItems()) {
            String sql = """
                    Update [dbo].[Account] set [amount]=?,[bought]=?
                    where [id]=?""";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setDouble(1, u.getAmount() - cart.getTotalMoney());
                st.setInt(2, u.getBought() + i.getQuantity());
                st.setInt(3, u.getId());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        }
    }
}
