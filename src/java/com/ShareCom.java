/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.Date;


public class ShareCom {
    
    private int  id ;
    private  int share_rate ;
    private int open_rate ;
    
    Date d ;

    public Date getD() {
        return d;
    }

    public void setD(Date d) {
        this.d = d;
    }
public ShareCom(){
    
    
}

    public ShareCom(int share_rate, int open_rate, Date d, int highrate, int lowrate, String email, String comp) {
        this.share_rate = share_rate;
        this.open_rate = open_rate;
        this.d = d;
        this.highrate = highrate;
        this.lowrate = lowrate;
        this.email = email;
        this.comp = comp;
    }
int highrate;
int lowrate ;

    public int getHighrate() {
        return highrate;
    }

    public void setHighrate(int highrate) {
        this.highrate = highrate;
    }

    public int getLowrate() {
        return lowrate;
    }

    public void setLowrate(int lowrate) {
        this.lowrate = lowrate;
    }

   

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
 String email ;
 String comp ;

    public int getId() {
        return id;
    }

    public ShareCom(int id, int share_rate, int open_rate, Date d, int highrate, int lowrate, String email, String comp) {
        this.id = id;
        this.share_rate = share_rate;
        this.open_rate = open_rate;
        this.d = d;
        this.highrate = highrate;
        this.lowrate = lowrate;
        this.email = email;
        this.comp = comp;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShare_rate() {
        return share_rate;
    }

    public void setShare_rate(int share_rate) {
        this.share_rate = share_rate;
    }

    public int getOpen_rate() {
        return open_rate;
    }

    public void setOpen_rate(int open_rate) {
        this.open_rate = open_rate;
    }

   

    public String getComp() {
        return comp;
    }

    public void setComp(String comp) {
        this.comp = comp;
    }
    
    
}
