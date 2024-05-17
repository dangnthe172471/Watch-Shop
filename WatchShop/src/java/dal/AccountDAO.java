/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
            String strSQL = """
                    SELECT *
                    FROM Account 
                    WHERE id IS NOT NULL 
                    AND id NOT IN (
                        SELECT a.id 
                        FROM Account a 
                        INNER JOIN Block b ON (b.aid = a.id)
                    ) and [user]=? and pass = ?""";
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
                        rs.getInt(11));
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
                Account account = new Account();
                account.setUser(rs.getString("user"));
                account.setPass(rs.getString("pass"));

                return account;
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

}
