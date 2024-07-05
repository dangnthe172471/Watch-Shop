/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public Account checkAccount(String username, String password) {
        try {
            String strSQL = "SELECT * FROM Account WHERE [user]=? AND [pass]=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12));
            }
        } catch (Exception e) {
            System.out.print("checkAccount:" + e.getMessage());
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        String sql = "SELECT \n"
                + "      [user]\n"
                + "      ,[pass]\n"
                + "      \n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE [user]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.print("checkAccountExist:" + e.getMessage());
        }
        return null;
    }

    public void AddAccount(Account newUser) {
        try {

            String strSQL = "INSERT INTO [dbo].[Account] ([user], [pass], [email], [phone], [Address], [roleID]) VALUES (?, ?, ?, ?, ?, '4')";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, newUser.getUser());
            stm.setString(2, newUser.getPass());
            stm.setString(3, newUser.getEmail());
            stm.setString(4, newUser.getPhone());
            stm.setString(5, newUser.getAddress());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.print("AddAccount:" + e.getMessage());
        }
    }

    public void AddAccountByGG(Account newUser) {
        try {
            String strSQL = "INSERT INTO [dbo].[Account]([avatar], [user], [pass], [email], [phone], [amount], [bought], [Address], [status], [roleID], [token])\n"
                    + "VALUES (?, ?, ?, ?, ?, 0, 0, ?, 0, 4, ?)";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, newUser.getAvatar());
            stm.setString(2, newUser.getUser());
            stm.setString(3, newUser.getPass());
            stm.setString(4, newUser.getEmail());
            stm.setString(5, newUser.getPhone());
            stm.setString(6, newUser.getAddress());
            stm.setString(7, newUser.getToken());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.print("AddAccount:" + e.getMessage());
        }
    }

    public void changepass(Account user) {
        String sql = "UPDATE [dbo].[Account] SET [pass] = ? WHERE [user] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getPass());
            st.setString(2, user.getUser());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account forgotAccount(String user, String email) {
        String sql = "SELECT * FROM account WHERE [user] = ? AND [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, email);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)
                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account checkToken(String token) {
        String sql = "SELECT * FROM Account WHERE token = ?";
        try {
            System.out.println("Executing SQL: " + sql);
            System.out.println("With token: " + token);

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                System.out.println("Token found in database.");
                return new Account(
                        rs.getInt("id"),
                        rs.getString("avatar"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDouble("amount"),
                        rs.getInt("bought"),
                        rs.getString("Address"),
                        rs.getInt("status"),
                        rs.getInt("roleID"),
                        rs.getString("token")
                );
            } else {
                System.out.println("Token not found in database.");
            }
        } catch (SQLException e) {
            System.out.println("checkToken: " + e.getMessage());
        }
        return null;
    }

    public Account checkEmail(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try {
            System.out.println("Executing SQL: " + sql);
            System.out.println("With email: " + email);

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                System.out.println("Email found in database.");
                return new Account(
                        rs.getInt("id"),
                        rs.getString("avatar"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDouble("amount"),
                        rs.getInt("bought"),
                        rs.getString("Address"),
                        rs.getInt("status"),
                        rs.getInt("roleID"),
                        rs.getString("token")
                );
            } else {
                System.out.println("Email not found in database.");
            }
        } catch (SQLException e) {
            System.out.println("checkEmail: " + e.getMessage());
        }
        return null;
    }

    public void updateAccountAvatar(Account account) {
        String sql = "UPDATE Account SET avatar = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Thêm tiền tố "/img/" vào avatar nếu chưa có
            String avatarPath = account.getAvatar();
            if (!avatarPath.startsWith("img/")) {
                avatarPath = "img/" + avatarPath;
            }

            st.setString(1, avatarPath);
            st.setInt(2, account.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateAccountAvatar: " + e.getMessage());
        }
    }

    public boolean updateContact(String email, String newEmail, String newPhone) {
        String sql = "UPDATE account SET email = ?, phone = ? WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newEmail);
            st.setString(2, newPhone);
            st.setString(3, email);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.err.println("Error updating contact information: " + ex.getMessage());
            return false;
        }
    }

    public boolean updateAccountAddress(Account account) {
        String sql = "UPDATE Account SET Address = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getAddress());
            st.setInt(2, account.getId());
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("updateAccountAddress: " + e.getMessage());
            return false;
        }
    }
    public List<Account> getAllCustomer() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account where roleID = 4 and status = 0";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllCustomerBlock() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account where roleID = 4 and status = 1";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void blockCustomerById(String bid) {
        String sql = "UPDATE [dbo].[Account] SET [status] = 1 WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void restoreCustomerById(String bid) {
        String sql = "UPDATE [dbo].[Account] SET [status] = 0 WHERE [id] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

}
