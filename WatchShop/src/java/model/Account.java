/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dung2
 */
public class Account {
     private String id;
    private String avatar;
    private String user;
    private String pass;
    private String email;
    private String phone;
    private String amount;
    private String bought;
    private String address;
    private int status;
    private String roleId;

    public Account() {
    }

    public Account(String id, String avatar, String user, String pass, String email, String phone, String amount, String bought, String address, int status, String roleId) {
        this.id = id;
        this.avatar = avatar;
        this.user = user;
        this.pass = pass;
        this.email = email;
        this.phone = phone;
        this.amount = amount;
        this.bought = bought;
        this.address = address;
        this.status = status;
        this.roleId = roleId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getBought() {
        return bought;
    }

    public void setBought(String bought) {
        this.bought = bought;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", avatar=" + avatar + ", user=" + user + ", pass=" + pass + ", email=" + email + ", phone=" + phone + ", amount=" + amount + ", bought=" + bought + ", address=" + address + ", status=" + status + ", roleId=" + roleId + '}';
    }
    
    
}
