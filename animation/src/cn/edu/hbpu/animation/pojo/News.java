package cn.edu.hbpu.animation.pojo;

import java.util.Date;

public class News {
    private Integer newsid;

    private Integer tid;

    private String title;

    private String author;

    private Date date;

    private Integer readnum;

    private String newsfrom;

    private String content;

    private Integer isdel;

    private Integer isbroadcast;

    private Integer isweek;

    private Integer ishot;

    private String pictures;
    
	public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getReadnum() {
        return readnum;
    }

    public void setReadnum(Integer readnum) {
        this.readnum = readnum;
    }

    public String getNewsfrom() {
        return newsfrom;
    }

    public void setNewsfrom(String newsfrom) {
        this.newsfrom = newsfrom == null ? null : newsfrom.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public Integer getIsbroadcast() {
        return isbroadcast;
    }

    public void setIsbroadcast(Integer isbroadcast) {
        this.isbroadcast = isbroadcast;
    }

    public Integer getIsweek() {
        return isweek;
    }

    public void setIsweek(Integer isweek) {
        this.isweek = isweek;
    }

    public Integer getIshot() {
        return ishot;
    }

    public void setIshot(Integer ishot) {
        this.ishot = ishot;
    }

    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures == null ? null : pictures.trim();
    }
}