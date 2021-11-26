package com.wujin.pojo;

public class Small_type {
    private String id;
    private String big_type_id;

    private String type_name;
    private String create_time;
    private String del_flag;
    private Big_type big_type;


    public String getBig_type_id() {
        return big_type_id;
    }

    public void setBig_type_id(String big_type_id) {
        this.big_type_id = big_type_id;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getcreate_time() {
        return create_time;
    }

    public void setcreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(String del_flag) {
        this.del_flag = del_flag;
    }

    public Big_type getBig_type() {
        return big_type;
    }

    public void setBig_type(Big_type big_type) {
        this.big_type = big_type;
    }

}
