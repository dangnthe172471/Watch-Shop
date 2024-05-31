/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Product {

    private int id;
    private String code;
    private String name;
    private double price;
    private int quantity;
    private int sold;
    private Date releaseDate;
    private String description;
    private double rate;
    private int cateID1;
    private int cateID2;
    private int cateID3;
    private int brandID;
    private ImageProduct pimage;

    public Product() {
    }

    public Product(int id, String code, String name, double price, int quantity, int sold, Date releaseDate, String description, double rate, int cateID1, int cateID2, int cateID3, int brandID, ImageProduct pimage) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.sold = sold;
        this.releaseDate = releaseDate;
        this.description = description;
        this.rate = rate;
        this.cateID1 = cateID1;
        this.cateID2 = cateID2;
        this.cateID3 = cateID3;
        this.brandID = brandID;
        this.pimage = pimage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public int getCateID1() {
        return cateID1;
    }

    public void setCateID1(int cateID1) {
        this.cateID1 = cateID1;
    }

    public int getCateID2() {
        return cateID2;
    }

    public void setCateID2(int cateID2) {
        this.cateID2 = cateID2;
    }

    public int getCateID3() {
        return cateID3;
    }

    public void setCateID3(int cateID3) {
        this.cateID3 = cateID3;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public ImageProduct getPimage() {
        return pimage;
    }

    public void setPimage(ImageProduct pimage) {
        this.pimage = pimage;
    }

}
