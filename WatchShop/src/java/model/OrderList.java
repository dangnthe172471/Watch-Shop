/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quyld
 */
public class OrderList {
    private int orderId;
    private String customer;
    private String orderDate;
    private String dateShip;
    private String timeShip;
    private float totalMoney;
    private String email;
    private String phone;
    private String address;
    private String note;
    private String shipper;

    public OrderList() {
    }

    public OrderList(int orderId, String customer, String orderDate, String dateShip, String timeShip, float totalMoney, String email, String phone, String address, String note, String shipper) {
        this.orderId = orderId;
        this.customer = customer;
        this.orderDate = orderDate;
        this.dateShip = dateShip;
        this.timeShip = timeShip;
        this.totalMoney = totalMoney;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.shipper = shipper;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
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

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
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

    public String getShipper() {
        return shipper;
    }

    public void setShipper(String shipper) {
        this.shipper = shipper;
    }

    @Override
    public String toString() {
        return "OrderList{" + "orderId=" + orderId + ", customer=" + customer + ", orderDate=" + orderDate + ", dateShip=" + dateShip + ", timeShip=" + timeShip + ", totalMoney=" + totalMoney + ", email=" + email + ", phone=" + phone + ", address=" + address + ", note=" + note + ", shipper=" + shipper + '}';
    }
    
}
