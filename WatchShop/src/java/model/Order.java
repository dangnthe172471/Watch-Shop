/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Order {

    private int oid;
    private String date, dateShip, timeShip, receivedDate;
    private double totalMoney;
    private String email, phone, address;
    private String note;
    private int type, sid;
    private Account account;

    public Order() {
    }

    public Order(int oid, String date, String dateShip, String timeShip, String receivedDate, double totalMoney, String email, String phone, String address, String note, int type, int sid, Account account) {
        this.oid = oid;
        this.date = date;
        this.dateShip = dateShip;
        this.timeShip = timeShip;
        this.receivedDate = receivedDate;
        this.totalMoney = totalMoney;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.type = type;
        this.sid = sid;
        this.account = account;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDateShip() {
        return dateShip;
    }

    public void setDateShip(String dateShip) {
        this.dateShip = dateShip;
    }

    public String getTimeShip() {
        return timeShip;
    }

    public void setTimeShip(String timeShip) {
        this.timeShip = timeShip;
    }

    public String getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(String receivedDate) {
        this.receivedDate = receivedDate;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
