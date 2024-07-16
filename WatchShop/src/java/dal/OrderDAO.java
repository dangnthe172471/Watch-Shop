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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.OrderDetailWithImage;
import model.Product;

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
        String sql = "UPDATE [dbo].[Order]\n"
                + "SET [sid] = 4, [receivedDate] = CONVERT(varchar, GETDATE(), 23)\n"
                + "WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AssignOrderToShipper(String username, String oid) {
        String sql = "INSERT INTO [Projectswp].[dbo].[ShippingHistory] ([aid], [oid])\n"
                + "VALUES \n"
                + "(?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, oid);
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

    public List<Order> getOrderCompleted() {
        List<Order> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [Order] o inner join [Account] a on (a.id=o.aid) where sid = 4 order by date desc";
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

    public List<Order> getOrderDelivering() {
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

    public List<Order> getOrderCanceled() {
        List<Order> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [Order] o inner join [Account] a on (a.id=o.aid) where sid = 5";
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

    public List<Order> getOrderOfShiper(int id) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "  select *\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN [dbo].[Account] a \n"
                    + "ON o.aid = a.id\n"
                    + "JOIN [dbo].[ShippingHistory] sh\n"
                    + "ON o.id = sh.oid\n"
                    + "where sh.aid = ? and o.sid = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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

    public List<Order> getOrderOfShiperAcc(int id) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "  select *\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN [dbo].[Account] a \n"
                    + "ON o.aid = a.id\n"
                    + "JOIN [dbo].[ShippingHistory] sh\n"
                    + "ON o.id = sh.oid\n"
                    + "where sh.aid = ? and o.sid = 2";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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

    public List<Order> getOrderOfShiperDelivering(int id) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "  select *\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN [dbo].[Account] a \n"
                    + "ON o.aid = a.id\n"
                    + "JOIN [dbo].[ShippingHistory] sh\n"
                    + "ON o.id = sh.oid\n"
                    + "where sh.aid = ? and o.sid = 3";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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

    public List<Order> getOrderOfShiperCom(int id) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "  select *\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN [dbo].[Account] a \n"
                    + "ON o.aid = a.id\n"
                    + "JOIN [dbo].[ShippingHistory] sh\n"
                    + "ON o.id = sh.oid\n"
                    + "where sh.aid = ? and o.sid = 4";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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

    public List<OrderDetailWithImage> getOrdersByUsername(String username) {
        List<OrderDetailWithImage> list = new ArrayList<>();
        try {
            String sql = "SELECT o.id AS OrderID, o.date AS OrderDate, o.dateShip AS DateShip, o.timeShip AS TimeShip, "
                    + "o.receivedDate AS ReceivedDate, o.totalMoney AS TotalMoney, o.email AS Email, o.phone AS Phone, "
                    + "o.address AS Address, o.note AS Note, s.status AS OrderStatus, p.name AS ProductName, p.price AS ProductPrice, "
                    + "od.quantity AS Quantity, (p.price * od.quantity) AS TotalPrice, ip.image1 AS ProductImage "
                    + "FROM [Order] o "
                    + "JOIN [OrderDetail] od ON o.id = od.oid "
                    + "JOIN [product] p ON od.pid = p.id "
                    + "JOIN [Account] a ON o.aid = a.id "
                    + "JOIN [Status] s ON o.sid = s.id "
                    + "JOIN [ImageProduct] ip ON p.id = ip.pid "
                    + "WHERE a.[user] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetailWithImage orderDetail = new OrderDetailWithImage();
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setDateShip(rs.getString("DateShip"));
                orderDetail.setTimeShip(rs.getString("TimeShip"));
                orderDetail.setReceivedDate(rs.getString("ReceivedDate"));
                orderDetail.setTotalMoney(rs.getFloat("TotalMoney"));
                orderDetail.setEmail(rs.getString("Email"));
                orderDetail.setPhone(rs.getString("Phone"));
                orderDetail.setAddress(rs.getString("Address"));
                orderDetail.setNote(rs.getString("Note"));
                orderDetail.setOrderStatus(rs.getString("OrderStatus"));
                orderDetail.setProductName(rs.getString("ProductName"));
                orderDetail.setProductPrice(rs.getDouble("ProductPrice"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                orderDetail.setTotalPrice(rs.getDouble("TotalPrice"));
                orderDetail.setProductImage(rs.getString("ProductImage"));
                list.add(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<OrderDetailWithImage> getOrdersByUsernameAndStatus(String username, String status) {
        List<OrderDetailWithImage> list = new ArrayList<>();
        try {
            String sql = "SELECT o.id AS OrderID, o.date AS OrderDate, o.dateShip AS DateShip, o.timeShip AS TimeShip, "
                    + "o.receivedDate AS ReceivedDate, o.totalMoney AS TotalMoney, o.email AS Email, o.phone AS Phone, "
                    + "o.address AS Address, o.note AS Note, s.status AS OrderStatus, p.name AS ProductName, p.price AS ProductPrice, "
                    + "od.quantity AS Quantity, (p.price * od.quantity) AS TotalPrice, ip.image1 AS ProductImage "
                    + "FROM [Order] o "
                    + "JOIN [OrderDetail] od ON o.id = od.oid "
                    + "JOIN [product] p ON od.pid = p.id "
                    + "JOIN [Account] a ON o.aid = a.id "
                    + "JOIN [Status] s ON o.sid = s.id "
                    + "JOIN [ImageProduct] ip ON p.id = ip.pid "
                    + "WHERE a.[user] = ? AND s.status = ? "
                    + "ORDER BY o.date DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetailWithImage orderDetail = new OrderDetailWithImage();
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setDateShip(rs.getString("DateShip"));
                orderDetail.setTimeShip(rs.getString("TimeShip"));
                orderDetail.setReceivedDate(rs.getString("ReceivedDate"));
                orderDetail.setTotalMoney(rs.getFloat("TotalMoney"));
                orderDetail.setEmail(rs.getString("Email"));
                orderDetail.setPhone(rs.getString("Phone"));
                orderDetail.setAddress(rs.getString("Address"));
                orderDetail.setNote(rs.getString("Note"));
                orderDetail.setOrderStatus(rs.getString("OrderStatus"));
                orderDetail.setProductName(rs.getString("ProductName"));
                orderDetail.setProductPrice(rs.getDouble("ProductPrice"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                orderDetail.setTotalPrice(rs.getDouble("TotalPrice"));
                orderDetail.setProductImage(rs.getString("ProductImage"));
                list.add(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<OrderDetailWithImage> getOrderDetailsByOrderId(String orderId) {
        List<OrderDetailWithImage> productList = new ArrayList<>();
        try {
            String sql = "SELECT o.id AS OrderID, o.date AS OrderDate, o.dateShip AS DateShip, o.timeShip AS TimeShip, "
                    + "o.receivedDate AS ReceivedDate, o.totalMoney AS TotalMoney, o.email AS Email, o.phone AS Phone, "
                    + "o.address AS Address, o.note AS Note, s.status AS OrderStatus, p.name AS ProductName, p.price AS ProductPrice, "
                    + "od.quantity AS Quantity, (p.price * od.quantity) AS TotalPrice, ip.image1 AS ProductImage "
                    + "FROM [Order] o "
                    + "JOIN [OrderDetail] od ON o.id = od.oid "
                    + "JOIN [product] p ON od.pid = p.id "
                    + "JOIN [Status] s ON o.sid = s.id "
                    + "JOIN [ImageProduct] ip ON p.id = ip.pid "
                    + "WHERE o.id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderDetailWithImage orderDetail = new OrderDetailWithImage();
                orderDetail.setOrderId(rs.getInt("OrderID"));
                orderDetail.setOrderDate(rs.getString("OrderDate"));
                orderDetail.setDateShip(rs.getString("DateShip"));
                orderDetail.setTimeShip(rs.getString("TimeShip"));
                orderDetail.setReceivedDate(rs.getString("ReceivedDate"));
                orderDetail.setTotalMoney(rs.getFloat("TotalMoney"));
                orderDetail.setEmail(rs.getString("Email"));
                orderDetail.setPhone(rs.getString("Phone"));
                orderDetail.setAddress(rs.getString("Address"));
                orderDetail.setNote(rs.getString("Note"));
                orderDetail.setOrderStatus(rs.getString("OrderStatus"));
                orderDetail.setProductName(rs.getString("ProductName"));
                orderDetail.setProductPrice(rs.getDouble("ProductPrice"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                orderDetail.setTotalPrice(rs.getDouble("TotalPrice"));
                orderDetail.setProductImage(rs.getString("ProductImage"));

                productList.add(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }

    public boolean cancelOrder(String orderId) {
        String sql = "UPDATE [Order] SET [sid] = 5 WHERE [id] = ? AND [sid] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderId);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteOrder(String orderId) {
        String sql = "DELETE FROM [Order] WHERE [id] = ? AND [sid] = 5"; // 5 là trạng thái "Đã hủy"
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, orderId);
            int rowsDeleted = st.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void assignShipperToOrder(String oid, String shipperId) {
        String sql = "UPDATE [Order] SET shipperId = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shipperId);
            st.setString(2, oid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("assignShipperToOrder: " + e.getMessage());
        }
    }

    public List<Map<String, Object>> getOrderWithShipper() {
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            String sql = "SELECT o.*, s.user as shipperName FROM [Order] o LEFT JOIN [Account] s ON o.shipperId = s.id";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Map<String, Object> orderData = new HashMap<>();
                Order o = new Order();
                Account a = new Account(rs.getInt("aid"), rs.getString("avatar"), rs.getString("user"), rs.getString("pass"), rs.getString("email"), rs.getString("phone"), rs.getDouble("amount"), rs.getInt("bought"), rs.getString("address"), rs.getInt("status"), rs.getInt("roleID"), rs.getString("token"));
                o.setOid(rs.getInt("id"));
                o.setAccount(a);
                o.setDate(rs.getString("date"));
                o.setDateShip(rs.getString("dateShip"));
                o.setTimeShip(rs.getString("timeShip"));
                o.setReceivedDate(rs.getString("receivedDate"));
                o.setTotalMoney(rs.getDouble("totalMoney"));
                o.setEmail(rs.getString("email"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                o.setSid(rs.getInt("sid"));

                orderData.put("order", o);
                orderData.put("shipperName", rs.getString("shipperName"));

                list.add(orderData);
            }
        } catch (Exception e) {
            System.out.println("getOrderWithShipper: " + e.getMessage());
        }
        return list;
    }

    public boolean isProductAvailable(int pid, int requiredQuantity) {
        String sql = "SELECT quantity FROM [product] WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            rs = st.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt(1);
                if (currentQuantity >= requiredQuantity) {
                    return true;
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    public int getOrderID(int aid) {
        String sql = "select top 1 * from [Order]\n"
                + "where aid = ? order by [id] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }
}
