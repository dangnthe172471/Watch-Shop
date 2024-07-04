/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Order;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public void addOrder(Account u, Cart cart, String email, String phone, String address, String note, String dateShip, String timeShip) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            // add vào bảng Order
            String sql = "INSERT [dbo].[Order] ([aid], [date], [dateShip], [timeShip] , [receivedDate], [totalMoney], [email] , [phone], [address],[note], [sid]) Values (?,?,?,?,N'',?,?,?,?,?,1)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setString(2, date);
            st.setString(3, dateShip);
            st.setString(4, timeShip);
            st.setDouble(5, cart.getTotalMoney());
            st.setString(6, email);
            st.setString(7, phone);
            st.setString(8, address);
            st.setString(9, note);
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
        int totalQuantity = 0;
        // Tính tổng số lượng các items
        for (Item i : cart.getItems()) {
            totalQuantity += i.getQuantity();
        }

        String sql = """
                        Update [dbo].[Account] set [amount]=?,[bought]=?
                        where [id]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, u.getAmount() - cart.getTotalMoney());
            st.setInt(2, u.getBought() + totalQuantity);
            st.setInt(3, u.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            // Handle exception here
        }
    }

    public void updateBought(Account u, Cart cart) {
        int totalQuantity = 0;
        // Tính tổng số lượng các items
        for (Item i : cart.getItems()) {
            totalQuantity += i.getQuantity();
        }

        String sql = """
                        Update [dbo].[Account] set [bought]=?
                        where [id]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getBought() + totalQuantity);
            st.setInt(2, u.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            // Handle exception here
        }
    }

    public void CompletedOrderId(String oid) {
        String sql = "UPDATE [dbo].[Order] SET [sid] = 2 WHERE [id] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AcceptOrderId(String oid) {
        String sql = "UPDATE [dbo].[Order] SET [sid] = 3 WHERE [id] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void CanceledOrderId(String oid) {
        String sql = "UPDATE [dbo].[Order] SET [sid] = 4 WHERE [id] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrderPending() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Order] o inner join [Account] a on (a.id=o.aid) where sid = 1 order by date desc";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Account a = new Account(rs.getInt(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getDouble(19), rs.getInt(20), rs.getString(21), rs.getInt(22), rs.getInt(23), rs.getString(24));
                o.setOid(rs.getInt(1));
                o.setAccount(a);
                o.setDate(rs.getString(3));
                o.setDateShip(rs.getString(4));
                o.setTimeShip(rs.getString(5));
                o.setReceivedDate(rs.getString(6));
                o.setTotalMoney(rs.getDouble(7));
                o.setEmail(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setAddress(rs.getString(10));
                o.setNote(rs.getString(11));
                o.setSid(rs.getInt(12));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrderAccept() {
        List<Order> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [Order] o inner join [Account] a on (a.id=o.aid) where sid = 3 order by date desc";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Account a = new Account(rs.getInt(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getDouble(19), rs.getInt(20), rs.getString(21), rs.getInt(22), rs.getInt(23), rs.getString(24));
                o.setOid(rs.getInt(1));
                o.setAccount(a);
                o.setDate(rs.getString(3));
                o.setDateShip(rs.getString(4));
                o.setTimeShip(rs.getString(5));
                o.setReceivedDate(rs.getString(6));
                o.setTotalMoney(rs.getDouble(7));
                o.setEmail(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setAddress(rs.getString(10));
                o.setNote(rs.getString(11));
                o.setSid(rs.getInt(12));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrderCompleted() {
        List<Order> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [Order] o inner join [Account] a on (a.id=o.aid) where sid = 2 order by date desc";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Account a = new Account(rs.getInt(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getDouble(19), rs.getInt(20), rs.getString(21), rs.getInt(22), rs.getInt(23), rs.getString(24));
                o.setOid(rs.getInt(1));
                o.setAccount(a);
                o.setDate(rs.getString(3));
                o.setDateShip(rs.getString(4));
                o.setTimeShip(rs.getString(5));
                o.setReceivedDate(rs.getString(6));
                o.setTotalMoney(rs.getDouble(7));
                o.setEmail(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setAddress(rs.getString(10));
                o.setNote(rs.getString(11));
                o.setSid(rs.getInt(12));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrderCanceled() {
        List<Order> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [Order] o inner join [Account] a on (a.id=o.aid) where sid = 4";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Account a = new Account(rs.getInt(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getDouble(19), rs.getInt(20), rs.getString(21), rs.getInt(22), rs.getInt(23), rs.getString(24));
                o.setOid(rs.getInt(1));
                o.setAccount(a);
                o.setDate(rs.getString(3));
                o.setDateShip(rs.getString(4));
                o.setTimeShip(rs.getString(5));
                o.setReceivedDate(rs.getString(6));
                o.setTotalMoney(rs.getDouble(7));
                o.setEmail(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setAddress(rs.getString(10));
                o.setNote(rs.getString(11));
                o.setSid(rs.getInt(12));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
