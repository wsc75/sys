package com.yuntu.pojo;

public class Kind {
    private int k_id;
    private String k_name;
    private int k_mate;
    private int k_crawl;

    public Kind() {
    }

    public Kind(int k_id, String k_name, int k_mate, int k_crawl) {
        this.k_id = k_id;
        this.k_name = k_name;
        this.k_mate = k_mate;
        this.k_crawl = k_crawl;
    }

    public int getK_id() {
        return k_id;
    }

    public void setK_id(int k_id) {
        this.k_id = k_id;
    }

    public String getK_name() {
        return k_name;
    }

    public void setK_name(String k_name) {
        this.k_name = k_name;
    }

    public int getK_mate() {
        return k_mate;
    }

    public void setK_mate(int k_mate) {
        this.k_mate = k_mate;
    }

    public int getK_crawl() {
        return k_crawl;
    }

    public void setK_crawl(int k_crawl) {
        this.k_crawl = k_crawl;
    }
}
