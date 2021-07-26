package com.yuntu.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class Animal {
    private int a_id;
    private String a_name;
    private int a_sex;
    private int a_k_id;
    private int a_age;
    private Double a_health;
    @JSONField(format = "yyyy-MM-dd")
    private Date a_date;

    private String k_name;

    public Animal() {
    }

    public Animal(String a_name, int a_sex, int a_k_id, int a_age, Double a_health, Date a_date) {
        this.a_name = a_name;
        this.a_sex = a_sex;
        this.a_k_id = a_k_id;
        this.a_age = a_age;
        this.a_health = a_health;
        this.a_date = a_date;
    }

    public Animal(int a_id, String a_name, int a_sex, int a_k_id, int a_age, Double a_health, Date a_date) {
        this.a_id = a_id;
        this.a_name = a_name;
        this.a_sex = a_sex;
        this.a_k_id = a_k_id;
        this.a_age = a_age;
        this.a_health = a_health;
        this.a_date = a_date;
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public int getA_sex() {
        return a_sex;
    }

    public void setA_sex(int a_sex) {
        this.a_sex = a_sex;
    }

    public int getA_k_id() {
        return a_k_id;
    }

    public void setA_k_id(int a_k_id) {
        this.a_k_id = a_k_id;
    }

    public int getA_age() {
        return a_age;
    }

    public void setA_age(int a_age) {
        this.a_age = a_age;
    }

    public Double getA_health() {
        return a_health;
    }

    public void setA_health(Double a_health) {
        this.a_health = a_health;
    }

    public Date getA_date() {
        return a_date;
    }

    public void setA_date(Date a_date) {
        this.a_date = a_date;
    }

    public String getK_name() {
        return k_name;
    }

    public void setK_name(String k_name) {
        this.k_name = k_name;
    }

    @Override
    public String toString() {
        return "Animal{" +
                "a_id=" + a_id +
                ", a_name='" + a_name + '\'' +
                ", a_sex=" + a_sex +
                ", a_k_id=" + a_k_id +
                ", a_age=" + a_age +
                ", a_health=" + a_health +
                ", a_date=" + a_date +
                ", k_name='" + k_name + '\'' +
                '}';
    }
}
