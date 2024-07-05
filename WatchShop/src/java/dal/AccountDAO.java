/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
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

    public boolean checkAccountUser(String username) {
        String sql = "SELECT [user] FROM Account WHERE [user] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.print("checkAccountExist: " + e.getMessage());
        }
        return false;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT [email] FROM Account WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.print("checkEmailExist: " + e.getMessage());
        }
        return false;
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

    public void AddStaff(Account newUser) {
        String sql = "INSERT INTO Account ([user], [pass], [email], [phone], [Address], [avatar], [roleID], [status]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newUser.getUser());
            st.setString(2, newUser.getPass());
            st.setString(3, newUser.getEmail());
            st.setString(4, newUser.getPhone());
            st.setString(5, newUser.getAddress());
            st.setString(6, newUser.getAvatar());
            st.setInt(7, newUser.getRoleID());
            st.setInt(8, newUser.getStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("AddAccount: " + e.getMessage());
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
            rs = st.executeQuery();
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

    public List<Account> getStaff() {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 2 AND status = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
        } catch (SQLException e) {
            System.out.println("getStaff: " + e.getMessage());
        }
        return accounts;
    }

    public void updateUserStatus(int id, int status) {
        String sql = "UPDATE Account SET status = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateUserStatus: " + e.getMessage());
        }
    }

    public List<Account> getBlockedStaff() {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 2 AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
        } catch (SQLException e) {
            System.out.println("getBlockedStaff: " + e.getMessage());
        }
        return accounts;
    }

    public List<Account> searchStaffByName(String name) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 2 AND status = 0 AND [user] LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
        } catch (SQLException e) {
            System.out.println("searchStaffByName: " + e.getMessage());
        }
        return accounts;
    }

    public List<Account> searchBlockedStaffByName(String name) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 2 AND status = 1 AND [user] LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
        } catch (SQLException e) {
            System.out.println("searchBlockedStaffByName: " + e.getMessage());
        }
        return accounts;
    }

    public void deleteUserPermanently(int id) {
        String sql = "DELETE FROM Account WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteUserPermanently: " + e.getMessage());
        }
    }

    public List<Account> getAllStaffSorted(String sortField, String sortOrder) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 2 AND status = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
            if ("asc".equals(sortOrder)) {
                accounts.sort(Comparator.comparing(a -> getFieldValue(a, sortField)));
            } else {
                accounts.sort(Comparator.comparing(a -> getFieldValue((Account) a, sortField)).reversed());
            }
        } catch (SQLException e) {
            System.out.println("getAllStaffSorted: " + e.getMessage());
        }
        return accounts;
    }

    public List<Account> getAllBlockedStaffSorted(String sortField, String sortOrder) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 2 AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
            if ("asc".equals(sortOrder)) {
                accounts.sort(Comparator.comparing(a -> getFieldValue(a, sortField)));
            } else {
                accounts.sort(Comparator.comparing(a -> getFieldValue((Account) a, sortField)).reversed());
            }
        } catch (SQLException e) {
            System.out.println("getAllBlockedStaffSorted: " + e.getMessage());
        }
        return accounts;
    }

    private Comparable getFieldValue(Account account, String fieldName) {
        switch (fieldName) {
            case "user":
                return account.getUser();
            // Thêm các trường khác nếu cần
            default:
                return account.getUser();
        }
    }

    public List<Account> getStaffByPage(List<Account> sortedAccounts, int page, int pageSize) {
        List<Account> pagedAccounts = new ArrayList<>();
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, sortedAccounts.size());
        for (int i = start; i < end; i++) {
            pagedAccounts.add(sortedAccounts.get(i));
        }
        return pagedAccounts;
    }

    public int getTotalStaff() {
        try {
            String sql = "SELECT COUNT(*) FROM Account WHERE roleID = 2 AND status = 0";
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalStaff: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalBlockedStaff() {
        try {
            String sql = "SELECT COUNT(*) FROM Account WHERE roleID = 2 AND status = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalBlockedStaff: " + e.getMessage());
        }
        return 0;
    }

    public List<Account> getAllShipperSorted(String sortField, String sortOrder) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 3 AND status = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
            if ("asc".equals(sortOrder)) {
                accounts.sort(Comparator.comparing(a -> getFieldValue(a, sortField)));
            } else {
                accounts.sort(Comparator.comparing(a -> getFieldValue((Account) a, sortField)).reversed());
            }
        } catch (SQLException e) {
            System.out.println("getAllShipperSorted: " + e.getMessage());
        }
        return accounts;
    }

    public List<Account> getAllBlockedShipperSorted(String sortField, String sortOrder) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleID = 3 AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
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
                accounts.add(account);
            }
            if ("asc".equals(sortOrder)) {
                accounts.sort(Comparator.comparing(a -> getFieldValue(a, sortField)));
            } else {
                accounts.sort(Comparator.comparing(a -> getFieldValue((Account) a, sortField)).reversed());
            }
        } catch (SQLException e) {
            System.out.println("getAllBlockedShipperSorted: " + e.getMessage());
        }
        return accounts;
    }

    public int getTotalShipper() {
        try {
            String sql = "SELECT COUNT(*) FROM Account WHERE roleID = 3 AND status = 0";
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalShipper: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalBlockedShipper() {
        try {
            String sql = "SELECT COUNT(*) FROM Account WHERE roleID = 3 AND status = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalBlockedShipper: " + e.getMessage());
        }
        return 0;
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
