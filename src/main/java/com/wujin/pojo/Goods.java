package com.wujin.pojo;

public class Goods {
    private String id;
    private String goods_name;
    private String price;
    private String describtion;
    private String num;
    private String picture;
    private String manufacturer;
    private String small_type_id;
    private String create_time;
    private String del_flag;
    private  String states;
    private  String score;
    private Small_type small_type;

    public String getSmall_type_id() {
        return small_type_id;
    }

    public void setSmall_type_id(String small_type_id) {
        this.small_type_id = small_type_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getdescribtion() {
        return describtion;
    }

    public void setdescribtion(String describtion) {
        this.describtion = describtion;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(String del_flag) {
        this.del_flag = del_flag;
    }

    public String getstates() {
        return states;
    }

    public void setstates(String states) {
        this.states = states;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public Small_type getSmall_type() {
        return small_type;
    }

    public void setSmall_type(Small_type small_type) {
        this.small_type = small_type;
    }
}
