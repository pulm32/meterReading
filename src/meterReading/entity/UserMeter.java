package meterReading.entity;

public class UserMeter {
    private String userId;
    private String meterId;

    public UserMeter(){}
    public UserMeter(String userId,String meterId){
        this.userId = userId;
        this.meterId = meterId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMeterId() {
        return meterId;
    }

    public void setMeterId(String meterId) {
        this.meterId = meterId;
    }
}
