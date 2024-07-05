/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author dung2
 */
public class OrderDetailWithImage {

    private int orderId;
    private String orderDate;
    private String dateShip;
    private String timeShip;
    private String receivedDate;
    private float totalMoney;
    private String email;
    private String phone;
    private String address;
    private String note;
    private String orderStatus;
    private String productName;
    private double productPrice;
    private int quantity;
    private double totalPrice;
    private String productImage;

    public OrderDetailWithImage() {
    }

    public OrderDetailWithImage(int orderId, String orderDate, String dateShip, String timeShip, String receivedDate, float totalMoney, String email, String phone, String address, String note, String orderStatus, String productName, double productPrice, int quantity, double totalPrice, String productImage) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.dateShip = dateShip;
        this.timeShip = timeShip;
        this.receivedDate = receivedDate;
        this.totalMoney = totalMoney;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.orderStatus = orderStatus;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.productImage = productImage;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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

    public String getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(String receivedDate) {
        this.receivedDate = receivedDate;
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

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getFormattedProductPrice() {
        return formatCurrency(productPrice);
    }

    public String getFormattedTotalPrice() {
        return formatCurrency(totalPrice);
    }

    private String formatCurrency(double amount) {
        DecimalFormat formatter = new DecimalFormat("#,###");
        return formatter.format(amount) + " VND";
    }

    public String getFormattedTotalMoney() {
        return formatCurrency(totalMoney);
    }

    @Override
    public String toString() {
        return "OrderDetailWithImage{" + "orderId=" + orderId + ", orderDate=" + orderDate + ", dateShip=" + dateShip + ", timeShip=" + timeShip + ", receivedDate=" + receivedDate + ", totalMoney=" + totalMoney + ", email=" + email + ", phone=" + phone + ", address=" + address + ", note=" + note + ", orderStatus=" + orderStatus + ", productName=" + productName + ", productPrice=" + productPrice + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", productImage=" + productImage + '}';
    }

}
