package meterReading.entity;
import java.lang.*;

public class UserInfo {
    private String id;
    private String name;
    private int building;
    private String door;
    private String phone;
    private String mobilephone;
    private String workunit;
    private boolean permanent;
    private boolean valid;
    public UserInfo(){}
    public UserInfo(String id,String name,int building,String door,String phone ,String mobilephone,String workunit,boolean permanent,boolean valid){
        this.id = id;
        this.name = name;
        this.building = building;
        this.door = door;
        this.phone = phone;
        this.mobilephone = mobilephone;
        this.permanent = permanent;
        this.valid = valid;
    }

    public java.lang.String getId() {
        return id;
    }

    public void setId(java.lang.String id) {
        this.id = id;
    }

    public java.lang.String getName() {
        return name;
    }

    public void setName(java.lang.String name) {
        this.name = name;
    }

    public int getBuilding() {
        return building;
    }

    public void setBuilding(int building) {
        this.building = building;
    }

    public java.lang.String getDoor() {
        return door;
    }

    public void setDoor(java.lang.String door) {
        this.door = door;
    }

    public java.lang.String getPhone() {
        return phone;
    }

    public void setPhone(java.lang.String phone) {
        this.phone = phone;
    }

    public java.lang.String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(java.lang.String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public java.lang.String getWorkunit() {
        return workunit;
    }

    public void setWorkunit(java.lang.String workunit) {
        this.workunit = workunit;
    }

    public boolean getPermanent() {
        return permanent;
    }

    public void setPermanent(boolean permanent) {
        this.permanent = permanent;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }
}
