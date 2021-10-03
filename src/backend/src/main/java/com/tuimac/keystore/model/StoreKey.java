package com.tuimac.keystore

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class StoreKey {
    
    private String keyname;
    private String keyUsername;
    private String keyPassword;
    private String memo;
    private String genre;

    public StoreKey() {}

    public String getKeyname() {
        return keyname;
    }

    public void setKeyname(String keyname) {
        this.keyname = keyname;
    }

    public String getKeyUsername() {
        return keyUsername;
    }

    public void setKeyUsername(String keyUsername) {
        this.keyUsername = keyUsername;
    }

    public String getKeyPassword() {
        return keyPassword;
    }

    public void setKeyPassword(String keyPassword) {
        this.keyPassword = keyPassword;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String keyMemo) {
        this.memo = memo;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
